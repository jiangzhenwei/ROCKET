#pragma ident "$Id: SolverPPPUC.cpp 2645 2012-11-05 03:23:24Z shjzhang $"

/**
 * @file SolverPPPUC.cpp
 * Class to compute the PPP Solution by fixing the ambiguities.
 */

//============================================================================
//
//  This file is part of GPSTk, the GPS Toolkit.
//
//  The GPSTk is free software; you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published
//  by the Free Software Foundation; either version 2.1 of the License, or
//  any later version.
//
//  The GPSTk is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with GPSTk; if not, write to the Free Software Foundation,
//  Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//  Shoujian Zhang - Wuhan University, 2012  
//
//============================================================================
//  
//  Revision
//
//  2014/03/01      created this program to process the extended equations
//                  for PPP, which are P1/P2/L1/L2/PW/LW. 
//
//============================================================================


#include "SolverPPPUC.hpp"
#include "MatrixFunctors.hpp"
#include "Stats.hpp"

using namespace std;
using namespace gpstk::StringUtils;

namespace gpstk
{

      // Index initially assigned to this class
   int SolverPPPUC::classIndex = 9300000;


      // Returns an index identifying this object.
   int SolverPPPUC::getIndex() const
   { return index; }


      // Returns a string identifying this object.
   std::string SolverPPPUC::getClassName() const
   { return "SolverPPPUC"; }


      /* Common constructor.
       *
       * @param useNEU   If true, will compute dLat, dLon, dH coordinates;
       *                 if false (the default), will compute dx, dy, dz.
       */
   SolverPPPUC::SolverPPPUC(bool useNEU, bool fixPos)
      : firstTime(true), fixCoordinate(fixPos), 
        initialTropVar(1.0E+9), initialIonoVar(1.0E+9)
   {

         // Set the equation system structure
      setNEU(useNEU);

         // Set the class index
      setIndex();

         // Call initializing method
      Init();

   }  // End of 'SolverPPPUC::SolverPPPUC()'



      // Initializing method.
   void SolverPPPUC::Init(void)
   {

         // Pointer to default stochastic model for troposphere (random walk)
      pTropoStoModel = &tropoModel;

         // Set default coordinates stochastic model (constant)
      setCoordinatesModel( &constantModel );

         // Pointer to default receiver clock stochastic model (white noise)
      pClockStoModel = &whitenoiseModel;

         // Pointer to stochastic model for phase biases
      pAmbiModelL1 = &ambiModelL1;
      pAmbiModelL2 = &ambiModelL2;

         // Pointer to stochastic model for ionospheric delays
      pIonoModel = &ionoModel;


   }  // End of method 'SolverPPPUC::Init()'




      /* Returns a reference to a gnnsSatTypeValue object after
       * solving the previously defined equation system.
       *
       * @param gData    Data object holding the data.
       */
   gnssSatTypeValue& SolverPPPUC::Process(gnssSatTypeValue& gData)
      throw(ProcessingException, SVNumException)
   {

      try
      {

            // Build a gnssRinex object and fill it with data
         gnssRinex g1;
         g1.header = gData.header;
         g1.body = gData.body;

            // Call the Process() method with the appropriate input object
         Process(g1);

            // Update the original gnssSatTypeValue object with the results
         gData.body = g1.body;

         return gData;

      }
      catch(SVNumException& s)
      {
            // Rethrow the SVNumException
         GPSTK_RETHROW(s);
      }
      catch(Exception& u)
      {
            // Throw an exception if something unexpected happens
         ProcessingException e( getClassName() + ":"
                                + StringUtils::asString( getIndex() ) + ":"
                                + u.what() );

         GPSTK_THROW(e);

      }

   }  // End of method 'SolverPPPUC::Process()'


      /* Returns a reference to a gnnsRinex object after solving
       * the previously defined equation system.
       *
       * @param gData     Data object holding the data.
       */
   gnssRinex& SolverPPPUC::Process(gnssRinex& gData)
      throw(ProcessingException, SVNumException)
   {

      try
      {

            // Prepare everything before computing
         preCompute( gData);


            // Call the Compute() method with the defined equation model.
         Compute( gData );


            // Store data after computing
         postCompute( gData);


            // return
         return gData;

      }
      catch(SVNumException& s)
      {

            // Rethrow the SVNumException
         GPSTK_RETHROW(s);

      }
      catch(Exception& u)
      {
            // Throw an exception if something unexpected happens
         ProcessingException e( getClassName() + ":"
                                + StringUtils::asString( getIndex() ) + ":"
                                + u.what() );

         GPSTK_THROW(e);

      }

   }  // End of method 'SolverPPPUC::Process()'


