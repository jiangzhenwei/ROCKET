/*
 * Test for Earth Gravitation Model.
 *
 * Test Time: 2015/01/01, 12h, 0m, 0s, GPS
 *
 * Test Satellite: GPS PRN 01
 *
 * Earth Gravitation Model: EGM2008 (12*12)
 *
 * Solid Tide: IERS 2010
 * Ocean Tide: FES  2004
 * Pole  Tide: IERS 2010
 *
 * Earth Gravitation:
 *    -0.360570588840239 0.422750533046874 -0.081804961226428
 *
 */

#include <iostream>

#include "ConfDataReader.hpp"

#include "EGM08GravityModel.hpp"
#include "SolarSystem.hpp"

#include "SP3EphemerisStore.hpp"
#include "SatDataReader.hpp"

#include "CivilTime.hpp"

using namespace std;
using namespace gpstk;


int main(void)
{
    // Conf File
    ConfDataReader confReader;

    try
    {
        confReader.open("../../ROCKET/oldtests/test.conf");
    }
    catch(...)
    {
        cerr << "Conf File open error." << endl;

        return 1;
    }

    // EOP File
    EOPDataStore eopDataStore;
    string eopFile = confReader.getValue("IERSEOPFILE", "DEFAULT");
    try
    {
        eopDataStore.loadIERSFile(eopFile);
    }
    catch(...)
    {
        cerr << "EOP File Load Error." << endl;

        return 1;
    }
    
    // LeapSecond file
    LeapSecStore leapSecStore;
    string lsFile  = confReader.getValue("IERSLSFILE", "DEFAULT");
    try
    {
        leapSecStore.loadFile(lsFile);
    }
    catch(...)
    {
        cerr << "Leap Second File Load Error." << endl;

        return 1;
    }


    // Reference System
    ReferenceSystem refSys;
    refSys.setEOPDataStore(eopDataStore);
    refSys.setLeapSecStore(leapSecStore);

    // Solar System
    SolarSystem solSys;
    string ephFile = confReader.getValue("JPLEPHFILE", "DEFAULT");
    try
    {
       solSys.initializeWithBinaryFile(ephFile);
    }
    catch(...)
    {
       cerr << "Solar System Initialize Error." << endl;

       return 1;
    }

    // SatID
    SatID sat(1,SatID::systemGPS);

    // Initial Time
    CivilTime ct(2015,1,1,12,0,0.0, TimeSystem::GPS);
    CommonTime gps( ct.convertToCommonTime() );
    CommonTime utc( refSys.GPS2UTC(gps) );

    // SP3 File
    SP3EphemerisStore sp3Eph;
    sp3Eph.rejectBadPositions(true);
    sp3Eph.setPosGapInterval(900+1);
    sp3Eph.setPosMaxInterval(9*900+1);

    string sp3File;
    while( (sp3File = confReader.fetchListValue("IGSSP3LIST", "DEFAULT")) != "" )
    {
        try
        {
            sp3Eph.loadFile(sp3File);
        }
        catch(...)
        {
            cerr << "IGS SP3 File Load Error." << endl;

            return 1;
        }
    }
    

    // Position and Velocity in ITRS
    Vector<double> r_itrs, v_itrs;

    try
    {
        r_itrs = sp3Eph.getXvt(sat, gps).x.toVector();
        v_itrs = sp3Eph.getXvt(sat, gps).v.toVector();
    }
    catch(...)
    {
        cerr << "Get Position and Velocity from SP3 File Error." << endl;

        return 1;
    }

    // Transform Matrix
    Matrix<double> c2t ( refSys.C2TMatrix(utc)  );
    // Transform Matrix Time Dot
    Matrix<double> dc2t( refSys.dC2TMatrix(utc) );

    // Position and Velocity in ICRS
    Vector<double> r_icrs = transpose(c2t) * r_itrs;
    Vector<double> v_icrs = transpose(c2t) * v_itrs + transpose(dc2t) * r_itrs;


    // Initial State: r0, v0
    Vector<double> rv0(6,0.0);
    rv0(0) = r_icrs(0); rv0(1) = r_icrs(1); rv0(2) = r_icrs(2);
    rv0(3) = v_icrs(0); rv0(4) = v_icrs(1); rv0(5) = v_icrs(2);
//    rv0(0) = 17253546.071; rv0(1) = -19971157.156; rv0(2) = 3645801.329;
//    rv0(3) = 1973.209292;  rv0(4) = 1123.311389;   rv0(5) = -3124.145454;


    // Reference body
    EarthBody eb;

    // Initial State: p0
    Vector<double> p0;

    // SatData File
    SatDataReader satReader;
    string satDataFile = confReader.getValue("SatDataFile", "DEFAULT");
    try
    {
        satReader.open(satDataFile);
    }
    catch(...)
    {
        cerr << "SatData File Open Error." << endl;

        return 1;
    }

    // Spacecraft
    Spacecraft sc;
    sc.setSatID(sat);
    sc.setCurrentTime(utc);
    sc.setBlock(satReader.getBlock(sat,utc));
    sc.setMass(satReader.getMass(sat,utc));
    sc.initStateVector(rv0, p0);

    cout << fixed << setprecision(15);

    // Earth Gravitation
    EGM08GravityModel egm;

    // EGM Degree and Order
    int EGMDEG = confReader.getValueAsInt("EGMDEG", "DEFAULT");
    int EGMORD = confReader.getValueAsInt("EGMORD", "DEFAULT");

    egm.setDesiredDegreeOrder(EGMDEG, EGMORD);
    egm.setReferenceSystem(refSys);

    // EGM File
    string egmFile = confReader.getValue("EGMFILE", "DEFAULT");
    try
    {
       egm.loadFile(egmFile);
    }
    catch(...)
    {
       cerr << "EGM File Load Error." << endl;

       return 1;
    }


    // Earth Solid Tide
    EarthSolidTide solidTide;
    solidTide.setReferenceSystem(refSys);
    solidTide.setSolarSystem(solSys);

    egm.setEarthSolidTide(solidTide);


    // Earth Ocean Tide
    EarthOceanTide oceanTide;
    oceanTide.setReferenceSystem(refSys);

    int EOTDEG = confReader.getValueAsInt("EOTDEG", "DEFAULT");
    int EOTORD = confReader.getValueAsInt("EOTORD", "DEFAULT");

    oceanTide.setDesiredDegreeOrder(EOTDEG, EOTORD);

    // EOT File
    string eotFile = confReader.getValue("EOTFILE", "DEFAULT");
    try
    {
       oceanTide.loadFile(eotFile);
    }
    catch(...)
    {
       cerr << "EOT File Load Error." << endl;

       return 1;
    }

    egm.setEarthOceanTide(oceanTide);


    // Earth Pole Tide
    EarthPoleTide poleTide;
    poleTide.setReferenceSystem(refSys);

    egm.setEarthPoleTide(poleTide);

    egm.doCompute(utc, eb, sc);

    cout << "EGM08: " << egm.getAccel() << endl;
    
    return 0;
}
