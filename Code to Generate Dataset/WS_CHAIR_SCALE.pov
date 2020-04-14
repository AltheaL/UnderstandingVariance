

// Persistence of Vision Ray Tracer Scene Description File
// File: ws_chair.pov
// Vers: 3
// Desc: Basic Scene Example
// Date: 08/01/97
// Auth: Lance Purple

// This file is hereby placed in the public domain

#version 3

#include "COLORS.INC"
#include "WOODMAPS.INC"
#include "WOODS.INC"

global_settings
{
  assumed_gamma 1.0
}

#declare INCHES = 1.0
#declare FEET   = 12*INCHES

// ----------------------------------------

camera
{ 
    //location <0,40,-80> default forward upright
    //location <-40,40,-80> L position
    //location <-100,40,0> LL position
    
    // Rotation List
    /*
    #if(frame_number=1)
        location <0,40,-80>
    #end
    #if(frame_number=2)
        location <-40,40,-80>
    #end
    #if(frame_number=3)
        location <100,40,0>
    #end
    */    
    
    // Movement List
    location <0,40,-80>
    
    
    
    location <0,40,-80>
    look_at  <0,10,0>
  //location  < 0,  2.8*FEET, -3.5*FEET>
  //look_at   < 0,  0.8*FEET,  1.0*FEET>
}

//plane { y 0       pigment { color White } }
//plane { z 10*FEET pigment { color White } }

light_source
{
  0*x          // light's position (translated below)
  color White  // light's color
  translate <-10*FEET, 15*FEET, -10*FEET>
}

// ----------------------------------------

#declare chair_wood_z    = texture { T_Wood13 finish { phong 0.8 } }
#declare chair_wood_y    = texture { chair_wood_z rotate 90*x }
#declare chair_wood_x    = texture { chair_wood_z rotate 90*y }

// Windsor chair