      /* Code to be executed before 'Compute()' method.
       *
       * @param gData    Data object holding the data.
       */
   gnssRinex& SolverPPPUC::preCompute( gnssRinex& gData )
      throw(ProcessingException, SVNumException)
   {

         // Continue ...
      try
      {

            // Get a set with all satellites present in this GDS
         currSatSet = gData.body.getSatID();


            // Firstly, clear the 'varUnknowns'
         varUnknowns.clear();

            // Now, Let's create the satellite-related unknowns
         for(TypeIDSet::const_iterator itType = satIndexedTypes.begin();
             itType != satIndexedTypes.end();
             ++itType)
         {
                // We will work with a copy of current TypeID
             Variable var( (*itType) );

                // Loop the current satellites
             for( SatIDSet::const_iterator itSat = currSatSet.begin();
                  itSat != currSatSet.end();
                  ++itSat )
             {
                    // Set satellite
                 var.setSatellite( (*itSat) );

                    // Insert this variable in 'varUnknowns'
                 varUnknowns.insert(var);
             }

         }

            // Get the number of satellites currently visible
         numCurrentSV =  gData.numSats();

            // Check current SV number
         if( numCurrentSV < 4 )   // For ionospehric delay constraint
         {
               // If epoch must be decimated, we issue an Exception
            SVNumException e("Satellite number is less than 4");
            
               // Throw exception
            GPSTK_THROW(e);

         }

            // Num of Iono
         double numIono = numCurrentSV - 1;

            // Num of Trop
         double numTrop = 1;

            // Total measurement number
         numMeas = 4 * numCurrentSV + numIono + numTrop;
  
            // Number of 'core' variables i.e.  
            // 1 trospheric delay + 3 coordinates + 1 receiver clock 
         numVar = srcIndexedTypes.size();

            // Total number of unknowns is defined as :
            // numVar + numCurrentSV of ionospheric delays + 2*numCurrentSV of ambiguities
         numUnknowns = numVar + 3*numCurrentSV;


            //>The measVector

            // Build the vector of measurements (Prefit-residuals): Code + phase
         measVector.resize(numMeas, 0.0);

            // Get the prefit residuals from 'gData'
         Vector<double> prefitC (gData.getVectorOfTypeID(TypeID::prefitC));
         Vector<double> prefitP2(gData.getVectorOfTypeID(TypeID::prefitP2));
         Vector<double> prefitL1(gData.getVectorOfTypeID(TypeID::prefitL1));
         Vector<double> prefitL2(gData.getVectorOfTypeID(TypeID::prefitL2));

         for( int i=0; i<numCurrentSV; i++ )
         {
            measVector( i                  ) = prefitC(i);
            measVector( i +   numCurrentSV ) = prefitP2(i);
            measVector( i + 2*numCurrentSV ) = prefitL1(i);
            measVector( i + 3*numCurrentSV ) = prefitL2(i);
         }

            //
            // Now, Fill the ionospheric constraints
            //
            
            // Set the initial values as 'ZERO'
         Vector<double> initialIono(numCurrentSV, 0.0);

            // Get initial values from 'gData'
         initialIono = gData.getVectorOfTypeID(TypeID::ionoL1);

         cout << "initialIono" << initialIono << endl;
            
            // Get the elevation
         Vector<double> elev(gData.getVectorOfTypeID(TypeID::elevation));

            // Find max elevation and its index
         int imax;
         double maxElev(0.0);
         for(int i=0; i<numCurrentSV;i++)
         {
             if( elev(i)>maxElev )
             {
                 maxElev = elev(i);
                 imax = i;
             }
         }
            // Refernce satellite for ionospheirc delays 
         double ionoBase( initialIono(imax) );

            // Now, fill the coefficients related to ionospheric delays (ionoL1)
         int c1(0);
         for(int i=0; i<numCurrentSV;i++)
         {
                // If it is not the base index.
             if( i != imax )
             {
                   // Single difference ionospheric delay equation
                measVector(c1 + 4*numCurrentSV) = initialIono(i) - ionoBase;

                   // Index increment
                ++c1;
             }
         }

            //
            // Now, Fill the tropospheric delays constraints
            //

            // Initial Values
         double initialTrop(0.0);

            // Now, get zenith wet delays from 'gData'
         initialTrop = gData.header.source.zwdMap[TypeID::wetMap]; 
         cout << "initialTrop : " << initialTrop << endl; 

            // Fill the measurement 
         measVector( 5*numCurrentSV -1  ) = initialTrop;


            //>Now, Fill the rMatrix

            // Weights matrix
         rMatrix.resize(numMeas, numMeas, 0.0);

            // Now, get the weight from 'gData'
        
         satTypeValueMap dummy(gData.body.extractTypeID(TypeID::weight));

            // Check if weights match
         if ( dummy.numSats() == numCurrentSV )
         {

               // If we have weights information, let's load it
            Vector<double> wVec(gData.getVectorOfTypeID(TypeID::weight));

            for( int i=0; i<numCurrentSV; i++ )
            {
               rMatrix( i,                  i                  ) 
                   = 11.111111*wVec(i); // 1.0/0.3 * 1.0/0.3
               rMatrix( i +   numCurrentSV, i +   numCurrentSV ) 
                   = 11.111111*wVec(i);
               rMatrix( i + 2*numCurrentSV, i + 2*numCurrentSV ) 
                   = 111111.11*wVec(i); // 1.0/0.003 * 1.0/0.003
               rMatrix( i + 3*numCurrentSV, i + 3*numCurrentSV ) 
                   = 111111.11*wVec(i);

            }  // End of 'for( int i=0; i<numCurrentSV; i++ )'

               // Weight for ionospheric delay constraint equation
            int c1 (0);
            for( int i=0; i<numCurrentSV; i++ )
            {
               if(i != imax)
               {
                  rMatrix(c1 + 4*numCurrentSV, c1 + 4*numCurrentSV) 
                      = 1.0/initialIonoVar*wVec(i);

                  ++c1;
               }
            }

               // Weight for tropospheric delays
            rMatrix( 5*numCurrentSV - 1 , 5*numCurrentSV - 1 ) 
                = 1.0/initialTropVar ;




         }
         else
         {
               // Firstly, add the covariance matrix for P1/P2/L1/L2
            for( int i=0; i<numCurrentSV; i++ )
            {
               rMatrix( i,                  i                  ) 
                   = 11.111111; // 1.0/0.3 * 1.0/0.3
               rMatrix( i +   numCurrentSV, i +   numCurrentSV ) 
                   = 11.111111;
               rMatrix( i + 2*numCurrentSV, i + 2*numCurrentSV ) 
                   = 111111.11; // 1.0/0.003 * 1.0/0.003
               rMatrix( i + 3*numCurrentSV, i + 3*numCurrentSV ) 
                   = 111111.11;
            }

               // Weight for ionospheric delay constraint equation
            int c1 (0);
            for( int i=0; i<numCurrentSV; i++ )
            {
               if(i != imax)
               {
                  rMatrix(c1 + 4*numCurrentSV, c1 + 4*numCurrentSV) 
                      = 1.0/initialIonoVar;

                  ++c1;
               }
            }

               // Weight for tropospheric delays
            rMatrix( 5*numCurrentSV - 1 , 5*numCurrentSV - 1 ) 
                = 1.0/initialTropVar ;


         }

            //>Now, Fill the hMatrix

            // Generate the corresponding geometry/design matrix
         hMatrix.resize(numMeas, numUnknowns, 0.0);

            // Get the values corresponding to 'core' variables
         Matrix<double> dMatrix(gData.body.getMatrixOfTypes(srcIndexedTypes));

            // Let's fill 'hMatrix'
         for( int i=0; i<numCurrentSV; i++ )
         {
               // First, fill the coefficients related to tropo, coord and clock
            for( int j=0; j<numVar; j++ )
            {

               hMatrix( i                 , j ) = dMatrix(i,j); // C1 or P1
               hMatrix( i +   numCurrentSV, j ) = dMatrix(i,j); // P2
               hMatrix( i + 2*numCurrentSV, j ) = dMatrix(i,j); // L1
               hMatrix( i + 3*numCurrentSV, j ) = dMatrix(i,j); // L2
            }

         }  // End of 'for( int i=0; i<numCurrentSV; i++ )'


            // Now, fill the coefficients related to ionospheric delays (ionoL1)
         int count1(0);
         for( SatIDSet::const_iterator itSat = currSatSet.begin();
              itSat != currSatSet.end();
              ++itSat )
         {
            hMatrix( count1                 , numVar + count1 ) = 1.0; // P1
            hMatrix( count1 +   numCurrentSV, numVar + count1 ) = 1.646944444; // P2
            hMatrix( count1 + 2*numCurrentSV, numVar + count1 ) =-1.0; // L1
            hMatrix( count1 + 3*numCurrentSV, numVar + count1 ) =-1.646944444;  // L2

               // number increment
            ++count1;

         }  // End of 'for( itSat = currSatSet.begin(); ... )'

            // Now, fill the coefficients related to ambiguities 
         count1 = 0;
         for( SatIDSet::const_iterator itSat = currSatSet.begin();
              itSat != currSatSet.end();
              ++itSat )
         {
              // ambL1 are listed after ( srcIndexedTypes + ionoL1 )
            hMatrix( count1 + 2*numCurrentSV, numVar +   numCurrentSV + count1 ) 
                = +0.190293672798;
            hMatrix( count1 + 3*numCurrentSV, numVar + 2*numCurrentSV + count1 ) 
                = +0.244210213425;

              // Increment
            ++count1;

         }  // End of 'for( itSat = currSatSet.begin(); ... )'

            
            // Now, fill the coefficients related to ionospheric delays (ionoL1)
         count1 = 0;
         for(int i=0; i<numCurrentSV;i++)
         {
                // If it is not the base index.
             if( i != imax )
             {
                   // Single difference ionospheric delay equation
                hMatrix(count1 + 4*numCurrentSV, numVar + i   ) =  1.0;
                hMatrix(count1 + 4*numCurrentSV, numVar + imax) = -1.0;

                   // Index increment
                ++count1;
             }

         }  // End of 'for( itSat = currSatSet.begin(); ... )'

            // Now, fill tropospheric delay equation coefficients
         hMatrix( 5*numCurrentSV-1, 0) = 1.0;


            // Now, Fill the phiMatrix and qMatrix

            // State Transition Matrix (PhiMatrix)
         phiMatrix.resize(numUnknowns, numUnknowns, 0.0);

            // Noise covariance matrix (QMatrix)
         qMatrix.resize(numUnknowns, numUnknowns, 0.0);


            // Now, let's fill the Phi and Q matrices
         SatID  dummySat;

            // First, the troposphere
         pTropoStoModel->Prepare( dummySat,
                                  gData );
         phiMatrix(0,0) = pTropoStoModel->getPhi();
         qMatrix(0,0)   = pTropoStoModel->getQ();

            // If the coordinate is unknown.
         if( !fixCoordinate )
         {
               // Second, the coordinates
            pCoordXStoModel->Prepare(dummySat, gData);
            phiMatrix(1,1) = pCoordXStoModel->getPhi();
            qMatrix(1,1)   = pCoordXStoModel->getQ();

            pCoordYStoModel->Prepare(dummySat, gData);
            phiMatrix(2,2) = pCoordYStoModel->getPhi();
            qMatrix(2,2)   = pCoordYStoModel->getQ();

            pCoordZStoModel->Prepare(dummySat, gData);
            phiMatrix(3,3) = pCoordZStoModel->getPhi();
            qMatrix(3,3)   = pCoordZStoModel->getQ();

               // Third, the receiver clock
            pClockStoModel->Prepare( dummySat,
                                     gData );
            phiMatrix(4,4) = pClockStoModel->getPhi();
            qMatrix(4,4)   = pClockStoModel->getQ();

         }
         else
         {
               // Third, the receiver clock
            pClockStoModel->Prepare( dummySat,
                                     gData );
            phiMatrix(1,1) = pClockStoModel->getPhi();
            qMatrix(1,1)   = pClockStoModel->getQ();

         }  // End of 'if( !fixCoordinate )'


            // Now, fill the ionospheric delays
         int count2(numVar);     
         for( SatIDSet::const_iterator itSat = currSatSet.begin();
              itSat != currSatSet.end();
              ++itSat )
         {
               // Prepare stochastic model
            pIonoModel->Prepare( *itSat,
                                 gData );

               // Get values into phi and q matrices
            phiMatrix(count2,count2) = pIonoModel->getPhi();
            qMatrix(count2,count2)   = pIonoModel->getQ();

            ++count2;
         }

            // Now, fill the ambiguity on L1
         count2 = (numVar + numCurrentSV);     
         for( SatIDSet::const_iterator itSat = currSatSet.begin();
              itSat != currSatSet.end();
              ++itSat )
         {
               // Prepare stochastic model
            pAmbiModelL1->Prepare( *itSat,
                                   gData );

               // Get values into phi and q matrices
            phiMatrix(count2,count2) = pAmbiModelL1->getPhi();
            qMatrix(count2,count2)   = pAmbiModelL1->getQ();

            ++count2;
         }

            // Now, fill the ambiguity on WL
         count2 = (numVar + 2*numCurrentSV);     
         for( SatIDSet::const_iterator itSat = currSatSet.begin();
              itSat != currSatSet.end();
              ++itSat )
         {
               // Prepare stochastic model
            pAmbiModelL2->Prepare( *itSat,
                                   gData );

               // Get values into phi and q matrices
            phiMatrix(count2,count2) = pAmbiModelL2->getPhi();
            qMatrix(count2,count2)   = pAmbiModelL2->getQ();

            ++count2;
         }


            // Feed the filter with the correct state and covariance matrix
         if(firstTime)
         {

            Vector<double> initialState(numUnknowns, 0.0);
            Matrix<double> initialErrorCovariance( numUnknowns,
                                                   numUnknowns,
                                                   0.0 );

               // Fill the initialErrorCovariance matrix

               // First, the zenital wet tropospheric delay
            initialErrorCovariance(0,0) = 0.25;          // (0.5 m)**2

            if( !fixCoordinate )
            {
                  // Second, the coordinates
               for( int i=1; i<4; i++ )
               {
                  initialErrorCovariance(i,i) = 0.25;       // (0.5 m)**2
               }

               initialErrorCovariance(4,4) = 9.0e10;
            }
            else
            {
               initialErrorCovariance(1,1) = 9.0e10;
            }

               // Third, the ionospheric delays
            for( int i=numVar; i<numVar+numCurrentSV; i++ )
            {
               initialErrorCovariance(i,i) = 2500;     // (50 m)**2
            }

               // Finally, the ambiguities 
            for( int i=numVar+numCurrentSV; i<numUnknowns; i++ )
            {
               initialErrorCovariance(i,i) = 4.0e14;     // (20000 km)**2
            }

               // Reset Kalman filter state and covariance matrix
            xhat = initialState; 
            P    = initialErrorCovariance;

               // No longer first time
            firstTime = false;

         }
         else
         {

               // Adapt the size to the current number of unknowns
            Vector<double> currentState(numUnknowns, 0.0);
            Matrix<double> currentErrorCov(numUnknowns, numUnknowns, 0.0);


               // Firstly, fill the state and covariance matrix for 
               // source-indexed variables
            for( int i=0; i<numVar; i++ )
            {
               currentState(i) = solution(i);

                  // This fills the upper left quadrant of covariance matrix
               for( int j=0; j<numVar; j++ )
               {
                  currentErrorCov(i,j) =  covMatrix(i,j);
               }
            }

               // Then, Fill the state and covariance matrix for 
               // satellite-indexed variables

            int c1(numVar);      // Set an index

            for( VariableSet::const_iterator itVar = varUnknowns.begin();
                 itVar != varUnknowns.end();
                 ++itVar )
            {
               currentState(c1) = stateMap[ (*itVar) ];
               ++c1;
            }

               // Fill the covariance matrix

               // We need a copy of 'varUnknowns'
            VariableSet tempSet( varUnknowns );

            c1 = numVar;         // Reset 'c1' index

            for( VariableSet::const_iterator itVar1 = varUnknowns.begin();
                 itVar1 != varUnknowns.end();
                 ++itVar1 )
            {

                     // Check if '(*itVar2)' belongs to 'covarianceMap'
               if( covarianceMap.find( (*itVar1) ) != covarianceMap.end()  )
               {
                     // Fill the diagonal element
                  currentErrorCov(c1, c1) 
                      = covarianceMap[ (*itVar1) ].satIndexedVarCov[ (*itVar1) ];
               }
               else
               {
                  currentErrorCov(c1, c1) 
                      = (*itVar1).getInitialVariance();
               }

               int c2(c1+1);      // Set 'j' index

                  // Remove current Variable from 'tempSet'
               tempSet.erase( (*itVar1) );

               for( VariableSet::const_iterator itVar2 = tempSet.begin();
                    itVar2 != tempSet.end();
                    ++itVar2 )
               {

                        // If it belongs, get element from 'covarianceMap'
                     currentErrorCov(c1, c2) =
                        currentErrorCov(c2, c1) =
                           covarianceMap[ (*itVar1) ].satIndexedVarCov[ (*itVar2) ];

                  ++c2;
               }

                  // Now, Fill the covariance of source-indexed variables and
                  // satellite-indexed variables

                  // covariance matrix. This fills the lower left and upper
                  // right quadrants of covariance matrix
               int c3(0);
               for( TypeIDSet::const_iterator itType  = srcIndexedTypes.begin();
                    itType != srcIndexedTypes.end();
                    ++itType )
               {
                     currentErrorCov(c1,c3) =  
                         currentErrorCov(c3,c1) = 
                            covarianceMap[ (*itVar1) ].srcIndexedVarCov[ (*itType) ];

                  ++c3;
               }

               ++c1;

            }  // End of for( VariableSet::const_iterator itVar1 = varUnknowns...'

               // Reset Kalman filter to current state and covariance matrix
            xhat = currentState;
            P    = currentErrorCov;

         }  // End of 'if(firstTime)'

      }
      catch(SVNumException& s)
      {

            // Rethrow the SVNumException
         GPSTK_RETHROW(s);

      }
      catch(Exception& u)
      {
            // Throw an exception if something unexpected happens
         ProcessingException e( getClassName() + ":"
                                + StringUtils::asString( getIndex() ) + ":"
                                + u.what() );

         GPSTK_THROW(e);

      }

      return gData;

   }  // End of method 'SolverPPPUC::preCompute()'



