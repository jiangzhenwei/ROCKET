//============================================================================
//
//  This file is part of GPSTk, the GPS Toolkit.
//
//  The GPSTk is free software; you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published
//  by the Free Software Foundation; either version 3.0 of the License, or
//  any later version.
//
//  The GPSTk is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with GPSTk; if not, write to the Free Software Foundation,
//  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110, USA
//  
//  Copyright 2004, The University of Texas at Austin
//  Kaifa Kuang - Wuhan University . 2016
//
//============================================================================


/**
* @file EarthPoleTide.cpp
* Class to do Earth Solid Tide correction.
* 
*/

#include "EarthPoleTide.hpp"
#include "GNSSconstants.hpp"
#include "MJD.hpp"
#include "Legendre.hpp"

using namespace std;

namespace gpstk
{

      /* Pole tide to normalized earth potential coefficients
       *
       * @param utc     time in UTC
       * @param CS      normalized earth potential coefficients
       */
   void EarthPoleTide::getPoleTide(CommonTime utc, Matrix<double>& CS)
   {
      // compute time in years since J2000
      double MJD_UTC = MJD(utc).mjd;
      double ly1 = (MJD_UTC - MJD_J2000) / 365.25;
      double ly2 = ly1 * ly1;
      double ly3 = ly2 * ly1;

      // Coefficients of the IERS (2010) mean pole model
      // see IERS Conventions 2010, Table 7.7

      // until 2010.0, unit: mas/year
      const double xp1[4] = {  55.974, 1.8243,  0.18413,  0.007024 };
      const double yp1[4] = { 346.346, 1.7896, -0.10729, -0.000908 };
      // after 2010.0, unit: mas/year
      const double xp2[2] = {  23.513,  7.6141 };
      const double yp2[2] = { 358.891, -0.6287 };

      // mean pole, unit: arcsec
      // see IERS Conventions 2010, equation 7.25
      double xpm(0.0), ypm(0.0);
      
      if(MJD_UTC < 55197.0)   // until 2010.0
      {
         xpm = ( xp1[0] + xp1[1]*ly1 + xp1[2]*ly2 + xp1[3]*ly3 )*1e-3;
         ypm = ( yp1[0] + yp1[1]*ly1 + yp1[2]*ly2 + yp1[3]*ly3 )*1e-3;
      }
      else                    // after 2010.0
      {
         xpm = ( xp2[0] + xp2[1]*ly1 )*1e-3;
         ypm = ( yp2[0] + yp2[1]*ly1 )*1e-3;
      }

      // real pole, unit: arcsec
      double xp(0.0), yp(0.0);
      xp = pRefSys->getXPole(utc);
      yp = pRefSys->getYPole(utc);

      // difference of real and mean pole, unit: arcsec
      // see IERS Conventions 2010, equation 7.24
      double m1(0.0), m2(0.0);
      m1 = +(xp - xpm);
      m2 = -(yp - ypm);

      // index for degree = 2 and order = 1
      int id21 = indexTranslator(2,1) - 1;

      // solid earth pole tide
      // see IERS Conventions 2010, section 6.4
      CS(id21, 0) += -1.333e-9 * (m1 + 0.0115*m2);
      CS(id21, 1) += -1.333e-9 * (m2 - 0.0115*m1);

      // ocean pole tide
      // see IERS Conventions 2010, section 6.5
      // only (n,m) = (2,1) considered
      CS(id21, 0) += -2.1778e-10 * (m1 - 0.01724*m2);
      CS(id21, 1) += -1.7232e-10 * (m2 - 0.03365*m1);

   }  // End of method 'EarthPoleTide::getPoleTide()'


}  // End of namespace 'gpstk'
