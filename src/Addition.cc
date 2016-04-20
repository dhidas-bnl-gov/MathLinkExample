////////////////////////////////////////////////////////////////////
//
// Dean Andrew Hidas <dhidas@bnl.gov>
//
// Created on: Wed Apr 13 20:05:34 EDT 2016
//
////////////////////////////////////////////////////////////////////

#include "Addition.h"

#include "mathlink.h"

double AddTwo (double const a, double const b)
{
  return a + b;
}


double AddRealList (double L[], long N)
{
  double sum = 0;

  for (int i = 0; i < N; ++i) {
    sum += L[i];
  }

  return sum;
}


double AddThreeManual ()
{
  double sum = 0;
  double N;

  MLGetReal(stdlink, &N);
  sum += N;
  MLGetReal(stdlink, &N);
  sum += N;
  MLGetReal(stdlink, &N);
  sum += N;

  return sum;
}