      // Compute the solution of the given equations set.
      //
      // @param gData    Data object holding the data.
      //
      // \warning A typical kalman filter will be devided into 
      // two different phase, the prediction and the correction.
      // for some special application, for example, the 'integer'
      // satellite and receiver clock/bias estimation, the ambiguity
      // constraints are generated using the 'predicted' ambiguity 
      // values and its variances. 
      //
   gnssRinex& SolverPPPUC::Compute( gnssRinex& gData )
      throw(InvalidSolver)
   {

         // Call the TimeUpdate() of the kalman filter, which will predict the 
         // state vector and their covariance matrix
      TimeUpdate( phiMatrix, qMatrix );

         // Call the MeasUpdate() of the kalman filter, which will update the 
         // state vector and their covariance using new measurements.
      MeasUpdate( measVector, hMatrix, rMatrix );

         // Return  
      return gData;

   }  // End of method 'SolverPPPUC::Compute()'


    

      // Predict the state vector and covariance matrix
      //
      // @param gData    Data object holding the data.
      //
   int SolverPPPUC::TimeUpdate( const Matrix<double>& phiMatrix,
                                const Matrix<double>& processNoiseCovariance )
      throw(InvalidSolver)
   {

         // Check whether the phiMatrix is square
      if (!(phiMatrix.isSquare()))
      {
         InvalidSolver e("phiMatrix is not square");
         GPSTK_THROW(e);
      }


      int stateSize(xhat.size());
      if(!(stateSize==numUnknowns))
      {
         InvalidSolver e("TimeUpdate(): Size of a posteriori state estimation vector \
do not match the number of unknowns");
         GPSTK_THROW(e);
      }


      int phiRow = static_cast<int>(phiMatrix.rows());
      if (!(phiRow==numUnknowns))
      {
         InvalidSolver e("Number of unknowns does not match dimension \
of phiMatrix");
         GPSTK_THROW(e);
      }

      if (!(qMatrix.isSquare()))
      {
         InvalidSolver e("qMatrix is not square");
         GPSTK_THROW(e);
      }

      int qRow = static_cast<int>(qMatrix.rows());
      if (!(qRow==numUnknowns))
      {
         InvalidSolver e("Number of unknowns does not match dimension \
of qMatrix");
         GPSTK_THROW(e);
      }

      try
      {
            // Compute the a priori state vector
         xhatminus = phiMatrix*xhat;

         Matrix<double> phiT(transpose(phiMatrix));

            // Compute the a priori estimate error covariance matrix
         Pminus = phiMatrix*P*phiT + processNoiseCovariance;

      }
      catch(...)
      {
         InvalidSolver e("TimeUpdate(): Unable to predict next state.");
         GPSTK_THROW(e);
         return -1;
      }
        
      return 0;

   }  // End of method 'SolverPPPUC::TimeUpdate()'