#declare WindsorChair = union {

  // left front leg
  intersection {
    sphere { < 0, 0, 0 > 1
             scale < 11/16*INCHES, 16*INCHES, 11/16*INCHES>
             texture { chair_wood_y }
             rotate 14*x
             rotate -9*z
           }
    box    { < -4*INCHES, -8.0*INCHES, -3*INCHES >
             <  4*INCHES,  8.4*INCHES,  3*INCHES > }
    translate <-7*INCHES, 8*INCHES, -(6+3/4)*INCHES>
  }

  // right front leg
  intersection {
    sphere { < 0, 0, 0 > 1
             scale < 11/16*INCHES, 16*INCHES, 11/16*INCHES>
             texture { chair_wood_y }
             rotate 14*x
             rotate  9*z
           }
    box    { < -4*INCHES, -8.0*INCHES, -3*INCHES >
             <  4*INCHES,  8.4*INCHES,  3*INCHES > }
    translate < 7*INCHES, 8*INCHES, -(6+3/4)*INCHES>
  }

  // left back leg
  intersection {
    sphere { < 0, 0, 0 > 1
             scale < 11/16*INCHES, 16*INCHES, 11/16*INCHES>
             texture { chair_wood_y }
             rotate -17*x
             rotate -17*z
           }
    box    { < -3*INCHES, -8.0*INCHES, -3*INCHES >
             <  3*INCHES,  7.5*INCHES,  3*INCHES > }
    translate <-7*INCHES, 8*INCHES, (7+1/4)*INCHES>
  }

  // right back leg
  intersection {
    sphere { < 0, 0, 0 > 1
             scale < 11/16*INCHES, 16*INCHES, 11/16*INCHES>
             texture { chair_wood_y }
             rotate -17*x
             rotate  17*z
           }
    box    { < -3*INCHES, -8.0*INCHES, -3*INCHES >
             <  3*INCHES,  7.5*INCHES,  3*INCHES > }
    translate <7*INCHES, 8*INCHES, (7+1/4)*INCHES>
  }

  // left outer leg crossbar
  union {
    cone      { < -7*INCHES, 0, -(6+3/4)*INCHES > (3/16)*INCHES
                < -7*INCHES, 0, -(4+3/4)*INCHES > (1/ 2)*INCHES }
    cylinder  { < -7*INCHES, 0, -(4+3/4)*INCHES >
                < -7*INCHES, 0,  (5+1/4)*INCHES > (1/ 2)*INCHES }
    cone      { < -7*INCHES, 0,  (5+1/4)*INCHES > (1/ 2)*INCHES
                < -7*INCHES, 0,  (7+1/4)*INCHES > (3/16)*INCHES }
    texture   { chair_wood_z }
    translate 8*INCHES*y
  }

  // right outer leg crossbar
  union {
    cone      { <  7*INCHES, 0, -(6+3/4)*INCHES > (3/16)*INCHES
                <  7*INCHES, 0, -(4+3/4)*INCHES > (1/ 2)*INCHES }
    cylinder  { <  7*INCHES, 0, -(4+3/4)*INCHES >
                <  7*INCHES, 0,  (5+1/4)*INCHES > (1/ 2)*INCHES }
    cone      { <  7*INCHES, 0,  (5+1/4)*INCHES > (1/ 2)*INCHES
                <  7*INCHES, 0,  (7+1/4)*INCHES > (3/16)*INCHES }
    texture   { chair_wood_z }
    translate 8*INCHES*y
  }

  // front inner leg crossbar
  union {
    cone      { < -7*INCHES, 0, -(2+1/4)*INCHES > (3/16)*INCHES
                < -5*INCHES, 0, -(2+1/4)*INCHES > (1/ 2)*INCHES }
    cylinder  { < -5*INCHES, 0, -(2+1/4)*INCHES >
                <  5*INCHES, 0, -(2+1/4)*INCHES > (1/2)*INCHES }
    cone      { <  5*INCHES, 0, -(2+1/4)*INCHES > (1/ 2)*INCHES
                <  7*INCHES, 0, -(2+1/4)*INCHES > (3/16)*INCHES }
    texture   { chair_wood_x }
    translate 8*INCHES*y
  }

  // back inner leg crossbar
  union {
    cone      { < -7*INCHES, 0, (2+1/4)*INCHES > (3/16)*INCHES
                < -5*INCHES, 0, (2+1/4)*INCHES > (1/ 2)*INCHES }
    cylinder  { < -5*INCHES, 0, (2+1/4)*INCHES >
                <  5*INCHES, 0, (2+1/4)*INCHES > (1/2)*INCHES }
    cone      { <  5*INCHES, 0, (2+1/4)*INCHES > (1/ 2)*INCHES
                <  7*INCHES, 0, (2+1/4)*INCHES > (3/16)*INCHES }
    texture   { chair_wood_x }
    translate 8*INCHES*y
  }

  // seat
  difference {
    union {
      intersection {
        prism { linear_sweep cubic_spline
               -(1/2)*INCHES, (1/2)*INCHES,
               15,
               <        5*INCHES,       -8*INCHES >,
               <        0*INCHES, -(8+1/2)*INCHES >,
               <       -5*INCHES,       -8*INCHES >,
               < -(7+7/8)*INCHES,       -5*INCHES >,
               < -(8+5/8)*INCHES,    (1/2)*INCHES >,
               < -(8+1/2)*INCHES,  (3+1/2)*INCHES >,
               < -(6+5/8)*INCHES,  (6+5/8)*INCHES >,
               <        0*INCHES,  (9+1/4)*INCHES >,
               <  (6+5/8)*INCHES,  (6+5/8)*INCHES >,
               <  (8+1/2)*INCHES,  (3+1/2)*INCHES >,
               <  (8+5/8)*INCHES,    (1/2)*INCHES >,
               <  (7+7/8)*INCHES,       -5*INCHES >,
               <        5*INCHES,       -8*INCHES >,
               <        0*INCHES, -(8+1/2)*INCHES >,
               <       -5*INCHES,       -8*INCHES >
        }
        box   { < -9*INCHES, -3/4*INCHES,       -9*INCHES >
                <  9*INCHES,  3/4*INCHES,  (3+1/2)*INCHES >
        }
      }
      intersection {
        cylinder { < 0, -1/2*INCHES, 0 >
                   < 0,  1/2*INCHES, 0 > (9+3/8)*INCHES }
        box      { < -9*INCHES, -3/4*INCHES,  (3+1/2)*INCHES >
                   <  9*INCHES,  3/4*INCHES,        9*INCHES >
        }
      }
    }
    sphere   { < 0, (71+7/8)*INCHES, 0 > (72+1/8)*INCHES }
    texture  { chair_wood_z }
    rotate 5*x
    translate < 0, 16*INCHES, 0 >
  }

  // chair back rail

  union {
    difference {
      cylinder { <0, 11*INCHES, -(1/2)*INCHES>
                 <0, 11*INCHES,  (1/2)*INCHES> (9+1/4)*INCHES }
      cylinder { <0, 11*INCHES, -(5/8)*INCHES>
                 <0, 11*INCHES,  (5/8)*INCHES> (8+1/4)*INCHES }
      box      { <-10*INCHES,  (8+1/2)*INCHES, -1*INCHES>
                 < 10*INCHES,        0*INCHES,  1*INCHES> }
      texture { chair_wood_z translate 11*INCHES*y }
    }
    box { <-(1/2)*INCHES,    0*INCHES, -(1/2)*INCHES >
          < (1/2)*INCHES, -9.5*INCHES,  (1/2)*INCHES >
          texture { chair_wood_y }
          rotate  18*z     translate <-(8+2/4)*INCHES, (8+3/4)*INCHES, 0 >
    }
    box { <-(1/2)*INCHES,    0*INCHES, -(1/2)*INCHES >
          < (1/2)*INCHES, -9.5*INCHES,  (1/2)*INCHES >
          texture { chair_wood_y }
          rotate -18*z     translate < (8+2/4)*INCHES, (8+3/4)*INCHES, 0 >
    }

    rotate 20*x
    translate <0, 15*INCHES, (3+1/2)*INCHES>
  }

  // chair back rungs
  #declare rung_1_base = < -6.00*INCHES, 15.99*INCHES, 5.85*INCHES >
  #declare rung_2_base = < -4.50*INCHES, 15.90*INCHES, 6.85*INCHES >
  #declare rung_3_base = < -2.75*INCHES, 15.84*INCHES, 7.60*INCHES >
  #declare rung_4_base = < -0.88*INCHES, 15.80*INCHES, 7.97*INCHES >
  #declare rung_5_base = <  0.88*INCHES, 15.80*INCHES, 7.97*INCHES >
  #declare rung_6_base = <  2.75*INCHES, 15.84*INCHES, 7.60*INCHES >
  #declare rung_7_base = <  4.50*INCHES, 15.90*INCHES, 6.85*INCHES >
  #declare rung_8_base = <  6.00*INCHES, 15.99*INCHES, 5.85*INCHES >

  cylinder { <0, 0, 0> <0, 14.5*INCHES, 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate  12.26*x
             rotate   5.80*z
             translate rung_1_base }

  cylinder { <0, 0, 0> <0, (16.5*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   9.60*x
             rotate   3.68*z
             translate rung_2_base }

  cylinder { <0, 0, 0> <0, (17.5*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   7.84*x
             rotate   2.15*z
             translate rung_3_base }

  cylinder { <0, 0, 0> <0, (18.0*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   7.16*x
             rotate   0.82*z
             translate rung_4_base }

  cylinder { <0, 0, 0> <0, (18.0*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   7.16*x
             rotate  -0.82*z
             translate rung_5_base }

  cylinder { <0, 0, 0> <0, (17.5*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   7.84*x
             rotate  -2.15*z
             translate rung_6_base }

  cylinder { <0, 0, 0> <0, (16.5*INCHES), 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate   9.60*x
             rotate  -3.68*z
             translate rung_7_base }

  cylinder { <0, 0, 0> <0, 14.5*INCHES, 0> (1/4*INCHES)
             texture { chair_wood_y }
             rotate  12.26*x
             rotate  -5.80*z
             translate rung_8_base }

  pigment { color Black } // shouldn't be used
 
}

// -------------------------------------------------------------
/*
object { WindsorChair 
//rotate 30*y
 } 
*/              

    
    
// Scale List
#if(frame_number=1)
object { WindsorChair
    scale <1,1,1>
}
#end
#if(frame_number= 2 )
object { WindsorChair
    scale <1.001 ,1.001 ,1.001>}
#end
#if(frame_number= 3 )
object { WindsorChair
    scale <0.999 ,0.999 ,0.999>}
#end
#if(frame_number= 4 )
object { WindsorChair
    scale <1.002 ,1.002 ,1.002>}
#end
#if(frame_number= 5 )
object { WindsorChair
    scale <0.998 ,0.998 ,0.998>}
#end
#if(frame_number= 6 )
object { WindsorChair
    scale <1.003 ,1.003 ,1.003>}
#end
#if(frame_number= 7 )
object { WindsorChair
    scale <0.997 ,0.997 ,0.997>}
#end
#if(frame_number= 8 )
object { WindsorChair
    scale <1.004 ,1.004 ,1.004>}
#end
#if(frame_number= 9 )
object { WindsorChair
    scale <0.996 ,0.996 ,0.996>}
#end
#if(frame_number= 10 )
object { WindsorChair
    scale <1.005 ,1.005 ,1.005>}
#end
#if(frame_number= 11 )
object { WindsorChair
    scale <0.995 ,0.995 ,0.995>}
#end
#if(frame_number= 12 )
object { WindsorChair
    scale <1.006 ,1.006 ,1.006>}
#end
#if(frame_number= 13 )
object { WindsorChair
    scale <0.994 ,0.994 ,0.994>}
#end
#if(frame_number= 14 )
object { WindsorChair
    scale <1.007 ,1.007 ,1.007>}
#end
#if(frame_number= 15 )
object { WindsorChair
    scale <0.993 ,0.993 ,0.993>}
#end
#if(frame_number= 16 )
object { WindsorChair
    scale <1.008 ,1.008 ,1.008>}
#end
#if(frame_number= 17 )
object { WindsorChair
    scale <0.992 ,0.992 ,0.992>}
#end
#if(frame_number= 18 )
object { WindsorChair
    scale <1.009 ,1.009 ,1.009>}
#end
#if(frame_number= 19 )
object { WindsorChair
    scale <0.991 ,0.991 ,0.991>}
#end
#if(frame_number= 20 )
object { WindsorChair
    scale <1.010 ,1.010 ,1.010>}
#end
#if(frame_number= 21 )
object { WindsorChair
    scale <0.990 ,0.990 ,0.990>}
#end
#if(frame_number= 22 )
object { WindsorChair
    scale <1.011 ,1.011 ,1.011>}
#end
#if(frame_number= 23 )
object { WindsorChair
    scale <0.989 ,0.989 ,0.989>}
#end
#if(frame_number= 24 )
object { WindsorChair
    scale <1.012 ,1.012 ,1.012>}
#end
#if(frame_number= 25 )
object { WindsorChair
    scale <0.988 ,0.988 ,0.988>}
#end
#if(frame_number= 26 )
object { WindsorChair
    scale <1.013 ,1.013 ,1.013>}
#end
#if(frame_number= 27 )
object { WindsorChair
    scale <0.987 ,0.987 ,0.987>}
#end
#if(frame_number= 28 )
object { WindsorChair
    scale <1.014 ,1.014 ,1.014>}
#end
#if(frame_number= 29 )
object { WindsorChair
    scale <0.986 ,0.986 ,0.986>}
#end
#if(frame_number= 30 )
object { WindsorChair
    scale <1.015 ,1.015 ,1.015>}
#end
#if(frame_number= 31 )
object { WindsorChair
    scale <0.985 ,0.985 ,0.985>}
#end
#if(frame_number= 32 )
object { WindsorChair
    scale <1.016 ,1.016 ,1.016>}
#end
#if(frame_number= 33 )
object { WindsorChair
    scale <0.984 ,0.984 ,0.984>}
#end
#if(frame_number= 34 )
object { WindsorChair
    scale <1.017 ,1.017 ,1.017>}
#end
#if(frame_number= 35 )
object { WindsorChair
    scale <0.983 ,0.983 ,0.983>}
#end
#if(frame_number= 36 )
object { WindsorChair
    scale <1.018 ,1.018 ,1.018>}
#end
#if(frame_number= 37 )
object { WindsorChair
    scale <0.982 ,0.982 ,0.982>}
#end
#if(frame_number= 38 )
object { WindsorChair
    scale <1.019 ,1.019 ,1.019>}
#end
#if(frame_number= 39 )
object { WindsorChair
    scale <0.981 ,0.981 ,0.981>}
#end
#if(frame_number= 40 )
object { WindsorChair
    scale <1.020 ,1.020 ,1.020>}
#end
#if(frame_number= 41 )
object { WindsorChair
    scale <0.980 ,0.980 ,0.980>}
#end
#if(frame_number= 42 )
object { WindsorChair
    scale <1.021 ,1.021 ,1.021>}
#end
#if(frame_number= 43 )
object { WindsorChair
    scale <0.979 ,0.979 ,0.979>}
#end
#if(frame_number= 44 )
object { WindsorChair
    scale <1.022 ,1.022 ,1.022>}
#end
#if(frame_number= 45 )
object { WindsorChair
    scale <0.978 ,0.978 ,0.978>}
#end
#if(frame_number= 46 )
object { WindsorChair
    scale <1.023 ,1.023 ,1.023>}
#end
#if(frame_number= 47 )
object { WindsorChair
    scale <0.977 ,0.977 ,0.977>}
#end
#if(frame_number= 48 )
object { WindsorChair
    scale <1.024 ,1.024 ,1.024>}
#end
#if(frame_number= 49 )
object { WindsorChair
    scale <0.976 ,0.976 ,0.976>}
#end
#if(frame_number= 50 )
object { WindsorChair
    scale <1.025 ,1.025 ,1.025>}
#end
#if(frame_number= 51 )
object { WindsorChair
    scale <0.975 ,0.975 ,0.975>}
#end
#if(frame_number= 52 )
object { WindsorChair
    scale <1.026 ,1.026 ,1.026>}
#end
#if(frame_number= 53 )
object { WindsorChair
    scale <0.974 ,0.974 ,0.974>}
#end
#if(frame_number= 54 )
object { WindsorChair
    scale <1.027 ,1.027 ,1.027>}
#end
#if(frame_number= 55 )
object { WindsorChair
    scale <0.973 ,0.973 ,0.973>}
#end
#if(frame_number= 56 )
object { WindsorChair
    scale <1.028 ,1.028 ,1.028>}
#end
#if(frame_number= 57 )
object { WindsorChair
    scale <0.972 ,0.972 ,0.972>}
#end
#if(frame_number= 58 )
object { WindsorChair
    scale <1.029 ,1.029 ,1.029>}
#end
#if(frame_number= 59 )
object { WindsorChair
    scale <0.971 ,0.971 ,0.971>}
#end
#if(frame_number= 60 )
object { WindsorChair
    scale <1.030 ,1.030 ,1.030>}
#end
#if(frame_number= 61 )
object { WindsorChair
    scale <0.970 ,0.970 ,0.970>}
#end
#if(frame_number= 62 )
object { WindsorChair
    scale <1.031 ,1.031 ,1.031>}
#end
#if(frame_number= 63 )
object { WindsorChair
    scale <0.969 ,0.969 ,0.969>}
#end
#if(frame_number= 64 )
object { WindsorChair
    scale <1.032 ,1.032 ,1.032>}
#end
#if(frame_number= 65 )
object { WindsorChair
    scale <0.968 ,0.968 ,0.968>}
#end
#if(frame_number= 66 )
object { WindsorChair
    scale <1.033 ,1.033 ,1.033>}
#end
#if(frame_number= 67 )
object { WindsorChair
    scale <0.967 ,0.967 ,0.967>}
#end
#if(frame_number= 68 )
object { WindsorChair
    scale <1.034 ,1.034 ,1.034>}
#end
#if(frame_number= 69 )
object { WindsorChair
    scale <0.966 ,0.966 ,0.966>}
#end
#if(frame_number= 70 )
object { WindsorChair
    scale <1.035 ,1.035 ,1.035>}
#end
#if(frame_number= 71 )
object { WindsorChair
    scale <0.965 ,0.965 ,0.965>}
#end
#if(frame_number= 72 )
object { WindsorChair
    scale <1.036 ,1.036 ,1.036>}
#end
#if(frame_number= 73 )
object { WindsorChair
    scale <0.964 ,0.964 ,0.964>}
#end
#if(frame_number= 74 )
object { WindsorChair
    scale <1.037 ,1.037 ,1.037>}
#end
#if(frame_number= 75 )
object { WindsorChair
    scale <0.963 ,0.963 ,0.963>}
#end
#if(frame_number= 76 )
object { WindsorChair
    scale <1.038 ,1.038 ,1.038>}
#end
#if(frame_number= 77 )
object { WindsorChair
    scale <0.962 ,0.962 ,0.962>}
#end
#if(frame_number= 78 )
object { WindsorChair
    scale <1.039 ,1.039 ,1.039>}
#end
#if(frame_number= 79 )
object { WindsorChair
    scale <0.961 ,0.961 ,0.961>}
#end
#if(frame_number= 80 )
object { WindsorChair
    scale <1.040 ,1.040 ,1.040>}
#end
#if(frame_number= 81 )
object { WindsorChair
    scale <0.960 ,0.960 ,0.960>}
#end
#if(frame_number= 82 )
object { WindsorChair
    scale <1.041 ,1.041 ,1.041>}
#end
#if(frame_number= 83 )
object { WindsorChair
    scale <0.959 ,0.959 ,0.959>}
#end
#if(frame_number= 84 )
object { WindsorChair
    scale <1.042 ,1.042 ,1.042>}
#end
#if(frame_number= 85 )
object { WindsorChair
    scale <0.958 ,0.958 ,0.958>}
#end
#if(frame_number= 86 )
object { WindsorChair
    scale <1.043 ,1.043 ,1.043>}
#end
#if(frame_number= 87 )
object { WindsorChair
    scale <0.957 ,0.957 ,0.957>}
#end
#if(frame_number= 88 )
object { WindsorChair
    scale <1.044 ,1.044 ,1.044>}
#end
#if(frame_number= 89 )
object { WindsorChair
    scale <0.956 ,0.956 ,0.956>}
#end
#if(frame_number= 90 )
object { WindsorChair
    scale <1.045 ,1.045 ,1.045>}
#end
#if(frame_number= 91 )
object { WindsorChair
    scale <0.955 ,0.955 ,0.955>}
#end
#if(frame_number= 92 )
object { WindsorChair
    scale <1.046 ,1.046 ,1.046>}
#end
#if(frame_number= 93 )
object { WindsorChair
    scale <0.954 ,0.954 ,0.954>}
#end
#if(frame_number= 94 )
object { WindsorChair
    scale <1.047 ,1.047 ,1.047>}
#end
#if(frame_number= 95 )
object { WindsorChair
    scale <0.953 ,0.953 ,0.953>}
#end
#if(frame_number= 96 )
object { WindsorChair
    scale <1.048 ,1.048 ,1.048>}
#end
#if(frame_number= 97 )
object { WindsorChair
    scale <0.952 ,0.952 ,0.952>}
#end
#if(frame_number= 98 )
object { WindsorChair
    scale <1.049 ,1.049 ,1.049>}
#end
#if(frame_number= 99 )
object { WindsorChair
    scale <0.951 ,0.951 ,0.951>}
#end
#if(frame_number= 100 )
object { WindsorChair
    scale <1.050 ,1.050 ,1.050>}
#end
#if(frame_number= 101 )
object { WindsorChair
    scale <0.950 ,0.950 ,0.950>}
#end
#if(frame_number= 102 )
object { WindsorChair
    scale <1.051 ,1.051 ,1.051>}
#end
#if(frame_number= 103 )
object { WindsorChair
    scale <0.949 ,0.949 ,0.949>}
#end
#if(frame_number= 104 )
object { WindsorChair
    scale <1.052 ,1.052 ,1.052>}
#end
#if(frame_number= 105 )
object { WindsorChair
    scale <0.948 ,0.948 ,0.948>}
#end
#if(frame_number= 106 )
object { WindsorChair
    scale <1.053 ,1.053 ,1.053>}
#end
#if(frame_number= 107 )
object { WindsorChair
    scale <0.947 ,0.947 ,0.947>}
#end
#if(frame_number= 108 )
object { WindsorChair
    scale <1.054 ,1.054 ,1.054>}
#end
#if(frame_number= 109 )
object { WindsorChair
    scale <0.946 ,0.946 ,0.946>}
#end
#if(frame_number= 110 )
object { WindsorChair
    scale <1.055 ,1.055 ,1.055>}
#end
#if(frame_number= 111 )
object { WindsorChair
    scale <0.945 ,0.945 ,0.945>}
#end
#if(frame_number= 112 )
object { WindsorChair
    scale <1.056 ,1.056 ,1.056>}
#end
#if(frame_number= 113 )
object { WindsorChair
    scale <0.944 ,0.944 ,0.944>}
#end
#if(frame_number= 114 )
object { WindsorChair
    scale <1.057 ,1.057 ,1.057>}
#end
#if(frame_number= 115 )
object { WindsorChair
    scale <0.943 ,0.943 ,0.943>}
#end
#if(frame_number= 116 )
object { WindsorChair
    scale <1.058 ,1.058 ,1.058>}
#end
#if(frame_number= 117 )
object { WindsorChair
    scale <0.942 ,0.942 ,0.942>}
#end
#if(frame_number= 118 )
object { WindsorChair
    scale <1.059 ,1.059 ,1.059>}
#end
#if(frame_number= 119 )
object { WindsorChair
    scale <0.941 ,0.941 ,0.941>}
#end
#if(frame_number= 120 )
object { WindsorChair
    scale <1.060 ,1.060 ,1.060>}
#end
#if(frame_number= 121 )
object { WindsorChair
    scale <0.940 ,0.940 ,0.940>}
#end
#if(frame_number= 122 )
object { WindsorChair
    scale <1.061 ,1.061 ,1.061>}
#end
#if(frame_number= 123 )
object { WindsorChair
    scale <0.939 ,0.939 ,0.939>}
#end
#if(frame_number= 124 )
object { WindsorChair
    scale <1.062 ,1.062 ,1.062>}
#end
#if(frame_number= 125 )
object { WindsorChair
    scale <0.938 ,0.938 ,0.938>}
#end
#if(frame_number= 126 )
object { WindsorChair
    scale <1.063 ,1.063 ,1.063>}
#end
#if(frame_number= 127 )
object { WindsorChair
    scale <0.937 ,0.937 ,0.937>}
#end
#if(frame_number= 128 )
object { WindsorChair
    scale <1.064 ,1.064 ,1.064>}
#end
#if(frame_number= 129 )
object { WindsorChair
    scale <0.936 ,0.936 ,0.936>}
#end
#if(frame_number= 130 )
object { WindsorChair
    scale <1.065 ,1.065 ,1.065>}
#end
#if(frame_number= 131 )
object { WindsorChair
    scale <0.935 ,0.935 ,0.935>}
#end
#if(frame_number= 132 )
object { WindsorChair
    scale <1.066 ,1.066 ,1.066>}
#end
#if(frame_number= 133 )
object { WindsorChair
    scale <0.934 ,0.934 ,0.934>}
#end
#if(frame_number= 134 )
object { WindsorChair
    scale <1.067 ,1.067 ,1.067>}
#end
#if(frame_number= 135 )
object { WindsorChair
    scale <0.933 ,0.933 ,0.933>}
#end
#if(frame_number= 136 )
object { WindsorChair
    scale <1.068 ,1.068 ,1.068>}
#end
#if(frame_number= 137 )
object { WindsorChair
    scale <0.932 ,0.932 ,0.932>}
#end
#if(frame_number= 138 )
object { WindsorChair
    scale <1.069 ,1.069 ,1.069>}
#end
#if(frame_number= 139 )
object { WindsorChair
    scale <0.931 ,0.931 ,0.931>}
#end
#if(frame_number= 140 )
object { WindsorChair
    scale <1.070 ,1.070 ,1.070>}
#end
#if(frame_number= 141 )
object { WindsorChair
    scale <0.930 ,0.930 ,0.930>}
#end
#if(frame_number= 142 )
object { WindsorChair
    scale <1.071 ,1.071 ,1.071>}
#end
#if(frame_number= 143 )
object { WindsorChair
    scale <0.929 ,0.929 ,0.929>}
#end
#if(frame_number= 144 )
object { WindsorChair
    scale <1.072 ,1.072 ,1.072>}
#end
#if(frame_number= 145 )
object { WindsorChair
    scale <0.928 ,0.928 ,0.928>}
#end
#if(frame_number= 146 )
object { WindsorChair
    scale <1.073 ,1.073 ,1.073>}
#end
#if(frame_number= 147 )
object { WindsorChair
    scale <0.927 ,0.927 ,0.927>}
#end
#if(frame_number= 148 )
object { WindsorChair
    scale <1.074 ,1.074 ,1.074>}
#end
#if(frame_number= 149 )
object { WindsorChair
    scale <0.926 ,0.926 ,0.926>}
#end
#if(frame_number= 150 )
object { WindsorChair
    scale <1.075 ,1.075 ,1.075>}
#end
#if(frame_number= 151 )
object { WindsorChair
    scale <0.925 ,0.925 ,0.925>}
#end
#if(frame_number= 152 )
object { WindsorChair
    scale <1.076 ,1.076 ,1.076>}
#end
#if(frame_number= 153 )
object { WindsorChair
    scale <0.924 ,0.924 ,0.924>}
#end
#if(frame_number= 154 )
object { WindsorChair
    scale <1.077 ,1.077 ,1.077>}
#end
#if(frame_number= 155 )
object { WindsorChair
    scale <0.923 ,0.923 ,0.923>}
#end
#if(frame_number= 156 )
object { WindsorChair
    scale <1.078 ,1.078 ,1.078>}
#end
#if(frame_number= 157 )
object { WindsorChair
    scale <0.922 ,0.922 ,0.922>}
#end
#if(frame_number= 158 )
object { WindsorChair
    scale <1.079 ,1.079 ,1.079>}
#end
#if(frame_number= 159 )
object { WindsorChair
    scale <0.921 ,0.921 ,0.921>}
#end
#if(frame_number= 160 )
object { WindsorChair
    scale <1.080 ,1.080 ,1.080>}
#end
#if(frame_number= 161 )
object { WindsorChair
    scale <0.920 ,0.920 ,0.920>}
#end
#if(frame_number= 162 )
object { WindsorChair
    scale <1.081 ,1.081 ,1.081>}
#end
#if(frame_number= 163 )
object { WindsorChair
    scale <0.919 ,0.919 ,0.919>}
#end
#if(frame_number= 164 )
object { WindsorChair
    scale <1.082 ,1.082 ,1.082>}
#end
#if(frame_number= 165 )
object { WindsorChair
    scale <0.918 ,0.918 ,0.918>}
#end
#if(frame_number= 166 )
object { WindsorChair
    scale <1.083 ,1.083 ,1.083>}
#end
#if(frame_number= 167 )
object { WindsorChair
    scale <0.917 ,0.917 ,0.917>}
#end
#if(frame_number= 168 )
object { WindsorChair
    scale <1.084 ,1.084 ,1.084>}
#end
#if(frame_number= 169 )
object { WindsorChair
    scale <0.916 ,0.916 ,0.916>}
#end
#if(frame_number= 170 )
object { WindsorChair
    scale <1.085 ,1.085 ,1.085>}
#end
#if(frame_number= 171 )
object { WindsorChair
    scale <0.915 ,0.915 ,0.915>}
#end
#if(frame_number= 172 )
object { WindsorChair
    scale <1.086 ,1.086 ,1.086>}
#end
#if(frame_number= 173 )
object { WindsorChair
    scale <0.914 ,0.914 ,0.914>}
#end
#if(frame_number= 174 )
object { WindsorChair
    scale <1.087 ,1.087 ,1.087>}
#end
#if(frame_number= 175 )
object { WindsorChair
    scale <0.913 ,0.913 ,0.913>}
#end
#if(frame_number= 176 )
object { WindsorChair
    scale <1.088 ,1.088 ,1.088>}
#end
#if(frame_number= 177 )
object { WindsorChair
    scale <0.912 ,0.912 ,0.912>}
#end
#if(frame_number= 178 )
object { WindsorChair
    scale <1.089 ,1.089 ,1.089>}
#end
#if(frame_number= 179 )
object { WindsorChair
    scale <0.911 ,0.911 ,0.911>}
#end
#if(frame_number= 180 )
object { WindsorChair
    scale <1.090 ,1.090 ,1.090>}
#end
#if(frame_number= 181 )
object { WindsorChair
    scale <0.910 ,0.910 ,0.910>}
#end
#if(frame_number= 182 )
object { WindsorChair
    scale <1.091 ,1.091 ,1.091>}
#end
#if(frame_number= 183 )
object { WindsorChair
    scale <0.909 ,0.909 ,0.909>}
#end
#if(frame_number= 184 )
object { WindsorChair
    scale <1.092 ,1.092 ,1.092>}
#end
#if(frame_number= 185 )
object { WindsorChair
    scale <0.908 ,0.908 ,0.908>}
#end
#if(frame_number= 186 )
object { WindsorChair
    scale <1.093 ,1.093 ,1.093>}
#end
#if(frame_number= 187 )
object { WindsorChair
    scale <0.907 ,0.907 ,0.907>}
#end
#if(frame_number= 188 )
object { WindsorChair
    scale <1.094 ,1.094 ,1.094>}
#end
#if(frame_number= 189 )
object { WindsorChair
    scale <0.906 ,0.906 ,0.906>}
#end
#if(frame_number= 190 )
object { WindsorChair
    scale <1.095 ,1.095 ,1.095>}
#end
#if(frame_number= 191 )
object { WindsorChair
    scale <0.905 ,0.905 ,0.905>}
#end
#if(frame_number= 192 )
object { WindsorChair
    scale <1.096 ,1.096 ,1.096>}
#end
#if(frame_number= 193 )
object { WindsorChair
    scale <0.904 ,0.904 ,0.904>}
#end
#if(frame_number= 194 )
object { WindsorChair
    scale <1.097 ,1.097 ,1.097>}
#end
#if(frame_number= 195 )
object { WindsorChair
    scale <0.903 ,0.903 ,0.903>}
#end
#if(frame_number= 196 )
object { WindsorChair
    scale <1.098 ,1.098 ,1.098>}
#end
#if(frame_number= 197 )
object { WindsorChair
    scale <0.902 ,0.902 ,0.902>}
#end
#if(frame_number= 198 )
object { WindsorChair
    scale <1.099 ,1.099 ,1.099>}
#end
#if(frame_number= 199 )
object { WindsorChair
    scale <0.901 ,0.901 ,0.901>}
#end
#if(frame_number= 200 )
object { WindsorChair
    scale <1.100 ,1.100 ,1.100>}
#end
#if(frame_number= 201 )
object { WindsorChair
    scale <0.900 ,0.900 ,0.900>}
#end
#if(frame_number= 202 )
object { WindsorChair
    scale <1.101 ,1.101 ,1.101>}
#end
#if(frame_number= 203 )
object { WindsorChair
    scale <0.899 ,0.899 ,0.899>}
#end
#if(frame_number= 204 )
object { WindsorChair
    scale <1.102 ,1.102 ,1.102>}
#end
#if(frame_number= 205 )
object { WindsorChair
    scale <0.898 ,0.898 ,0.898>}
#end
#if(frame_number= 206 )
object { WindsorChair
    scale <1.103 ,1.103 ,1.103>}
#end
#if(frame_number= 207 )
object { WindsorChair
    scale <0.897 ,0.897 ,0.897>}
#end
#if(frame_number= 208 )
object { WindsorChair
    scale <1.104 ,1.104 ,1.104>}
#end
#if(frame_number= 209 )
object { WindsorChair
    scale <0.896 ,0.896 ,0.896>}
#end
#if(frame_number= 210 )
object { WindsorChair
    scale <1.105 ,1.105 ,1.105>}
#end
#if(frame_number= 211 )
object { WindsorChair
    scale <0.895 ,0.895 ,0.895>}
#end
#if(frame_number= 212 )
object { WindsorChair
    scale <1.106 ,1.106 ,1.106>}
#end
#if(frame_number= 213 )
object { WindsorChair
    scale <0.894 ,0.894 ,0.894>}
#end
#if(frame_number= 214 )
object { WindsorChair
    scale <1.107 ,1.107 ,1.107>}
#end
#if(frame_number= 215 )
object { WindsorChair
    scale <0.893 ,0.893 ,0.893>}
#end
#if(frame_number= 216 )
object { WindsorChair
    scale <1.108 ,1.108 ,1.108>}
#end
#if(frame_number= 217 )
object { WindsorChair
    scale <0.892 ,0.892 ,0.892>}
#end
#if(frame_number= 218 )
object { WindsorChair
    scale <1.109 ,1.109 ,1.109>}
#end
#if(frame_number= 219 )
object { WindsorChair
    scale <0.891 ,0.891 ,0.891>}
#end
#if(frame_number= 220 )
object { WindsorChair
    scale <1.110 ,1.110 ,1.110>}
#end
#if(frame_number= 221 )
object { WindsorChair
    scale <0.890 ,0.890 ,0.890>}
#end
#if(frame_number= 222 )
object { WindsorChair
    scale <1.111 ,1.111 ,1.111>}
#end
#if(frame_number= 223 )
object { WindsorChair
    scale <0.889 ,0.889 ,0.889>}
#end
#if(frame_number= 224 )
object { WindsorChair
    scale <1.112 ,1.112 ,1.112>}
#end
#if(frame_number= 225 )
object { WindsorChair
    scale <0.888 ,0.888 ,0.888>}
#end
#if(frame_number= 226 )
object { WindsorChair
    scale <1.113 ,1.113 ,1.113>}
#end
#if(frame_number= 227 )
object { WindsorChair
    scale <0.887 ,0.887 ,0.887>}
#end
#if(frame_number= 228 )
object { WindsorChair
    scale <1.114 ,1.114 ,1.114>}
#end
#if(frame_number= 229 )
object { WindsorChair
    scale <0.886 ,0.886 ,0.886>}
#end
#if(frame_number= 230 )
object { WindsorChair
    scale <1.115 ,1.115 ,1.115>}
#end
#if(frame_number= 231 )
object { WindsorChair
    scale <0.885 ,0.885 ,0.885>}
#end
#if(frame_number= 232 )
object { WindsorChair
    scale <1.116 ,1.116 ,1.116>}
#end
#if(frame_number= 233 )
object { WindsorChair
    scale <0.884 ,0.884 ,0.884>}
#end
#if(frame_number= 234 )
object { WindsorChair
    scale <1.117 ,1.117 ,1.117>}
#end
#if(frame_number= 235 )
object { WindsorChair
    scale <0.883 ,0.883 ,0.883>}
#end
#if(frame_number= 236 )
object { WindsorChair
    scale <1.118 ,1.118 ,1.118>}
#end
#if(frame_number= 237 )
object { WindsorChair
    scale <0.882 ,0.882 ,0.882>}
#end
#if(frame_number= 238 )
object { WindsorChair
    scale <1.119 ,1.119 ,1.119>}
#end
#if(frame_number= 239 )
object { WindsorChair
    scale <0.881 ,0.881 ,0.881>}
#end
#if(frame_number= 240 )
object { WindsorChair
    scale <1.120 ,1.120 ,1.120>}
#end
#if(frame_number= 241 )
object { WindsorChair
    scale <0.880 ,0.880 ,0.880>}
#end
#if(frame_number= 242 )
object { WindsorChair
    scale <1.121 ,1.121 ,1.121>}
#end
#if(frame_number= 243 )
object { WindsorChair
    scale <0.879 ,0.879 ,0.879>}
#end
#if(frame_number= 244 )
object { WindsorChair
    scale <1.122 ,1.122 ,1.122>}
#end
#if(frame_number= 245 )
object { WindsorChair
    scale <0.878 ,0.878 ,0.878>}
#end
#if(frame_number= 246 )
object { WindsorChair
    scale <1.123 ,1.123 ,1.123>}
#end
#if(frame_number= 247 )
object { WindsorChair
    scale <0.877 ,0.877 ,0.877>}
#end
#if(frame_number= 248 )
object { WindsorChair
    scale <1.124 ,1.124 ,1.124>}
#end
#if(frame_number= 249 )
object { WindsorChair
    scale <0.876 ,0.876 ,0.876>}
#end
#if(frame_number= 250 )
object { WindsorChair
    scale <1.125 ,1.125 ,1.125>}
#end
#if(frame_number= 251 )
object { WindsorChair
    scale <0.875 ,0.875 ,0.875>}
#end
#if(frame_number= 252 )
object { WindsorChair
    scale <1.126 ,1.126 ,1.126>}
#end
#if(frame_number= 253 )
object { WindsorChair
    scale <0.874 ,0.874 ,0.874>}
#end
#if(frame_number= 254 )
object { WindsorChair
    scale <1.127 ,1.127 ,1.127>}
#end
#if(frame_number= 255 )
object { WindsorChair
    scale <0.873 ,0.873 ,0.873>}
#end
#if(frame_number= 256 )
object { WindsorChair
    scale <1.128 ,1.128 ,1.128>}
#end
#if(frame_number= 257 )
object { WindsorChair
    scale <0.872 ,0.872 ,0.872>}
#end
#if(frame_number= 258 )
object { WindsorChair
    scale <1.129 ,1.129 ,1.129>}
#end
#if(frame_number= 259 )
object { WindsorChair
    scale <0.871 ,0.871 ,0.871>}
#end
#if(frame_number= 260 )
object { WindsorChair
    scale <1.130 ,1.130 ,1.130>}
#end
#if(frame_number= 261 )
object { WindsorChair
    scale <0.870 ,0.870 ,0.870>}
#end
#if(frame_number= 262 )
object { WindsorChair
    scale <1.131 ,1.131 ,1.131>}
#end
#if(frame_number= 263 )
object { WindsorChair
    scale <0.869 ,0.869 ,0.869>}
#end
#if(frame_number= 264 )
object { WindsorChair
    scale <1.132 ,1.132 ,1.132>}
#end
#if(frame_number= 265 )
object { WindsorChair
    scale <0.868 ,0.868 ,0.868>}
#end
#if(frame_number= 266 )
object { WindsorChair
    scale <1.133 ,1.133 ,1.133>}
#end
#if(frame_number= 267 )
object { WindsorChair
    scale <0.867 ,0.867 ,0.867>}
#end
#if(frame_number= 268 )
object { WindsorChair
    scale <1.134 ,1.134 ,1.134>}
#end
#if(frame_number= 269 )
object { WindsorChair
    scale <0.866 ,0.866 ,0.866>}
#end
#if(frame_number= 270 )
object { WindsorChair
    scale <1.135 ,1.135 ,1.135>}
#end
#if(frame_number= 271 )
object { WindsorChair
    scale <0.865 ,0.865 ,0.865>}
#end
#if(frame_number= 272 )
object { WindsorChair
    scale <1.136 ,1.136 ,1.136>}
#end
#if(frame_number= 273 )
object { WindsorChair
    scale <0.864 ,0.864 ,0.864>}
#end
#if(frame_number= 274 )
object { WindsorChair
    scale <1.137 ,1.137 ,1.137>}
#end
#if(frame_number= 275 )
object { WindsorChair
    scale <0.863 ,0.863 ,0.863>}
#end
#if(frame_number= 276 )
object { WindsorChair
    scale <1.138 ,1.138 ,1.138>}
#end
#if(frame_number= 277 )
object { WindsorChair
    scale <0.862 ,0.862 ,0.862>}
#end
#if(frame_number= 278 )
object { WindsorChair
    scale <1.139 ,1.139 ,1.139>}
#end
#if(frame_number= 279 )
object { WindsorChair
    scale <0.861 ,0.861 ,0.861>}
#end
#if(frame_number= 280 )
object { WindsorChair
    scale <1.140 ,1.140 ,1.140>}
#end
#if(frame_number= 281 )
object { WindsorChair
    scale <0.860 ,0.860 ,0.860>}
#end
#if(frame_number= 282 )
object { WindsorChair
    scale <1.141 ,1.141 ,1.141>}
#end
#if(frame_number= 283 )
object { WindsorChair
    scale <0.859 ,0.859 ,0.859>}
#end
#if(frame_number= 284 )
object { WindsorChair
    scale <1.142 ,1.142 ,1.142>}
#end
#if(frame_number= 285 )
object { WindsorChair
    scale <0.858 ,0.858 ,0.858>}
#end
#if(frame_number= 286 )
object { WindsorChair
    scale <1.143 ,1.143 ,1.143>}
#end
#if(frame_number= 287 )
object { WindsorChair
    scale <0.857 ,0.857 ,0.857>}
#end
#if(frame_number= 288 )
object { WindsorChair
    scale <1.144 ,1.144 ,1.144>}
#end
#if(frame_number= 289 )
object { WindsorChair
    scale <0.856 ,0.856 ,0.856>}
#end
#if(frame_number= 290 )
object { WindsorChair
    scale <1.145 ,1.145 ,1.145>}
#end
#if(frame_number= 291 )
object { WindsorChair
    scale <0.855 ,0.855 ,0.855>}
#end
#if(frame_number= 292 )
object { WindsorChair
    scale <1.146 ,1.146 ,1.146>}
#end
#if(frame_number= 293 )
object { WindsorChair
    scale <0.854 ,0.854 ,0.854>}
#end
#if(frame_number= 294 )
object { WindsorChair
    scale <1.147 ,1.147 ,1.147>}
#end
#if(frame_number= 295 )
object { WindsorChair
    scale <0.853 ,0.853 ,0.853>}
#end
#if(frame_number= 296 )
object { WindsorChair
    scale <1.148 ,1.148 ,1.148>}
#end
#if(frame_number= 297 )
object { WindsorChair
    scale <0.852 ,0.852 ,0.852>}
#end
#if(frame_number= 298 )
object { WindsorChair
    scale <1.149 ,1.149 ,1.149>}
#end
#if(frame_number= 299 )
object { WindsorChair
    scale <0.851 ,0.851 ,0.851>}
#end
#if(frame_number= 300 )
object { WindsorChair
    scale <1.150 ,1.150 ,1.150>}
#end
#if(frame_number= 301 )
object { WindsorChair
    scale <0.850 ,0.850 ,0.850>}
#end
#if(frame_number= 302 )
object { WindsorChair
    scale <1.151 ,1.151 ,1.151>}
#end
#if(frame_number= 303 )
object { WindsorChair
    scale <0.849 ,0.849 ,0.849>}
#end
#if(frame_number= 304 )
object { WindsorChair
    scale <1.152 ,1.152 ,1.152>}
#end
#if(frame_number= 305 )
object { WindsorChair
    scale <0.848 ,0.848 ,0.848>}
#end
#if(frame_number= 306 )
object { WindsorChair
    scale <1.153 ,1.153 ,1.153>}
#end
#if(frame_number= 307 )
object { WindsorChair
    scale <0.847 ,0.847 ,0.847>}
#end
#if(frame_number= 308 )
object { WindsorChair
    scale <1.154 ,1.154 ,1.154>}
#end
#if(frame_number= 309 )
object { WindsorChair
    scale <0.846 ,0.846 ,0.846>}
#end
#if(frame_number= 310 )
object { WindsorChair
    scale <1.155 ,1.155 ,1.155>}
#end
#if(frame_number= 311 )
object { WindsorChair
    scale <0.845 ,0.845 ,0.845>}
#end
#if(frame_number= 312 )
object { WindsorChair
    scale <1.156 ,1.156 ,1.156>}
#end
#if(frame_number= 313 )
object { WindsorChair
    scale <0.844 ,0.844 ,0.844>}
#end
#if(frame_number= 314 )
object { WindsorChair
    scale <1.157 ,1.157 ,1.157>}
#end
#if(frame_number= 315 )
object { WindsorChair
    scale <0.843 ,0.843 ,0.843>}
#end
#if(frame_number= 316 )
object { WindsorChair
    scale <1.158 ,1.158 ,1.158>}
#end
#if(frame_number= 317 )
object { WindsorChair
    scale <0.842 ,0.842 ,0.842>}
#end
#if(frame_number= 318 )
object { WindsorChair
    scale <1.159 ,1.159 ,1.159>}
#end
#if(frame_number= 319 )
object { WindsorChair
    scale <0.841 ,0.841 ,0.841>}
#end
#if(frame_number= 320 )
object { WindsorChair
    scale <1.160 ,1.160 ,1.160>}
#end
#if(frame_number= 321 )
object { WindsorChair
    scale <0.840 ,0.840 ,0.840>}
#end
#if(frame_number= 322 )
object { WindsorChair
    scale <1.161 ,1.161 ,1.161>}
#end
#if(frame_number= 323 )
object { WindsorChair
    scale <0.839 ,0.839 ,0.839>}
#end
#if(frame_number= 324 )
object { WindsorChair
    scale <1.162 ,1.162 ,1.162>}
#end
#if(frame_number= 325 )
object { WindsorChair
    scale <0.838 ,0.838 ,0.838>}
#end
#if(frame_number= 326 )
object { WindsorChair
    scale <1.163 ,1.163 ,1.163>}
#end
#if(frame_number= 327 )
object { WindsorChair
    scale <0.837 ,0.837 ,0.837>}
#end
#if(frame_number= 328 )
object { WindsorChair
    scale <1.164 ,1.164 ,1.164>}
#end
#if(frame_number= 329 )
object { WindsorChair
    scale <0.836 ,0.836 ,0.836>}
#end
#if(frame_number= 330 )
object { WindsorChair
    scale <1.165 ,1.165 ,1.165>}
#end
#if(frame_number= 331 )
object { WindsorChair
    scale <0.835 ,0.835 ,0.835>}
#end
#if(frame_number= 332 )
object { WindsorChair
    scale <1.166 ,1.166 ,1.166>}
#end
#if(frame_number= 333 )
object { WindsorChair
    scale <0.834 ,0.834 ,0.834>}
#end
#if(frame_number= 334 )
object { WindsorChair
    scale <1.167 ,1.167 ,1.167>}
#end
#if(frame_number= 335 )
object { WindsorChair
    scale <0.833 ,0.833 ,0.833>}
#end
#if(frame_number= 336 )
object { WindsorChair
    scale <1.168 ,1.168 ,1.168>}
#end
#if(frame_number= 337 )
object { WindsorChair
    scale <0.832 ,0.832 ,0.832>}
#end
#if(frame_number= 338 )
object { WindsorChair
    scale <1.169 ,1.169 ,1.169>}
#end
#if(frame_number= 339 )
object { WindsorChair
    scale <0.831 ,0.831 ,0.831>}
#end
#if(frame_number= 340 )
object { WindsorChair
    scale <1.170 ,1.170 ,1.170>}
#end
#if(frame_number= 341 )
object { WindsorChair
    scale <0.830 ,0.830 ,0.830>}
#end
#if(frame_number= 342 )
object { WindsorChair
    scale <1.171 ,1.171 ,1.171>}
#end
#if(frame_number= 343 )
object { WindsorChair
    scale <0.829 ,0.829 ,0.829>}
#end
#if(frame_number= 344 )
object { WindsorChair
    scale <1.172 ,1.172 ,1.172>}
#end
#if(frame_number= 345 )
object { WindsorChair
    scale <0.828 ,0.828 ,0.828>}
#end
#if(frame_number= 346 )
object { WindsorChair
    scale <1.173 ,1.173 ,1.173>}
#end
#if(frame_number= 347 )
object { WindsorChair
    scale <0.827 ,0.827 ,0.827>}
#end
#if(frame_number= 348 )
object { WindsorChair
    scale <1.174 ,1.174 ,1.174>}
#end
#if(frame_number= 349 )
object { WindsorChair
    scale <0.826 ,0.826 ,0.826>}
#end
#if(frame_number= 350 )
object { WindsorChair
    scale <1.175 ,1.175 ,1.175>}
#end
#if(frame_number= 351 )
object { WindsorChair
    scale <0.825 ,0.825 ,0.825>}
#end
#if(frame_number= 352 )
object { WindsorChair
    scale <1.176 ,1.176 ,1.176>}
#end
#if(frame_number= 353 )
object { WindsorChair
    scale <0.824 ,0.824 ,0.824>}
#end
#if(frame_number= 354 )
object { WindsorChair
    scale <1.177 ,1.177 ,1.177>}
#end
#if(frame_number= 355 )
object { WindsorChair
    scale <0.823 ,0.823 ,0.823>}
#end
#if(frame_number= 356 )
object { WindsorChair
    scale <1.178 ,1.178 ,1.178>}
#end
#if(frame_number= 357 )
object { WindsorChair
    scale <0.822 ,0.822 ,0.822>}
#end
#if(frame_number= 358 )
object { WindsorChair
    scale <1.179 ,1.179 ,1.179>}
#end
#if(frame_number= 359 )
object { WindsorChair
    scale <0.821 ,0.821 ,0.821>}
#end
#if(frame_number= 360 )
object { WindsorChair
    scale <1.180 ,1.180 ,1.180>}
#end
#if(frame_number= 361 )
object { WindsorChair
    scale <0.820 ,0.820 ,0.820>}
#end
#if(frame_number= 362 )
object { WindsorChair
    scale <1.181 ,1.181 ,1.181>}
#end
#if(frame_number= 363 )
object { WindsorChair
    scale <0.819 ,0.819 ,0.819>}
#end
#if(frame_number= 364 )
object { WindsorChair
    scale <1.182 ,1.182 ,1.182>}
#end
#if(frame_number= 365 )
object { WindsorChair
    scale <0.818 ,0.818 ,0.818>}
#end
#if(frame_number= 366 )
object { WindsorChair
    scale <1.183 ,1.183 ,1.183>}
#end
#if(frame_number= 367 )
object { WindsorChair
    scale <0.817 ,0.817 ,0.817>}
#end
#if(frame_number= 368 )
object { WindsorChair
    scale <1.184 ,1.184 ,1.184>}
#end
#if(frame_number= 369 )
object { WindsorChair
    scale <0.816 ,0.816 ,0.816>}
#end
#if(frame_number= 370 )
object { WindsorChair
    scale <1.185 ,1.185 ,1.185>}
#end
#if(frame_number= 371 )
object { WindsorChair
    scale <0.815 ,0.815 ,0.815>}
#end
#if(frame_number= 372 )
object { WindsorChair
    scale <1.186 ,1.186 ,1.186>}
#end
#if(frame_number= 373 )
object { WindsorChair
    scale <0.814 ,0.814 ,0.814>}
#end
#if(frame_number= 374 )
object { WindsorChair
    scale <1.187 ,1.187 ,1.187>}
#end
#if(frame_number= 375 )
object { WindsorChair
    scale <0.813 ,0.813 ,0.813>}
#end
#if(frame_number= 376 )
object { WindsorChair
    scale <1.188 ,1.188 ,1.188>}
#end
#if(frame_number= 377 )
object { WindsorChair
    scale <0.812 ,0.812 ,0.812>}
#end
#if(frame_number= 378 )
object { WindsorChair
    scale <1.189 ,1.189 ,1.189>}
#end
#if(frame_number= 379 )
object { WindsorChair
    scale <0.811 ,0.811 ,0.811>}
#end
#if(frame_number= 380 )
object { WindsorChair
    scale <1.190 ,1.190 ,1.190>}
#end
#if(frame_number= 381 )
object { WindsorChair
    scale <0.810 ,0.810 ,0.810>}
#end
#if(frame_number= 382 )
object { WindsorChair
    scale <1.191 ,1.191 ,1.191>}
#end
#if(frame_number= 383 )
object { WindsorChair
    scale <0.809 ,0.809 ,0.809>}
#end
#if(frame_number= 384 )
object { WindsorChair
    scale <1.192 ,1.192 ,1.192>}
#end
#if(frame_number= 385 )
object { WindsorChair
    scale <0.808 ,0.808 ,0.808>}
#end
#if(frame_number= 386 )
object { WindsorChair
    scale <1.193 ,1.193 ,1.193>}
#end
#if(frame_number= 387 )
object { WindsorChair
    scale <0.807 ,0.807 ,0.807>}
#end
#if(frame_number= 388 )
object { WindsorChair
    scale <1.194 ,1.194 ,1.194>}
#end
#if(frame_number= 389 )
object { WindsorChair
    scale <0.806 ,0.806 ,0.806>}
#end
#if(frame_number= 390 )
object { WindsorChair
    scale <1.195 ,1.195 ,1.195>}
#end
#if(frame_number= 391 )
object { WindsorChair
    scale <0.805 ,0.805 ,0.805>}
#end
#if(frame_number= 392 )
object { WindsorChair
    scale <1.196 ,1.196 ,1.196>}
#end
#if(frame_number= 393 )
object { WindsorChair
    scale <0.804 ,0.804 ,0.804>}
#end
#if(frame_number= 394 )
object { WindsorChair
    scale <1.197 ,1.197 ,1.197>}
#end
#if(frame_number= 395 )
object { WindsorChair
    scale <0.803 ,0.803 ,0.803>}
#end
#if(frame_number= 396 )
object { WindsorChair
    scale <1.198 ,1.198 ,1.198>}
#end
#if(frame_number= 397 )
object { WindsorChair
    scale <0.802 ,0.802 ,0.802>}
#end
#if(frame_number= 398 )
object { WindsorChair
    scale <1.199 ,1.199 ,1.199>}
#end
#if(frame_number= 399 )
object { WindsorChair
    scale <0.801 ,0.801 ,0.801>}
#end
#if(frame_number= 400 )
object { WindsorChair
    scale <1.200 ,1.200 ,1.200>}
#end
#if(frame_number= 401 )
object { WindsorChair
    scale <0.800 ,0.800 ,0.800>}
#end
#if(frame_number= 402 )
object { WindsorChair
    scale <1.201 ,1.201 ,1.201>}
#end
#if(frame_number= 403 )
object { WindsorChair
    scale <0.799 ,0.799 ,0.799>}
#end
#if(frame_number= 404 )
object { WindsorChair
    scale <1.202 ,1.202 ,1.202>}
#end
#if(frame_number= 405 )
object { WindsorChair
    scale <0.798 ,0.798 ,0.798>}
#end
#if(frame_number= 406 )
object { WindsorChair
    scale <1.203 ,1.203 ,1.203>}
#end
#if(frame_number= 407 )
object { WindsorChair
    scale <0.797 ,0.797 ,0.797>}
#end
#if(frame_number= 408 )
object { WindsorChair
    scale <1.204 ,1.204 ,1.204>}
#end
#if(frame_number= 409 )
object { WindsorChair
    scale <0.796 ,0.796 ,0.796>}
#end
#if(frame_number= 410 )
object { WindsorChair
    scale <1.205 ,1.205 ,1.205>}
#end
#if(frame_number= 411 )
object { WindsorChair
    scale <0.795 ,0.795 ,0.795>}
#end
#if(frame_number= 412 )
object { WindsorChair
    scale <1.206 ,1.206 ,1.206>}
#end
#if(frame_number= 413 )
object { WindsorChair
    scale <0.794 ,0.794 ,0.794>}
#end
#if(frame_number= 414 )
object { WindsorChair
    scale <1.207 ,1.207 ,1.207>}
#end
#if(frame_number= 415 )
object { WindsorChair
    scale <0.793 ,0.793 ,0.793>}
#end
#if(frame_number= 416 )
object { WindsorChair
    scale <1.208 ,1.208 ,1.208>}
#end
#if(frame_number= 417 )
object { WindsorChair
    scale <0.792 ,0.792 ,0.792>}
#end
#if(frame_number= 418 )
object { WindsorChair
    scale <1.209 ,1.209 ,1.209>}
#end
#if(frame_number= 419 )
object { WindsorChair
    scale <0.791 ,0.791 ,0.791>}
#end
#if(frame_number= 420 )
object { WindsorChair
    scale <1.210 ,1.210 ,1.210>}
#end
#if(frame_number= 421 )
object { WindsorChair
    scale <0.790 ,0.790 ,0.790>}
#end
#if(frame_number= 422 )
object { WindsorChair
    scale <1.211 ,1.211 ,1.211>}
#end
#if(frame_number= 423 )
object { WindsorChair
    scale <0.789 ,0.789 ,0.789>}
#end
#if(frame_number= 424 )
object { WindsorChair
    scale <1.212 ,1.212 ,1.212>}
#end
#if(frame_number= 425 )
object { WindsorChair
    scale <0.788 ,0.788 ,0.788>}
#end
#if(frame_number= 426 )
object { WindsorChair
    scale <1.213 ,1.213 ,1.213>}
#end
#if(frame_number= 427 )
object { WindsorChair
    scale <0.787 ,0.787 ,0.787>}
#end
#if(frame_number= 428 )
object { WindsorChair
    scale <1.214 ,1.214 ,1.214>}
#end
#if(frame_number= 429 )
object { WindsorChair
    scale <0.786 ,0.786 ,0.786>}
#end
#if(frame_number= 430 )
object { WindsorChair
    scale <1.215 ,1.215 ,1.215>}
#end
#if(frame_number= 431 )
object { WindsorChair
    scale <0.785 ,0.785 ,0.785>}
#end
#if(frame_number= 432 )
object { WindsorChair
    scale <1.216 ,1.216 ,1.216>}
#end
#if(frame_number= 433 )
object { WindsorChair
    scale <0.784 ,0.784 ,0.784>}
#end
#if(frame_number= 434 )
object { WindsorChair
    scale <1.217 ,1.217 ,1.217>}
#end
#if(frame_number= 435 )
object { WindsorChair
    scale <0.783 ,0.783 ,0.783>}
#end
#if(frame_number= 436 )
object { WindsorChair
    scale <1.218 ,1.218 ,1.218>}
#end
#if(frame_number= 437 )
object { WindsorChair
    scale <0.782 ,0.782 ,0.782>}
#end
#if(frame_number= 438 )
object { WindsorChair
    scale <1.219 ,1.219 ,1.219>}
#end
#if(frame_number= 439 )
object { WindsorChair
    scale <0.781 ,0.781 ,0.781>}
#end
#if(frame_number= 440 )
object { WindsorChair
    scale <1.220 ,1.220 ,1.220>}
#end
#if(frame_number= 441 )
object { WindsorChair
    scale <0.780 ,0.780 ,0.780>}
#end
#if(frame_number= 442 )
object { WindsorChair
    scale <1.221 ,1.221 ,1.221>}
#end
#if(frame_number= 443 )
object { WindsorChair
    scale <0.779 ,0.779 ,0.779>}
#end
#if(frame_number= 444 )
object { WindsorChair
    scale <1.222 ,1.222 ,1.222>}
#end
#if(frame_number= 445 )
object { WindsorChair
    scale <0.778 ,0.778 ,0.778>}
#end
#if(frame_number= 446 )
object { WindsorChair
    scale <1.223 ,1.223 ,1.223>}
#end
#if(frame_number= 447 )
object { WindsorChair
    scale <0.777 ,0.777 ,0.777>}
#end
#if(frame_number= 448 )
object { WindsorChair
    scale <1.224 ,1.224 ,1.224>}
#end
#if(frame_number= 449 )
object { WindsorChair
    scale <0.776 ,0.776 ,0.776>}
#end
#if(frame_number= 450 )
object { WindsorChair
    scale <1.225 ,1.225 ,1.225>}
#end
#if(frame_number= 451 )
object { WindsorChair
    scale <0.775 ,0.775 ,0.775>}
#end
#if(frame_number= 452 )
object { WindsorChair
    scale <1.226 ,1.226 ,1.226>}
#end
#if(frame_number= 453 )
object { WindsorChair
    scale <0.774 ,0.774 ,0.774>}
#end
#if(frame_number= 454 )
object { WindsorChair
    scale <1.227 ,1.227 ,1.227>}
#end
#if(frame_number= 455 )
object { WindsorChair
    scale <0.773 ,0.773 ,0.773>}
#end
#if(frame_number= 456 )
object { WindsorChair
    scale <1.228 ,1.228 ,1.228>}
#end
#if(frame_number= 457 )
object { WindsorChair
    scale <0.772 ,0.772 ,0.772>}
#end
#if(frame_number= 458 )
object { WindsorChair
    scale <1.229 ,1.229 ,1.229>}
#end
#if(frame_number= 459 )
object { WindsorChair
    scale <0.771 ,0.771 ,0.771>}
#end
#if(frame_number= 460 )
object { WindsorChair
    scale <1.230 ,1.230 ,1.230>}
#end
#if(frame_number= 461 )
object { WindsorChair
    scale <0.770 ,0.770 ,0.770>}
#end
#if(frame_number= 462 )
object { WindsorChair
    scale <1.231 ,1.231 ,1.231>}
#end
#if(frame_number= 463 )
object { WindsorChair
    scale <0.769 ,0.769 ,0.769>}
#end
#if(frame_number= 464 )
object { WindsorChair
    scale <1.232 ,1.232 ,1.232>}
#end
#if(frame_number= 465 )
object { WindsorChair
    scale <0.768 ,0.768 ,0.768>}
#end
#if(frame_number= 466 )
object { WindsorChair
    scale <1.233 ,1.233 ,1.233>}
#end
#if(frame_number= 467 )
object { WindsorChair
    scale <0.767 ,0.767 ,0.767>}
#end
#if(frame_number= 468 )
object { WindsorChair
    scale <1.234 ,1.234 ,1.234>}
#end
#if(frame_number= 469 )
object { WindsorChair
    scale <0.766 ,0.766 ,0.766>}
#end
#if(frame_number= 470 )
object { WindsorChair
    scale <1.235 ,1.235 ,1.235>}
#end
#if(frame_number= 471 )
object { WindsorChair
    scale <0.765 ,0.765 ,0.765>}
#end
#if(frame_number= 472 )
object { WindsorChair
    scale <1.236 ,1.236 ,1.236>}
#end
#if(frame_number= 473 )
object { WindsorChair
    scale <0.764 ,0.764 ,0.764>}
#end
#if(frame_number= 474 )
object { WindsorChair
    scale <1.237 ,1.237 ,1.237>}
#end
#if(frame_number= 475 )
object { WindsorChair
    scale <0.763 ,0.763 ,0.763>}
#end
#if(frame_number= 476 )
object { WindsorChair
    scale <1.238 ,1.238 ,1.238>}
#end
#if(frame_number= 477 )
object { WindsorChair
    scale <0.762 ,0.762 ,0.762>}
#end
#if(frame_number= 478 )
object { WindsorChair
    scale <1.239 ,1.239 ,1.239>}
#end
#if(frame_number= 479 )
object { WindsorChair
    scale <0.761 ,0.761 ,0.761>}
#end
#if(frame_number= 480 )
object { WindsorChair
    scale <1.240 ,1.240 ,1.240>}
#end
#if(frame_number= 481 )
object { WindsorChair
    scale <0.760 ,0.760 ,0.760>}
#end
#if(frame_number= 482 )
object { WindsorChair
    scale <1.241 ,1.241 ,1.241>}
#end
#if(frame_number= 483 )
object { WindsorChair
    scale <0.759 ,0.759 ,0.759>}
#end
#if(frame_number= 484 )
object { WindsorChair
    scale <1.242 ,1.242 ,1.242>}
#end
#if(frame_number= 485 )
object { WindsorChair
    scale <0.758 ,0.758 ,0.758>}
#end
#if(frame_number= 486 )
object { WindsorChair
    scale <1.243 ,1.243 ,1.243>}
#end
#if(frame_number= 487 )
object { WindsorChair
    scale <0.757 ,0.757 ,0.757>}
#end
#if(frame_number= 488 )
object { WindsorChair
    scale <1.244 ,1.244 ,1.244>}
#end
#if(frame_number= 489 )
object { WindsorChair
    scale <0.756 ,0.756 ,0.756>}
#end
#if(frame_number= 490 )
object { WindsorChair
    scale <1.245 ,1.245 ,1.245>}
#end
#if(frame_number= 491 )
object { WindsorChair
    scale <0.755 ,0.755 ,0.755>}
#end
#if(frame_number= 492 )
object { WindsorChair
    scale <1.246 ,1.246 ,1.246>}
#end
#if(frame_number= 493 )
object { WindsorChair
    scale <0.754 ,0.754 ,0.754>}
#end
#if(frame_number= 494 )
object { WindsorChair
    scale <1.247 ,1.247 ,1.247>}
#end
#if(frame_number= 495 )
object { WindsorChair
    scale <0.753 ,0.753 ,0.753>}
#end
#if(frame_number= 496 )
object { WindsorChair
    scale <1.248 ,1.248 ,1.248>}
#end
#if(frame_number= 497 )
object { WindsorChair
    scale <0.752 ,0.752 ,0.752>}
#end
#if(frame_number= 498 )
object { WindsorChair
    scale <1.249 ,1.249 ,1.249>}
#end
#if(frame_number= 499 )
object { WindsorChair
    scale <0.751 ,0.751 ,0.751>}
#end
#if(frame_number= 500 )
object { WindsorChair
    scale <1.250 ,1.250 ,1.250>}
#end
#if(frame_number= 501 )
object { WindsorChair
    scale <0.750 ,0.750 ,0.750>}
#end
#if(frame_number= 502 )
object { WindsorChair
    scale <1.251 ,1.251 ,1.251>}
#end
#if(frame_number= 503 )
object { WindsorChair
    scale <0.749 ,0.749 ,0.749>}
#end
#if(frame_number= 504 )
object { WindsorChair
    scale <1.252 ,1.252 ,1.252>}
#end
#if(frame_number= 505 )
object { WindsorChair
    scale <0.748 ,0.748 ,0.748>}
#end
#if(frame_number= 506 )
object { WindsorChair
    scale <1.253 ,1.253 ,1.253>}
#end
#if(frame_number= 507 )
object { WindsorChair
    scale <0.747 ,0.747 ,0.747>}
#end
#if(frame_number= 508 )
object { WindsorChair
    scale <1.254 ,1.254 ,1.254>}
#end
#if(frame_number= 509 )
object { WindsorChair
    scale <0.746 ,0.746 ,0.746>}
#end
#if(frame_number= 510 )
object { WindsorChair
    scale <1.255 ,1.255 ,1.255>}
#end
#if(frame_number= 511 )
object { WindsorChair
    scale <0.745 ,0.745 ,0.745>}
#end
#if(frame_number= 512 )
object { WindsorChair
    scale <1.256 ,1.256 ,1.256>}
#end
#if(frame_number= 513 )
object { WindsorChair
    scale <0.744 ,0.744 ,0.744>}
#end
#if(frame_number= 514 )
object { WindsorChair
    scale <1.257 ,1.257 ,1.257>}
#end
#if(frame_number= 515 )
object { WindsorChair
    scale <0.743 ,0.743 ,0.743>}
#end
#if(frame_number= 516 )
object { WindsorChair
    scale <1.258 ,1.258 ,1.258>}
#end
#if(frame_number= 517 )
object { WindsorChair
    scale <0.742 ,0.742 ,0.742>}
#end
#if(frame_number= 518 )
object { WindsorChair
    scale <1.259 ,1.259 ,1.259>}
#end
#if(frame_number= 519 )
object { WindsorChair
    scale <0.741 ,0.741 ,0.741>}
#end
#if(frame_number= 520 )
object { WindsorChair
    scale <1.260 ,1.260 ,1.260>}
#end
#if(frame_number= 521 )
object { WindsorChair
    scale <0.740 ,0.740 ,0.740>}
#end
#if(frame_number= 522 )
object { WindsorChair
    scale <1.261 ,1.261 ,1.261>}
#end
#if(frame_number= 523 )
object { WindsorChair
    scale <0.739 ,0.739 ,0.739>}
#end
#if(frame_number= 524 )
object { WindsorChair
    scale <1.262 ,1.262 ,1.262>}
#end
#if(frame_number= 525 )
object { WindsorChair
    scale <0.738 ,0.738 ,0.738>}
#end
#if(frame_number= 526 )
object { WindsorChair
    scale <1.263 ,1.263 ,1.263>}
#end
#if(frame_number= 527 )
object { WindsorChair
    scale <0.737 ,0.737 ,0.737>}
#end
#if(frame_number= 528 )
object { WindsorChair
    scale <1.264 ,1.264 ,1.264>}
#end
#if(frame_number= 529 )
object { WindsorChair
    scale <0.736 ,0.736 ,0.736>}
#end
#if(frame_number= 530 )
object { WindsorChair
    scale <1.265 ,1.265 ,1.265>}
#end
#if(frame_number= 531 )
object { WindsorChair
    scale <0.735 ,0.735 ,0.735>}
#end
#if(frame_number= 532 )
object { WindsorChair
    scale <1.266 ,1.266 ,1.266>}
#end
#if(frame_number= 533 )
object { WindsorChair
    scale <0.734 ,0.734 ,0.734>}
#end
#if(frame_number= 534 )
object { WindsorChair
    scale <1.267 ,1.267 ,1.267>}
#end
#if(frame_number= 535 )
object { WindsorChair
    scale <0.733 ,0.733 ,0.733>}
#end
#if(frame_number= 536 )
object { WindsorChair
    scale <1.268 ,1.268 ,1.268>}
#end
#if(frame_number= 537 )
object { WindsorChair
    scale <0.732 ,0.732 ,0.732>}
#end
#if(frame_number= 538 )
object { WindsorChair
    scale <1.269 ,1.269 ,1.269>}
#end
#if(frame_number= 539 )
object { WindsorChair
    scale <0.731 ,0.731 ,0.731>}
#end
#if(frame_number= 540 )
object { WindsorChair
    scale <1.270 ,1.270 ,1.270>}
#end
#if(frame_number= 541 )
object { WindsorChair
    scale <0.730 ,0.730 ,0.730>}
#end
#if(frame_number= 542 )
object { WindsorChair
    scale <1.271 ,1.271 ,1.271>}
#end
#if(frame_number= 543 )
object { WindsorChair
    scale <0.729 ,0.729 ,0.729>}
#end
#if(frame_number= 544 )
object { WindsorChair
    scale <1.272 ,1.272 ,1.272>}
#end
#if(frame_number= 545 )
object { WindsorChair
    scale <0.728 ,0.728 ,0.728>}
#end
#if(frame_number= 546 )
object { WindsorChair
    scale <1.273 ,1.273 ,1.273>}
#end
#if(frame_number= 547 )
object { WindsorChair
    scale <0.727 ,0.727 ,0.727>}
#end
#if(frame_number= 548 )
object { WindsorChair
    scale <1.274 ,1.274 ,1.274>}
#end
#if(frame_number= 549 )
object { WindsorChair
    scale <0.726 ,0.726 ,0.726>}
#end
#if(frame_number= 550 )
object { WindsorChair
    scale <1.275 ,1.275 ,1.275>}
#end
#if(frame_number= 551 )
object { WindsorChair
    scale <0.725 ,0.725 ,0.725>}
#end
#if(frame_number= 552 )
object { WindsorChair
    scale <1.276 ,1.276 ,1.276>}
#end
#if(frame_number= 553 )
object { WindsorChair
    scale <0.724 ,0.724 ,0.724>}
#end
#if(frame_number= 554 )
object { WindsorChair
    scale <1.277 ,1.277 ,1.277>}
#end
#if(frame_number= 555 )
object { WindsorChair
    scale <0.723 ,0.723 ,0.723>}
#end
#if(frame_number= 556 )
object { WindsorChair
    scale <1.278 ,1.278 ,1.278>}
#end
#if(frame_number= 557 )
object { WindsorChair
    scale <0.722 ,0.722 ,0.722>}
#end
#if(frame_number= 558 )
object { WindsorChair
    scale <1.279 ,1.279 ,1.279>}
#end
#if(frame_number= 559 )
object { WindsorChair
    scale <0.721 ,0.721 ,0.721>}
#end
#if(frame_number= 560 )
object { WindsorChair
    scale <1.280 ,1.280 ,1.280>}
#end
#if(frame_number= 561 )
object { WindsorChair
    scale <0.720 ,0.720 ,0.720>}
#end
#if(frame_number= 562 )
object { WindsorChair
    scale <1.281 ,1.281 ,1.281>}
#end
#if(frame_number= 563 )
object { WindsorChair
    scale <0.719 ,0.719 ,0.719>}
#end
#if(frame_number= 564 )
object { WindsorChair
    scale <1.282 ,1.282 ,1.282>}
#end
#if(frame_number= 565 )
object { WindsorChair
    scale <0.718 ,0.718 ,0.718>}
#end
#if(frame_number= 566 )
object { WindsorChair
    scale <1.283 ,1.283 ,1.283>}
#end
#if(frame_number= 567 )
object { WindsorChair
    scale <0.717 ,0.717 ,0.717>}
#end
#if(frame_number= 568 )
object { WindsorChair
    scale <1.284 ,1.284 ,1.284>}
#end
#if(frame_number= 569 )
object { WindsorChair
    scale <0.716 ,0.716 ,0.716>}
#end
#if(frame_number= 570 )
object { WindsorChair
    scale <1.285 ,1.285 ,1.285>}
#end
#if(frame_number= 571 )
object { WindsorChair
    scale <0.715 ,0.715 ,0.715>}
#end
#if(frame_number= 572 )
object { WindsorChair
    scale <1.286 ,1.286 ,1.286>}
#end
#if(frame_number= 573 )
object { WindsorChair
    scale <0.714 ,0.714 ,0.714>}
#end
#if(frame_number= 574 )
object { WindsorChair
    scale <1.287 ,1.287 ,1.287>}
#end
#if(frame_number= 575 )
object { WindsorChair
    scale <0.713 ,0.713 ,0.713>}
#end
#if(frame_number= 576 )
object { WindsorChair
    scale <1.288 ,1.288 ,1.288>}
#end
#if(frame_number= 577 )
object { WindsorChair
    scale <0.712 ,0.712 ,0.712>}
#end
#if(frame_number= 578 )
object { WindsorChair
    scale <1.289 ,1.289 ,1.289>}
#end
#if(frame_number= 579 )
object { WindsorChair
    scale <0.711 ,0.711 ,0.711>}
#end
#if(frame_number= 580 )
object { WindsorChair
    scale <1.290 ,1.290 ,1.290>}
#end
#if(frame_number= 581 )
object { WindsorChair
    scale <0.710 ,0.710 ,0.710>}
#end
#if(frame_number= 582 )
object { WindsorChair
    scale <1.291 ,1.291 ,1.291>}
#end
#if(frame_number= 583 )
object { WindsorChair
    scale <0.709 ,0.709 ,0.709>}
#end
#if(frame_number= 584 )
object { WindsorChair
    scale <1.292 ,1.292 ,1.292>}
#end
#if(frame_number= 585 )
object { WindsorChair
    scale <0.708 ,0.708 ,0.708>}
#end
#if(frame_number= 586 )
object { WindsorChair
    scale <1.293 ,1.293 ,1.293>}
#end
#if(frame_number= 587 )
object { WindsorChair
    scale <0.707 ,0.707 ,0.707>}
#end
#if(frame_number= 588 )
object { WindsorChair
    scale <1.294 ,1.294 ,1.294>}
#end
#if(frame_number= 589 )
object { WindsorChair
    scale <0.706 ,0.706 ,0.706>}
#end
#if(frame_number= 590 )
object { WindsorChair
    scale <1.295 ,1.295 ,1.295>}
#end
#if(frame_number= 591 )
object { WindsorChair
    scale <0.705 ,0.705 ,0.705>}
#end
#if(frame_number= 592 )
object { WindsorChair
    scale <1.296 ,1.296 ,1.296>}
#end
#if(frame_number= 593 )
object { WindsorChair
    scale <0.704 ,0.704 ,0.704>}
#end
#if(frame_number= 594 )
object { WindsorChair
    scale <1.297 ,1.297 ,1.297>}
#end
#if(frame_number= 595 )
object { WindsorChair
    scale <0.703 ,0.703 ,0.703>}
#end
#if(frame_number= 596 )
object { WindsorChair
    scale <1.298 ,1.298 ,1.298>}
#end
#if(frame_number= 597 )
object { WindsorChair
    scale <0.702 ,0.702 ,0.702>}
#end
#if(frame_number= 598 )
object { WindsorChair
    scale <1.299 ,1.299 ,1.299>}
#end
#if(frame_number= 599 )
object { WindsorChair
    scale <0.701 ,0.701 ,0.701>}
#end
#if(frame_number= 600 )
object { WindsorChair
    scale <1.300 ,1.300 ,1.300>}
#end
#if(frame_number= 601 )
object { WindsorChair
    scale <0.700 ,0.700 ,0.700>}
#end
#if(frame_number= 602 )
object { WindsorChair
    scale <1.301 ,1.301 ,1.301>}
#end
#if(frame_number= 603 )
object { WindsorChair
    scale <0.699 ,0.699 ,0.699>}
#end
#if(frame_number= 604 )
object { WindsorChair
    scale <1.302 ,1.302 ,1.302>}
#end
#if(frame_number= 605 )
object { WindsorChair
    scale <0.698 ,0.698 ,0.698>}
#end
#if(frame_number= 606 )
object { WindsorChair
    scale <1.303 ,1.303 ,1.303>}
#end
#if(frame_number= 607 )
object { WindsorChair
    scale <0.697 ,0.697 ,0.697>}
#end
#if(frame_number= 608 )
object { WindsorChair
    scale <1.304 ,1.304 ,1.304>}
#end
#if(frame_number= 609 )
object { WindsorChair
    scale <0.696 ,0.696 ,0.696>}
#end
#if(frame_number= 610 )
object { WindsorChair
    scale <1.305 ,1.305 ,1.305>}
#end
#if(frame_number= 611 )
object { WindsorChair
    scale <0.695 ,0.695 ,0.695>}
#end
#if(frame_number= 612 )
object { WindsorChair
    scale <1.306 ,1.306 ,1.306>}
#end
#if(frame_number= 613 )
object { WindsorChair
    scale <0.694 ,0.694 ,0.694>}
#end
#if(frame_number= 614 )
object { WindsorChair
    scale <1.307 ,1.307 ,1.307>}
#end
#if(frame_number= 615 )
object { WindsorChair
    scale <0.693 ,0.693 ,0.693>}
#end
#if(frame_number= 616 )
object { WindsorChair
    scale <1.308 ,1.308 ,1.308>}
#end
#if(frame_number= 617 )
object { WindsorChair
    scale <0.692 ,0.692 ,0.692>}
#end
#if(frame_number= 618 )
object { WindsorChair
    scale <1.309 ,1.309 ,1.309>}
#end
#if(frame_number= 619 )
object { WindsorChair
    scale <0.691 ,0.691 ,0.691>}
#end
#if(frame_number= 620 )
object { WindsorChair
    scale <1.310 ,1.310 ,1.310>}
#end
#if(frame_number= 621 )
object { WindsorChair
    scale <0.690 ,0.690 ,0.690>}
#end
#if(frame_number= 622 )
object { WindsorChair
    scale <1.311 ,1.311 ,1.311>}
#end
#if(frame_number= 623 )
object { WindsorChair
    scale <0.689 ,0.689 ,0.689>}
#end
#if(frame_number= 624 )
object { WindsorChair
    scale <1.312 ,1.312 ,1.312>}
#end
#if(frame_number= 625 )
object { WindsorChair
    scale <0.688 ,0.688 ,0.688>}
#end
#if(frame_number= 626 )
object { WindsorChair
    scale <1.313 ,1.313 ,1.313>}
#end
#if(frame_number= 627 )
object { WindsorChair
    scale <0.687 ,0.687 ,0.687>}
#end
#if(frame_number= 628 )
object { WindsorChair
    scale <1.314 ,1.314 ,1.314>}
#end
#if(frame_number= 629 )
object { WindsorChair
    scale <0.686 ,0.686 ,0.686>}
#end
#if(frame_number= 630 )
object { WindsorChair
    scale <1.315 ,1.315 ,1.315>}
#end
#if(frame_number= 631 )
object { WindsorChair
    scale <0.685 ,0.685 ,0.685>}
#end
#if(frame_number= 632 )
object { WindsorChair
    scale <1.316 ,1.316 ,1.316>}
#end
#if(frame_number= 633 )
object { WindsorChair
    scale <0.684 ,0.684 ,0.684>}
#end
#if(frame_number= 634 )
object { WindsorChair
    scale <1.317 ,1.317 ,1.317>}
#end
#if(frame_number= 635 )
object { WindsorChair
    scale <0.683 ,0.683 ,0.683>}
#end
#if(frame_number= 636 )
object { WindsorChair
    scale <1.318 ,1.318 ,1.318>}
#end
#if(frame_number= 637 )
object { WindsorChair
    scale <0.682 ,0.682 ,0.682>}
#end
#if(frame_number= 638 )
object { WindsorChair
    scale <1.319 ,1.319 ,1.319>}
#end
#if(frame_number= 639 )
object { WindsorChair
    scale <0.681 ,0.681 ,0.681>}
#end
#if(frame_number= 640 )
object { WindsorChair
    scale <1.320 ,1.320 ,1.320>}
#end
#if(frame_number= 641 )
object { WindsorChair
    scale <0.680 ,0.680 ,0.680>}
#end
#if(frame_number= 642 )
object { WindsorChair
    scale <1.321 ,1.321 ,1.321>}
#end
#if(frame_number= 643 )
object { WindsorChair
    scale <0.679 ,0.679 ,0.679>}
#end
#if(frame_number= 644 )
object { WindsorChair
    scale <1.322 ,1.322 ,1.322>}
#end
#if(frame_number= 645 )
object { WindsorChair
    scale <0.678 ,0.678 ,0.678>}
#end
#if(frame_number= 646 )
object { WindsorChair
    scale <1.323 ,1.323 ,1.323>}
#end
#if(frame_number= 647 )
object { WindsorChair
    scale <0.677 ,0.677 ,0.677>}
#end
#if(frame_number= 648 )
object { WindsorChair
    scale <1.324 ,1.324 ,1.324>}
#end
#if(frame_number= 649 )
object { WindsorChair
    scale <0.676 ,0.676 ,0.676>}
#end
#if(frame_number= 650 )
object { WindsorChair
    scale <1.325 ,1.325 ,1.325>}
#end
#if(frame_number= 651 )
object { WindsorChair
    scale <0.675 ,0.675 ,0.675>}
#end
#if(frame_number= 652 )
object { WindsorChair
    scale <1.326 ,1.326 ,1.326>}
#end
#if(frame_number= 653 )
object { WindsorChair
    scale <0.674 ,0.674 ,0.674>}
#end
#if(frame_number= 654 )
object { WindsorChair
    scale <1.327 ,1.327 ,1.327>}
#end
#if(frame_number= 655 )
object { WindsorChair
    scale <0.673 ,0.673 ,0.673>}
#end
#if(frame_number= 656 )
object { WindsorChair
    scale <1.328 ,1.328 ,1.328>}
#end
#if(frame_number= 657 )
object { WindsorChair
    scale <0.672 ,0.672 ,0.672>}
#end
#if(frame_number= 658 )
object { WindsorChair
    scale <1.329 ,1.329 ,1.329>}
#end
#if(frame_number= 659 )
object { WindsorChair
    scale <0.671 ,0.671 ,0.671>}
#end
#if(frame_number= 660 )
object { WindsorChair
    scale <1.330 ,1.330 ,1.330>}
#end
#if(frame_number= 661 )
object { WindsorChair
    scale <0.670 ,0.670 ,0.670>}
#end
#if(frame_number= 662 )
object { WindsorChair
    scale <1.331 ,1.331 ,1.331>}
#end
#if(frame_number= 663 )
object { WindsorChair
    scale <0.669 ,0.669 ,0.669>}
#end
#if(frame_number= 664 )
object { WindsorChair
    scale <1.332 ,1.332 ,1.332>}
#end
#if(frame_number= 665 )
object { WindsorChair
    scale <0.668 ,0.668 ,0.668>}
#end
#if(frame_number= 666 )
object { WindsorChair
    scale <1.333 ,1.333 ,1.333>}
#end
#if(frame_number= 667 )
object { WindsorChair
    scale <0.667 ,0.667 ,0.667>}
#end
#if(frame_number= 668 )
object { WindsorChair
    scale <1.334 ,1.334 ,1.334>}
#end
#if(frame_number= 669 )
object { WindsorChair
    scale <0.666 ,0.666 ,0.666>}
#end
#if(frame_number= 670 )
object { WindsorChair
    scale <1.335 ,1.335 ,1.335>}
#end
#if(frame_number= 671 )
object { WindsorChair
    scale <0.665 ,0.665 ,0.665>}
#end
#if(frame_number= 672 )
object { WindsorChair
    scale <1.336 ,1.336 ,1.336>}
#end
#if(frame_number= 673 )
object { WindsorChair
    scale <0.664 ,0.664 ,0.664>}
#end
#if(frame_number= 674 )
object { WindsorChair
    scale <1.337 ,1.337 ,1.337>}
#end
#if(frame_number= 675 )
object { WindsorChair
    scale <0.663 ,0.663 ,0.663>}
#end
#if(frame_number= 676 )
object { WindsorChair
    scale <1.338 ,1.338 ,1.338>}
#end
#if(frame_number= 677 )
object { WindsorChair
    scale <0.662 ,0.662 ,0.662>}
#end
#if(frame_number= 678 )
object { WindsorChair
    scale <1.339 ,1.339 ,1.339>}
#end
#if(frame_number= 679 )
object { WindsorChair
    scale <0.661 ,0.661 ,0.661>}
#end
#if(frame_number= 680 )
object { WindsorChair
    scale <1.340 ,1.340 ,1.340>}
#end
#if(frame_number= 681 )
object { WindsorChair
    scale <0.660 ,0.660 ,0.660>}
#end
#if(frame_number= 682 )
object { WindsorChair
    scale <1.341 ,1.341 ,1.341>}
#end
#if(frame_number= 683 )
object { WindsorChair
    scale <0.659 ,0.659 ,0.659>}
#end
#if(frame_number= 684 )
object { WindsorChair
    scale <1.342 ,1.342 ,1.342>}
#end
#if(frame_number= 685 )
object { WindsorChair
    scale <0.658 ,0.658 ,0.658>}
#end
#if(frame_number= 686 )
object { WindsorChair
    scale <1.343 ,1.343 ,1.343>}
#end
#if(frame_number= 687 )
object { WindsorChair
    scale <0.657 ,0.657 ,0.657>}
#end
#if(frame_number= 688 )
object { WindsorChair
    scale <1.344 ,1.344 ,1.344>}
#end
#if(frame_number= 689 )
object { WindsorChair
    scale <0.656 ,0.656 ,0.656>}
#end
#if(frame_number= 690 )
object { WindsorChair
    scale <1.345 ,1.345 ,1.345>}
#end
#if(frame_number= 691 )
object { WindsorChair
    scale <0.655 ,0.655 ,0.655>}
#end
#if(frame_number= 692 )
object { WindsorChair
    scale <1.346 ,1.346 ,1.346>}
#end
#if(frame_number= 693 )
object { WindsorChair
    scale <0.654 ,0.654 ,0.654>}
#end
#if(frame_number= 694 )
object { WindsorChair
    scale <1.347 ,1.347 ,1.347>}
#end
#if(frame_number= 695 )
object { WindsorChair
    scale <0.653 ,0.653 ,0.653>}
#end
#if(frame_number= 696 )
object { WindsorChair
    scale <1.348 ,1.348 ,1.348>}
#end
#if(frame_number= 697 )
object { WindsorChair
    scale <0.652 ,0.652 ,0.652>}
#end
#if(frame_number= 698 )
object { WindsorChair
    scale <1.349 ,1.349 ,1.349>}
#end
#if(frame_number= 699 )
object { WindsorChair
    scale <0.651 ,0.651 ,0.651>}
#end
#if(frame_number= 700 )
object { WindsorChair
    scale <1.350 ,1.350 ,1.350>}
#end
#if(frame_number= 701 )
object { WindsorChair
    scale <0.650 ,0.650 ,0.650>}
#end
#if(frame_number= 702 )
object { WindsorChair
    scale <1.351 ,1.351 ,1.351>}
#end
#if(frame_number= 703 )
object { WindsorChair
    scale <0.649 ,0.649 ,0.649>}
#end
#if(frame_number= 704 )
object { WindsorChair
    scale <1.352 ,1.352 ,1.352>}
#end
#if(frame_number= 705 )
object { WindsorChair
    scale <0.648 ,0.648 ,0.648>}
#end
#if(frame_number= 706 )
object { WindsorChair
    scale <1.353 ,1.353 ,1.353>}
#end
#if(frame_number= 707 )
object { WindsorChair
    scale <0.647 ,0.647 ,0.647>}
#end
#if(frame_number= 708 )
object { WindsorChair
    scale <1.354 ,1.354 ,1.354>}
#end
#if(frame_number= 709 )
object { WindsorChair
    scale <0.646 ,0.646 ,0.646>}
#end
#if(frame_number= 710 )
object { WindsorChair
    scale <1.355 ,1.355 ,1.355>}
#end
#if(frame_number= 711 )
object { WindsorChair
    scale <0.645 ,0.645 ,0.645>}
#end
#if(frame_number= 712 )
object { WindsorChair
    scale <1.356 ,1.356 ,1.356>}
#end
#if(frame_number= 713 )
object { WindsorChair
    scale <0.644 ,0.644 ,0.644>}
#end
#if(frame_number= 714 )
object { WindsorChair
    scale <1.357 ,1.357 ,1.357>}
#end
#if(frame_number= 715 )
object { WindsorChair
    scale <0.643 ,0.643 ,0.643>}
#end
#if(frame_number= 716 )
object { WindsorChair
    scale <1.358 ,1.358 ,1.358>}
#end
#if(frame_number= 717 )
object { WindsorChair
    scale <0.642 ,0.642 ,0.642>}
#end
#if(frame_number= 718 )
object { WindsorChair
    scale <1.359 ,1.359 ,1.359>}
#end
#if(frame_number= 719 )
object { WindsorChair
    scale <0.641 ,0.641 ,0.641>}
#end
#if(frame_number= 720 )
object { WindsorChair
    scale <1.360 ,1.360 ,1.360>}
#end
#if(frame_number= 721 )
object { WindsorChair
    scale <0.640 ,0.640 ,0.640>}
#end
#if(frame_number= 722 )
object { WindsorChair
    scale <1.361 ,1.361 ,1.361>}
#end
#if(frame_number= 723 )
object { WindsorChair
    scale <0.639 ,0.639 ,0.639>}
#end
#if(frame_number= 724 )
object { WindsorChair
    scale <1.362 ,1.362 ,1.362>}
#end
#if(frame_number= 725 )
object { WindsorChair
    scale <0.638 ,0.638 ,0.638>}
#end
#if(frame_number= 726 )
object { WindsorChair
    scale <1.363 ,1.363 ,1.363>}
#end
#if(frame_number= 727 )
object { WindsorChair
    scale <0.637 ,0.637 ,0.637>}
#end
#if(frame_number= 728 )
object { WindsorChair
    scale <1.364 ,1.364 ,1.364>}
#end
#if(frame_number= 729 )
object { WindsorChair
    scale <0.636 ,0.636 ,0.636>}
#end
#if(frame_number= 730 )
object { WindsorChair
    scale <1.365 ,1.365 ,1.365>}
#end
#if(frame_number= 731 )
object { WindsorChair
    scale <0.635 ,0.635 ,0.635>}
#end
#if(frame_number= 732 )
object { WindsorChair
    scale <1.366 ,1.366 ,1.366>}
#end
#if(frame_number= 733 )
object { WindsorChair
    scale <0.634 ,0.634 ,0.634>}
#end
#if(frame_number= 734 )
object { WindsorChair
    scale <1.367 ,1.367 ,1.367>}
#end
#if(frame_number= 735 )
object { WindsorChair
    scale <0.633 ,0.633 ,0.633>}
#end
#if(frame_number= 736 )
object { WindsorChair
    scale <1.368 ,1.368 ,1.368>}
#end
#if(frame_number= 737 )
object { WindsorChair
    scale <0.632 ,0.632 ,0.632>}
#end
#if(frame_number= 738 )
object { WindsorChair
    scale <1.369 ,1.369 ,1.369>}
#end
#if(frame_number= 739 )
object { WindsorChair
    scale <0.631 ,0.631 ,0.631>}
#end
#if(frame_number= 740 )
object { WindsorChair
    scale <1.370 ,1.370 ,1.370>}
#end
#if(frame_number= 741 )
object { WindsorChair
    scale <0.630 ,0.630 ,0.630>}
#end
#if(frame_number= 742 )
object { WindsorChair
    scale <1.371 ,1.371 ,1.371>}
#end
#if(frame_number= 743 )
object { WindsorChair
    scale <0.629 ,0.629 ,0.629>}
#end
#if(frame_number= 744 )
object { WindsorChair
    scale <1.372 ,1.372 ,1.372>}
#end
#if(frame_number= 745 )
object { WindsorChair
    scale <0.628 ,0.628 ,0.628>}
#end
#if(frame_number= 746 )
object { WindsorChair
    scale <1.373 ,1.373 ,1.373>}
#end
#if(frame_number= 747 )
object { WindsorChair
    scale <0.627 ,0.627 ,0.627>}
#end
#if(frame_number= 748 )
object { WindsorChair
    scale <1.374 ,1.374 ,1.374>}
#end
#if(frame_number= 749 )
object { WindsorChair
    scale <0.626 ,0.626 ,0.626>}
#end
#if(frame_number= 750 )
object { WindsorChair
    scale <1.375 ,1.375 ,1.375>}
#end
#if(frame_number= 751 )
object { WindsorChair
    scale <0.625 ,0.625 ,0.625>}
#end
#if(frame_number= 752 )
object { WindsorChair
    scale <1.376 ,1.376 ,1.376>}
#end
#if(frame_number= 753 )
object { WindsorChair
    scale <0.624 ,0.624 ,0.624>}
#end
#if(frame_number= 754 )
object { WindsorChair
    scale <1.377 ,1.377 ,1.377>}
#end
#if(frame_number= 755 )
object { WindsorChair
    scale <0.623 ,0.623 ,0.623>}
#end
#if(frame_number= 756 )
object { WindsorChair
    scale <1.378 ,1.378 ,1.378>}
#end
#if(frame_number= 757 )
object { WindsorChair
    scale <0.622 ,0.622 ,0.622>}
#end
#if(frame_number= 758 )
object { WindsorChair
    scale <1.379 ,1.379 ,1.379>}
#end
#if(frame_number= 759 )
object { WindsorChair
    scale <0.621 ,0.621 ,0.621>}
#end
#if(frame_number= 760 )
object { WindsorChair
    scale <1.380 ,1.380 ,1.380>}
#end
#if(frame_number= 761 )
object { WindsorChair
    scale <0.620 ,0.620 ,0.620>}
#end
#if(frame_number= 762 )
object { WindsorChair
    scale <1.381 ,1.381 ,1.381>}
#end
#if(frame_number= 763 )
object { WindsorChair
    scale <0.619 ,0.619 ,0.619>}
#end
#if(frame_number= 764 )
object { WindsorChair
    scale <1.382 ,1.382 ,1.382>}
#end
#if(frame_number= 765 )
object { WindsorChair
    scale <0.618 ,0.618 ,0.618>}
#end
#if(frame_number= 766 )
object { WindsorChair
    scale <1.383 ,1.383 ,1.383>}
#end
#if(frame_number= 767 )
object { WindsorChair
    scale <0.617 ,0.617 ,0.617>}
#end
#if(frame_number= 768 )
object { WindsorChair
    scale <1.384 ,1.384 ,1.384>}
#end
#if(frame_number= 769 )
object { WindsorChair
    scale <0.616 ,0.616 ,0.616>}
#end
#if(frame_number= 770 )
object { WindsorChair
    scale <1.385 ,1.385 ,1.385>}
#end
#if(frame_number= 771 )
object { WindsorChair
    scale <0.615 ,0.615 ,0.615>}
#end
#if(frame_number= 772 )
object { WindsorChair
    scale <1.386 ,1.386 ,1.386>}
#end
#if(frame_number= 773 )
object { WindsorChair
    scale <0.614 ,0.614 ,0.614>}
#end
#if(frame_number= 774 )
object { WindsorChair
    scale <1.387 ,1.387 ,1.387>}
#end
#if(frame_number= 775 )
object { WindsorChair
    scale <0.613 ,0.613 ,0.613>}
#end
#if(frame_number= 776 )
object { WindsorChair
    scale <1.388 ,1.388 ,1.388>}
#end
#if(frame_number= 777 )
object { WindsorChair
    scale <0.612 ,0.612 ,0.612>}
#end
#if(frame_number= 778 )
object { WindsorChair
    scale <1.389 ,1.389 ,1.389>}
#end
#if(frame_number= 779 )
object { WindsorChair
    scale <0.611 ,0.611 ,0.611>}
#end
#if(frame_number= 780 )
object { WindsorChair
    scale <1.390 ,1.390 ,1.390>}
#end
#if(frame_number= 781 )
object { WindsorChair
    scale <0.610 ,0.610 ,0.610>}
#end
#if(frame_number= 782 )
object { WindsorChair
    scale <1.391 ,1.391 ,1.391>}
#end
#if(frame_number= 783 )
object { WindsorChair
    scale <0.609 ,0.609 ,0.609>}
#end
#if(frame_number= 784 )
object { WindsorChair
    scale <1.392 ,1.392 ,1.392>}
#end
#if(frame_number= 785 )
object { WindsorChair
    scale <0.608 ,0.608 ,0.608>}
#end
#if(frame_number= 786 )
object { WindsorChair
    scale <1.393 ,1.393 ,1.393>}
#end
#if(frame_number= 787 )
object { WindsorChair
    scale <0.607 ,0.607 ,0.607>}
#end
#if(frame_number= 788 )
object { WindsorChair
    scale <1.394 ,1.394 ,1.394>}
#end
#if(frame_number= 789 )
object { WindsorChair
    scale <0.606 ,0.606 ,0.606>}
#end
#if(frame_number= 790 )
object { WindsorChair
    scale <1.395 ,1.395 ,1.395>}
#end
#if(frame_number= 791 )
object { WindsorChair
    scale <0.605 ,0.605 ,0.605>}
#end
#if(frame_number= 792 )
object { WindsorChair
    scale <1.396 ,1.396 ,1.396>}
#end
#if(frame_number= 793 )
object { WindsorChair
    scale <0.604 ,0.604 ,0.604>}
#end
#if(frame_number= 794 )
object { WindsorChair
    scale <1.397 ,1.397 ,1.397>}
#end
#if(frame_number= 795 )
object { WindsorChair
    scale <0.603 ,0.603 ,0.603>}
#end
#if(frame_number= 796 )
object { WindsorChair
    scale <1.398 ,1.398 ,1.398>}
#end
#if(frame_number= 797 )
object { WindsorChair
    scale <0.602 ,0.602 ,0.602>}
#end
#if(frame_number= 798 )
object { WindsorChair
    scale <1.399 ,1.399 ,1.399>}
#end
#if(frame_number= 799 )
object { WindsorChair
    scale <0.601 ,0.601 ,0.601>}
#end
#if(frame_number= 800 )
object { WindsorChair
    scale <1.400 ,1.400 ,1.400>}
#end
#if(frame_number= 801 )
object { WindsorChair
    scale <0.600 ,0.600 ,0.600>}
#end
#if(frame_number= 802 )
object { WindsorChair
    scale <1.401 ,1.401 ,1.401>}
#end
#if(frame_number= 803 )
object { WindsorChair
    scale <0.599 ,0.599 ,0.599>}
#end
#if(frame_number= 804 )
object { WindsorChair
    scale <1.402 ,1.402 ,1.402>}
#end
#if(frame_number= 805 )
object { WindsorChair
    scale <0.598 ,0.598 ,0.598>}
#end
#if(frame_number= 806 )
object { WindsorChair
    scale <1.403 ,1.403 ,1.403>}
#end
#if(frame_number= 807 )
object { WindsorChair
    scale <0.597 ,0.597 ,0.597>}
#end
#if(frame_number= 808 )
object { WindsorChair
    scale <1.404 ,1.404 ,1.404>}
#end
#if(frame_number= 809 )
object { WindsorChair
    scale <0.596 ,0.596 ,0.596>}
#end
#if(frame_number= 810 )
object { WindsorChair
    scale <1.405 ,1.405 ,1.405>}
#end
#if(frame_number= 811 )
object { WindsorChair
    scale <0.595 ,0.595 ,0.595>}
#end
#if(frame_number= 812 )
object { WindsorChair
    scale <1.406 ,1.406 ,1.406>}
#end
#if(frame_number= 813 )
object { WindsorChair
    scale <0.594 ,0.594 ,0.594>}
#end
#if(frame_number= 814 )
object { WindsorChair
    scale <1.407 ,1.407 ,1.407>}
#end
#if(frame_number= 815 )
object { WindsorChair
    scale <0.593 ,0.593 ,0.593>}
#end
#if(frame_number= 816 )
object { WindsorChair
    scale <1.408 ,1.408 ,1.408>}
#end
#if(frame_number= 817 )
object { WindsorChair
    scale <0.592 ,0.592 ,0.592>}
#end
#if(frame_number= 818 )
object { WindsorChair
    scale <1.409 ,1.409 ,1.409>}
#end
#if(frame_number= 819 )
object { WindsorChair
    scale <0.591 ,0.591 ,0.591>}
#end
#if(frame_number= 820 )
object { WindsorChair
    scale <1.410 ,1.410 ,1.410>}
#end
#if(frame_number= 821 )
object { WindsorChair
    scale <0.590 ,0.590 ,0.590>}
#end
#if(frame_number= 822 )
object { WindsorChair
    scale <1.411 ,1.411 ,1.411>}
#end
#if(frame_number= 823 )
object { WindsorChair
    scale <0.589 ,0.589 ,0.589>}
#end
#if(frame_number= 824 )
object { WindsorChair
    scale <1.412 ,1.412 ,1.412>}
#end
#if(frame_number= 825 )
object { WindsorChair
    scale <0.588 ,0.588 ,0.588>}
#end
#if(frame_number= 826 )
object { WindsorChair
    scale <1.413 ,1.413 ,1.413>}
#end
#if(frame_number= 827 )
object { WindsorChair
    scale <0.587 ,0.587 ,0.587>}
#end
#if(frame_number= 828 )
object { WindsorChair
    scale <1.414 ,1.414 ,1.414>}
#end
#if(frame_number= 829 )
object { WindsorChair
    scale <0.586 ,0.586 ,0.586>}
#end
#if(frame_number= 830 )
object { WindsorChair
    scale <1.415 ,1.415 ,1.415>}
#end
#if(frame_number= 831 )
object { WindsorChair
    scale <0.585 ,0.585 ,0.585>}
#end
#if(frame_number= 832 )
object { WindsorChair
    scale <1.416 ,1.416 ,1.416>}
#end
#if(frame_number= 833 )
object { WindsorChair
    scale <0.584 ,0.584 ,0.584>}
#end
#if(frame_number= 834 )
object { WindsorChair
    scale <1.417 ,1.417 ,1.417>}
#end
#if(frame_number= 835 )
object { WindsorChair
    scale <0.583 ,0.583 ,0.583>}
#end
#if(frame_number= 836 )
object { WindsorChair
    scale <1.418 ,1.418 ,1.418>}
#end
#if(frame_number= 837 )
object { WindsorChair
    scale <0.582 ,0.582 ,0.582>}
#end
#if(frame_number= 838 )
object { WindsorChair
    scale <1.419 ,1.419 ,1.419>}
#end
#if(frame_number= 839 )
object { WindsorChair
    scale <0.581 ,0.581 ,0.581>}
#end
#if(frame_number= 840 )
object { WindsorChair
    scale <1.420 ,1.420 ,1.420>}
#end
#if(frame_number= 841 )
object { WindsorChair
    scale <0.580 ,0.580 ,0.580>}
#end
#if(frame_number= 842 )
object { WindsorChair
    scale <1.421 ,1.421 ,1.421>}
#end
#if(frame_number= 843 )
object { WindsorChair
    scale <0.579 ,0.579 ,0.579>}
#end
#if(frame_number= 844 )
object { WindsorChair
    scale <1.422 ,1.422 ,1.422>}
#end
#if(frame_number= 845 )
object { WindsorChair
    scale <0.578 ,0.578 ,0.578>}
#end
#if(frame_number= 846 )
object { WindsorChair
    scale <1.423 ,1.423 ,1.423>}
#end
#if(frame_number= 847 )
object { WindsorChair
    scale <0.577 ,0.577 ,0.577>}
#end
#if(frame_number= 848 )
object { WindsorChair
    scale <1.424 ,1.424 ,1.424>}
#end
#if(frame_number= 849 )
object { WindsorChair
    scale <0.576 ,0.576 ,0.576>}
#end
#if(frame_number= 850 )
object { WindsorChair
    scale <1.425 ,1.425 ,1.425>}
#end
#if(frame_number= 851 )
object { WindsorChair
    scale <0.575 ,0.575 ,0.575>}
#end
#if(frame_number= 852 )
object { WindsorChair
    scale <1.426 ,1.426 ,1.426>}
#end
#if(frame_number= 853 )
object { WindsorChair
    scale <0.574 ,0.574 ,0.574>}
#end
#if(frame_number= 854 )
object { WindsorChair
    scale <1.427 ,1.427 ,1.427>}
#end
#if(frame_number= 855 )
object { WindsorChair
    scale <0.573 ,0.573 ,0.573>}
#end
#if(frame_number= 856 )
object { WindsorChair
    scale <1.428 ,1.428 ,1.428>}
#end
#if(frame_number= 857 )
object { WindsorChair
    scale <0.572 ,0.572 ,0.572>}
#end
#if(frame_number= 858 )
object { WindsorChair
    scale <1.429 ,1.429 ,1.429>}
#end
#if(frame_number= 859 )
object { WindsorChair
    scale <0.571 ,0.571 ,0.571>}
#end
#if(frame_number= 860 )
object { WindsorChair
    scale <1.430 ,1.430 ,1.430>}
#end
#if(frame_number= 861 )
object { WindsorChair
    scale <0.570 ,0.570 ,0.570>}
#end
#if(frame_number= 862 )
object { WindsorChair
    scale <1.431 ,1.431 ,1.431>}
#end
#if(frame_number= 863 )
object { WindsorChair
    scale <0.569 ,0.569 ,0.569>}
#end
#if(frame_number= 864 )
object { WindsorChair
    scale <1.432 ,1.432 ,1.432>}
#end
#if(frame_number= 865 )
object { WindsorChair
    scale <0.568 ,0.568 ,0.568>}
#end
#if(frame_number= 866 )
object { WindsorChair
    scale <1.433 ,1.433 ,1.433>}
#end
#if(frame_number= 867 )
object { WindsorChair
    scale <0.567 ,0.567 ,0.567>}
#end
#if(frame_number= 868 )
object { WindsorChair
    scale <1.434 ,1.434 ,1.434>}
#end
#if(frame_number= 869 )
object { WindsorChair
    scale <0.566 ,0.566 ,0.566>}
#end
#if(frame_number= 870 )
object { WindsorChair
    scale <1.435 ,1.435 ,1.435>}
#end
#if(frame_number= 871 )
object { WindsorChair
    scale <0.565 ,0.565 ,0.565>}
#end
#if(frame_number= 872 )
object { WindsorChair
    scale <1.436 ,1.436 ,1.436>}
#end
#if(frame_number= 873 )
object { WindsorChair
    scale <0.564 ,0.564 ,0.564>}
#end
#if(frame_number= 874 )
object { WindsorChair
    scale <1.437 ,1.437 ,1.437>}
#end
#if(frame_number= 875 )
object { WindsorChair
    scale <0.563 ,0.563 ,0.563>}
#end
#if(frame_number= 876 )
object { WindsorChair
    scale <1.438 ,1.438 ,1.438>}
#end
#if(frame_number= 877 )
object { WindsorChair
    scale <0.562 ,0.562 ,0.562>}
#end
#if(frame_number= 878 )
object { WindsorChair
    scale <1.439 ,1.439 ,1.439>}
#end
#if(frame_number= 879 )
object { WindsorChair
    scale <0.561 ,0.561 ,0.561>}
#end
#if(frame_number= 880 )
object { WindsorChair
    scale <1.440 ,1.440 ,1.440>}
#end
#if(frame_number= 881 )
object { WindsorChair
    scale <0.560 ,0.560 ,0.560>}
#end
#if(frame_number= 882 )
object { WindsorChair
    scale <1.441 ,1.441 ,1.441>}
#end
#if(frame_number= 883 )
object { WindsorChair
    scale <0.559 ,0.559 ,0.559>}
#end
#if(frame_number= 884 )
object { WindsorChair
    scale <1.442 ,1.442 ,1.442>}
#end
#if(frame_number= 885 )
object { WindsorChair
    scale <0.558 ,0.558 ,0.558>}
#end
#if(frame_number= 886 )
object { WindsorChair
    scale <1.443 ,1.443 ,1.443>}
#end
#if(frame_number= 887 )
object { WindsorChair
    scale <0.557 ,0.557 ,0.557>}
#end
#if(frame_number= 888 )
object { WindsorChair
    scale <1.444 ,1.444 ,1.444>}
#end
#if(frame_number= 889 )
object { WindsorChair
    scale <0.556 ,0.556 ,0.556>}
#end
#if(frame_number= 890 )
object { WindsorChair
    scale <1.445 ,1.445 ,1.445>}
#end
#if(frame_number= 891 )
object { WindsorChair
    scale <0.555 ,0.555 ,0.555>}
#end
#if(frame_number= 892 )
object { WindsorChair
    scale <1.446 ,1.446 ,1.446>}
#end
#if(frame_number= 893 )
object { WindsorChair
    scale <0.554 ,0.554 ,0.554>}
#end
#if(frame_number= 894 )
object { WindsorChair
    scale <1.447 ,1.447 ,1.447>}
#end
#if(frame_number= 895 )
object { WindsorChair
    scale <0.553 ,0.553 ,0.553>}
#end
#if(frame_number= 896 )
object { WindsorChair
    scale <1.448 ,1.448 ,1.448>}
#end
#if(frame_number= 897 )
object { WindsorChair
    scale <0.552 ,0.552 ,0.552>}
#end
#if(frame_number= 898 )
object { WindsorChair
    scale <1.449 ,1.449 ,1.449>}
#end
#if(frame_number= 899 )
object { WindsorChair
    scale <0.551 ,0.551 ,0.551>}
#end
#if(frame_number= 900 )
object { WindsorChair
    scale <1.450 ,1.450 ,1.450>}
#end
#if(frame_number= 901 )
object { WindsorChair
    scale <0.550 ,0.550 ,0.550>}
#end
#if(frame_number= 902 )
object { WindsorChair
    scale <1.451 ,1.451 ,1.451>}
#end
#if(frame_number= 903 )
object { WindsorChair
    scale <0.549 ,0.549 ,0.549>}
#end
#if(frame_number= 904 )
object { WindsorChair
    scale <1.452 ,1.452 ,1.452>}
#end
#if(frame_number= 905 )
object { WindsorChair
    scale <0.548 ,0.548 ,0.548>}
#end
#if(frame_number= 906 )
object { WindsorChair
    scale <1.453 ,1.453 ,1.453>}
#end
#if(frame_number= 907 )
object { WindsorChair
    scale <0.547 ,0.547 ,0.547>}
#end
#if(frame_number= 908 )
object { WindsorChair
    scale <1.454 ,1.454 ,1.454>}
#end
#if(frame_number= 909 )
object { WindsorChair
    scale <0.546 ,0.546 ,0.546>}
#end
#if(frame_number= 910 )
object { WindsorChair
    scale <1.455 ,1.455 ,1.455>}
#end
#if(frame_number= 911 )
object { WindsorChair
    scale <0.545 ,0.545 ,0.545>}
#end
#if(frame_number= 912 )
object { WindsorChair
    scale <1.456 ,1.456 ,1.456>}
#end
#if(frame_number= 913 )
object { WindsorChair
    scale <0.544 ,0.544 ,0.544>}
#end
#if(frame_number= 914 )
object { WindsorChair
    scale <1.457 ,1.457 ,1.457>}
#end
#if(frame_number= 915 )
object { WindsorChair
    scale <0.543 ,0.543 ,0.543>}
#end
#if(frame_number= 916 )
object { WindsorChair
    scale <1.458 ,1.458 ,1.458>}
#end
#if(frame_number= 917 )
object { WindsorChair
    scale <0.542 ,0.542 ,0.542>}
#end
#if(frame_number= 918 )
object { WindsorChair
    scale <1.459 ,1.459 ,1.459>}
#end
#if(frame_number= 919 )
object { WindsorChair
    scale <0.541 ,0.541 ,0.541>}
#end
#if(frame_number= 920 )
object { WindsorChair
    scale <1.460 ,1.460 ,1.460>}
#end
#if(frame_number= 921 )
object { WindsorChair
    scale <0.540 ,0.540 ,0.540>}
#end