      // Correct the state vector and covariance matrix
      //
      // @param gData    Data object holding the data.
      //
   int SolverPPPUC::MeasUpdate( const Vector<double>& prefitResiduals,
                                const Matrix<double>& designMatrix,
                                const Matrix<double>& weightMatrix )
      throw(InvalidSolver)
   {

         // By default, results are invalid
      valid = false;

      if (!(weightMatrix.isSquare()))
      {
         InvalidSolver e("MeasUpdate(): Weight matrix is not square");
         GPSTK_THROW(e);
      }


      int wRow = static_cast<int>(weightMatrix.rows());
      int pRow = static_cast<int>(prefitResiduals.size());
      if (!(wRow==pRow))
      {
         InvalidSolver e("MeasUpdate(): prefitResiduals size does not match dimension of \
weightMatrix");
         GPSTK_THROW(e);
      }


      int gRow = static_cast<int>(designMatrix.rows());
      if (!(gRow==pRow))
      {
         InvalidSolver e("MeasUpdate(): prefitResiduals size does not match \
dimension of designMatrix");
         GPSTK_THROW(e);
      }


      int gCol = static_cast<int>(designMatrix.cols());
      int aprioriStateRow = static_cast<int>(xhatminus.size());
      if (!(gCol==aprioriStateRow))
      {
         InvalidSolver e("MeasUpdate(): designMatrix size and a priori state \
estimation vector do not match.");
         GPSTK_THROW(e);
      }


      int pMCol = static_cast<int>(Pminus.cols());
      if ( pMCol != aprioriStateRow )
      {
         InvalidSolver e("MeasUpdate(): Sizes of a priori error covariance \
matrix and a priori state estimation vector do not match.");
         GPSTK_THROW(e);
      }


         // After checking sizes, let's do the real correction work
      Matrix<double> invPMinus;
      Matrix<double> designMatrixT( transpose(designMatrix) );

      try
      {
         invPMinus = inverseChol(Pminus);
      }
      catch(...)
      {
         InvalidSolver e("MeasUpdate(): Unable to compute invPMinus matrix.");
         GPSTK_THROW(e);
         return -1;
      }

      try
      {

         Matrix<double> invTemp( designMatrixT * weightMatrix * designMatrix +
                                 invPMinus );

            // Compute the a posteriori error covariance matrix
         P = inverseChol( invTemp );

      }
      catch(...)
      {
         InvalidSolver e("MeasUpdate(): Unable to compute P matrix.");
         GPSTK_THROW(e);
         return -1;
      }

      try
      {

            // Compute the a posteriori state estimation
         xhat = P * ( (designMatrixT * weightMatrix * prefitResiduals) + 
                      (invPMinus * xhatminus) );

      }
      catch(Exception e)
      {
         InvalidSolver eis("MeasUpdate(): Unable to compute xhat.");
         GPSTK_THROW(eis);
         return -1;
      }

      solution = xhat;
      covMatrix = P;

         // Compute the postfit residuals Vector
      postfitResiduals = prefitResiduals - (designMatrix * solution);

         // If everything is fine so far, then the results should be valid
      valid = true;

      return 0;

   }  // End of method 'SolverPPPUC::MeasUpdate()'


      /* Code to be executed after 'Compute()' method.
       *
       * @param gData    Data object holding the data.
       */
   gnssRinex& SolverPPPUC::postCompute( gnssRinex& gData )
      throw(ProcessingException)
   {

      try
      {
            // Clean up values in 'stateMap' and 'covarianceMap'
         stateMap.clear();
         covarianceMap.clear();

            // Store values of current state

         int i(numVar);      // Set an index

         for( VariableSet::const_iterator itVar = varUnknowns.begin();
              itVar != varUnknowns.end();
              ++itVar )
         {

            stateMap[ (*itVar) ] = solution(i);
            ++i;
         }

            // Store values of covariance matrix

            // We need a copy of 'varUnknowns'
         VariableSet tempSet( varUnknowns );

         i = numVar;         // Reset 'i' index

         for( VariableSet::const_iterator itVar1 = varUnknowns.begin();
              itVar1 != varUnknowns.end();
              ++itVar1 )
         {

               // Fill the diagonal element
            covarianceMap[ (*itVar1) ].satIndexedVarCov[ (*itVar1) ] 
                                                        = covMatrix(i, i);

            int j(i+1);      // Set 'j' index

               // Remove current Variable from 'tempSet'
            tempSet.erase( (*itVar1) );

            for( VariableSet::const_iterator itVar2 = tempSet.begin();
                 itVar2 != tempSet.end();
                 ++itVar2 )
            {

               covarianceMap[ (*itVar1) ].satIndexedVarCov[ (*itVar2) ] 
                                                        = covMatrix(i, j);

               ++j;
            }

               // Store variables X ambiguities covariances
            int k(0);
            for( TypeIDSet::const_iterator itType = srcIndexedTypes.begin();
                 itType != srcIndexedTypes.end();
                 ++itType )
            {

               covarianceMap[(*itVar1)].srcIndexedVarCov[*itType] 
                                                        = covMatrix(i,k);

               ++k;
            }

            ++i;

         }  // End of for( VariableSet::const_iterator itVar1 = unkSet...'



            // Get the number of satellites currently visible
         numCurrentSV = gData.numSats();


            // Now we have to add the new values to the data structure
         Vector<double> postfitC(numCurrentSV,0.0);
         Vector<double> postfitP2(numCurrentSV,0.0);
         Vector<double> postfitL1(numCurrentSV,0.0);
         Vector<double> postfitL2(numCurrentSV,0.0);

         for( int i=0; i<numCurrentSV; i++ )
         {
            postfitC(i)  = postfitResiduals( i                  );
            postfitP2(i) = postfitResiduals( i +   numCurrentSV );
            postfitL1(i) = postfitResiduals( i + 2*numCurrentSV );
            postfitL2(i) = postfitResiduals( i + 3*numCurrentSV );
         }

         gData.insertTypeIDVector(TypeID::postfitC, postfitC);
         gData.insertTypeIDVector(TypeID::postfitP2, postfitP2);
         gData.insertTypeIDVector(TypeID::postfitL1, postfitL1);
         gData.insertTypeIDVector(TypeID::postfitL2, postfitL2);


            // Now, get the ionoL1/BL1/BL2from 'currentState'
         Vector<double> ionoL1(numCurrentSV,0.0);
         Vector<double> BL1(numCurrentSV,0.0);
         Vector<double> BL2(numCurrentSV,0.0);
         Vector<double> BLC(numCurrentSV,0.0);
         Vector<double> BWL(numCurrentSV,0.0);

            // Get ionospheric delays from solution
         for( int i=0; i<numCurrentSV; i++ )
         {
             ionoL1(i) = solution(numVar                  + i);
             BL1(i)    = solution(numVar +   numCurrentSV + i) ; 
             BL2(i)    = solution(numVar + 2*numCurrentSV + i) ;
         }

         double f1 = 1575.42e6;
         double f2 = 1227.60e6;

            // BL2 
         BWL = BL1 - BL2;
         BLC = BL1 + f2/(f1-f2)*BWL;

         BWL = 0.861918400322*BWL;
         BLC = 0.106953378142*BLC;

            // Now, insert ionoL1/BL1/BWL into 'gData'
         gData.insertTypeIDVector(TypeID::ionoL1, ionoL1);
         gData.insertTypeIDVector(TypeID::BL1, BL1);
         gData.insertTypeIDVector(TypeID::BL2, BL2);
         gData.insertTypeIDVector(TypeID::BLC, BLC);
         gData.insertTypeIDVector(TypeID::BWL, BWL);

            // Get a set with all satellites present in this GDS
         currSatSet = gData.body.getSatID();


      }
      catch(Exception& u)
      {
            // Throw an exception if something unexpected happens
         ProcessingException e( getClassName() + ":"
                                + StringUtils::asString( getIndex() ) + ":"
                                + u.what() );

         GPSTK_THROW(e);

      }

      return gData;

   }  // End of method 'SolverPPPUC::postCompute()'



      /* Sets if a NEU system will be used.
       *
       * @param useNEU  Boolean value indicating if a NEU system will
       *                be used
       *
       */
   SolverPPPUC& SolverPPPUC::setNEU( bool useNEU )
   {

         //>Firstly, fill the types that are source-indexed 

         // Watch out here: 'srcIndexedTypes' is a 'std::set', and all sets order their
         // elements. According to 'TypeID' class, this is the proper order:
      srcIndexedTypes.insert(TypeID::wetMap);  // BEWARE: The first is wetMap!!!

         // Only the 'fixCoordinate' is false, the unknown coordinate types 
         // (dLat, dLon, dH) or (dx,dy,dz), will be inserted into 
         // 'srcIndexedTypes'.
      if( !fixCoordinate )
      {
         if (useNEU)
         {
            srcIndexedTypes.insert(TypeID::dLat); // #2
            srcIndexedTypes.insert(TypeID::dLon); // #3
            srcIndexedTypes.insert(TypeID::dH);   // #4
         }
         else
         {
            srcIndexedTypes.insert(TypeID::dx);   // #2
            srcIndexedTypes.insert(TypeID::dy);   // #3
            srcIndexedTypes.insert(TypeID::dz);   // #4
         }
      }
      srcIndexedTypes.insert(TypeID::cdt); // #5
      

         //>Then, fill the types that are satellite-indexed

         // The order of the elment is as follows:
      satIndexedTypes.insert(TypeID::ionoL1); // #2
      satIndexedTypes.insert(TypeID::BL1);    // #3
      satIndexedTypes.insert(TypeID::BL2);    // #4

         // Now, we build the basic equation definition
      defaultEqDef.header = TypeID::prefitC;
      defaultEqDef.body = srcIndexedTypes;

      return (*this);

   }  // End of method 'SolverPPPUC::setNEU()'


      /* Sets if the coordinate is fixed as known
       *
       * @param fixPos  Boolean value 
       *
       */
   SolverPPPUC& SolverPPPUC::setFixCoordinate( bool fixPos)
   {

          // set the 'fixCoordinate'
       fixCoordinate = fixPos;

          // do nothing until now
       return (*this);
       
   }  // End of method 'SolverPPPUC::setFixCoordinate'



      /* Set a single coordinates stochastic model to ALL coordinates.
       *
       * @param pModel      Pointer to StochasticModel associated with
       *                    coordinates.
       *
       * @warning Do NOT use this method to set the SAME state-aware
       * stochastic model (like RandomWalkModel, for instance) to ALL
       * coordinates, because the results will certainly be erroneous. Use
       * this method only with non-state-aware stochastic models like
       * 'StochasticModel' (constant coordinates) or 'WhiteNoiseModel'.
       */
   SolverPPPUC& SolverPPPUC::setCoordinatesModel( StochasticModel* pModel )
   {

         // All coordinates will have the same model
      pCoordXStoModel = pModel;
      pCoordYStoModel = pModel;
      pCoordZStoModel = pModel;

      return (*this);

   }  // End of method 'SolverPPPUC::setCoordinatesModel()'


      /** Return the CURRENT number of satellite.
       */
   int SolverPPPUC::getCurrentSatNumber() const
      throw(InvalidRequest)
   {
         // Return current fixed satellite number
      return numCurrentSV;
   }



}  // End of namespace gpstk
