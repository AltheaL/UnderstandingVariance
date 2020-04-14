

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

    
// <Right, Up, Backwards>
// Don't touch backwards, only 2D movement

// Rotate List
#if(frame_number=1)
object { WindsorChair
    translate <0,0,0>
}
#end
#if(frame_number= 2 )
object { WindsorChair
    translate <0.000 ,0.100 ,0>}
#end
#if(frame_number= 3 )
object { WindsorChair
    translate <0.000 ,-0.100 ,0>}
#end
#if(frame_number= 4 )
object { WindsorChair
    translate <0.100 ,0.100 ,0>}
#end
#if(frame_number= 5 )
object { WindsorChair
    translate <-0.100 ,-0.100 ,0>}
#end
#if(frame_number= 6 )
object { WindsorChair
    translate <0.100 ,0.200 ,0>}
#end
#if(frame_number= 7 )
object { WindsorChair
    translate <-0.100 ,-0.200 ,0>}
#end
#if(frame_number= 8 )
object { WindsorChair
    translate <0.200 ,0.200 ,0>}
#end
#if(frame_number= 9 )
object { WindsorChair
    translate <-0.200 ,-0.200 ,0>}
#end
#if(frame_number= 10 )
object { WindsorChair
    translate <0.200 ,0.300 ,0>}
#end
#if(frame_number= 11 )
object { WindsorChair
    translate <-0.200 ,-0.300 ,0>}
#end
#if(frame_number= 12 )
object { WindsorChair
    translate <0.300 ,0.300 ,0>}
#end
#if(frame_number= 13 )
object { WindsorChair
    translate <-0.300 ,-0.300 ,0>}
#end
#if(frame_number= 14 )
object { WindsorChair
    translate <0.300 ,0.400 ,0>}
#end
#if(frame_number= 15 )
object { WindsorChair
    translate <-0.300 ,-0.400 ,0>}
#end
#if(frame_number= 16 )
object { WindsorChair
    translate <0.400 ,0.400 ,0>}
#end
#if(frame_number= 17 )
object { WindsorChair
    translate <-0.400 ,-0.400 ,0>}
#end
#if(frame_number= 18 )
object { WindsorChair
    translate <0.400 ,0.500 ,0>}
#end
#if(frame_number= 19 )
object { WindsorChair
    translate <-0.400 ,-0.500 ,0>}
#end
#if(frame_number= 20 )
object { WindsorChair
    translate <0.500 ,0.500 ,0>}
#end
#if(frame_number= 21 )
object { WindsorChair
    translate <-0.500 ,-0.500 ,0>}
#end
#if(frame_number= 22 )
object { WindsorChair
    translate <0.500 ,0.600 ,0>}
#end
#if(frame_number= 23 )
object { WindsorChair
    translate <-0.500 ,-0.600 ,0>}
#end
#if(frame_number= 24 )
object { WindsorChair
    translate <0.600 ,0.600 ,0>}
#end
#if(frame_number= 25 )
object { WindsorChair
    translate <-0.600 ,-0.600 ,0>}
#end
#if(frame_number= 26 )
object { WindsorChair
    translate <0.600 ,0.700 ,0>}
#end
#if(frame_number= 27 )
object { WindsorChair
    translate <-0.600 ,-0.700 ,0>}
#end
#if(frame_number= 28 )
object { WindsorChair
    translate <0.700 ,0.700 ,0>}
#end
#if(frame_number= 29 )
object { WindsorChair
    translate <-0.700 ,-0.700 ,0>}
#end
#if(frame_number= 30 )
object { WindsorChair
    translate <0.700 ,0.800 ,0>}
#end
#if(frame_number= 31 )
object { WindsorChair
    translate <-0.700 ,-0.800 ,0>}
#end
#if(frame_number= 32 )
object { WindsorChair
    translate <0.800 ,0.800 ,0>}
#end
#if(frame_number= 33 )
object { WindsorChair
    translate <-0.800 ,-0.800 ,0>}
#end
#if(frame_number= 34 )
object { WindsorChair
    translate <0.800 ,0.900 ,0>}
#end
#if(frame_number= 35 )
object { WindsorChair
    translate <-0.800 ,-0.900 ,0>}
#end
#if(frame_number= 36 )
object { WindsorChair
    translate <0.900 ,0.900 ,0>}
#end
#if(frame_number= 37 )
object { WindsorChair
    translate <-0.900 ,-0.900 ,0>}
#end
#if(frame_number= 38 )
object { WindsorChair
    translate <0.900 ,1.000 ,0>}
#end
#if(frame_number= 39 )
object { WindsorChair
    translate <-0.900 ,-1.000 ,0>}
#end
#if(frame_number= 40 )
object { WindsorChair
    translate <1.000 ,1.000 ,0>}
#end
#if(frame_number= 41 )
object { WindsorChair
    translate <-1.000 ,-1.000 ,0>}
#end
#if(frame_number= 42 )
object { WindsorChair
    translate <1.000 ,1.100 ,0>}
#end
#if(frame_number= 43 )
object { WindsorChair
    translate <-1.000 ,-1.100 ,0>}
#end
#if(frame_number= 44 )
object { WindsorChair
    translate <1.100 ,1.100 ,0>}
#end
#if(frame_number= 45 )
object { WindsorChair
    translate <-1.100 ,-1.100 ,0>}
#end
#if(frame_number= 46 )
object { WindsorChair
    translate <1.100 ,1.200 ,0>}
#end
#if(frame_number= 47 )
object { WindsorChair
    translate <-1.100 ,-1.200 ,0>}
#end
#if(frame_number= 48 )
object { WindsorChair
    translate <1.200 ,1.200 ,0>}
#end
#if(frame_number= 49 )
object { WindsorChair
    translate <-1.200 ,-1.200 ,0>}
#end
#if(frame_number= 50 )
object { WindsorChair
    translate <1.200 ,1.300 ,0>}
#end
#if(frame_number= 51 )
object { WindsorChair
    translate <-1.200 ,-1.300 ,0>}
#end
#if(frame_number= 52 )
object { WindsorChair
    translate <1.300 ,1.300 ,0>}
#end
#if(frame_number= 53 )
object { WindsorChair
    translate <-1.300 ,-1.300 ,0>}
#end
#if(frame_number= 54 )
object { WindsorChair
    translate <1.300 ,1.400 ,0>}
#end
#if(frame_number= 55 )
object { WindsorChair
    translate <-1.300 ,-1.400 ,0>}
#end
#if(frame_number= 56 )
object { WindsorChair
    translate <1.400 ,1.400 ,0>}
#end
#if(frame_number= 57 )
object { WindsorChair
    translate <-1.400 ,-1.400 ,0>}
#end
#if(frame_number= 58 )
object { WindsorChair
    translate <1.400 ,1.500 ,0>}
#end
#if(frame_number= 59 )
object { WindsorChair
    translate <-1.400 ,-1.500 ,0>}
#end
#if(frame_number= 60 )
object { WindsorChair
    translate <1.500 ,1.500 ,0>}
#end
#if(frame_number= 61 )
object { WindsorChair
    translate <-1.500 ,-1.500 ,0>}
#end
#if(frame_number= 62 )
object { WindsorChair
    translate <1.500 ,1.600 ,0>}
#end
#if(frame_number= 63 )
object { WindsorChair
    translate <-1.500 ,-1.600 ,0>}
#end
#if(frame_number= 64 )
object { WindsorChair
    translate <1.600 ,1.600 ,0>}
#end
#if(frame_number= 65 )
object { WindsorChair
    translate <-1.600 ,-1.600 ,0>}
#end
#if(frame_number= 66 )
object { WindsorChair
    translate <1.600 ,1.700 ,0>}
#end
#if(frame_number= 67 )
object { WindsorChair
    translate <-1.600 ,-1.700 ,0>}
#end
#if(frame_number= 68 )
object { WindsorChair
    translate <1.700 ,1.700 ,0>}
#end
#if(frame_number= 69 )
object { WindsorChair
    translate <-1.700 ,-1.700 ,0>}
#end
#if(frame_number= 70 )
object { WindsorChair
    translate <1.700 ,1.800 ,0>}
#end
#if(frame_number= 71 )
object { WindsorChair
    translate <-1.700 ,-1.800 ,0>}
#end
#if(frame_number= 72 )
object { WindsorChair
    translate <1.800 ,1.800 ,0>}
#end
#if(frame_number= 73 )
object { WindsorChair
    translate <-1.800 ,-1.800 ,0>}
#end
#if(frame_number= 74 )
object { WindsorChair
    translate <1.800 ,1.900 ,0>}
#end
#if(frame_number= 75 )
object { WindsorChair
    translate <-1.800 ,-1.900 ,0>}
#end
#if(frame_number= 76 )
object { WindsorChair
    translate <1.900 ,1.900 ,0>}
#end
#if(frame_number= 77 )
object { WindsorChair
    translate <-1.900 ,-1.900 ,0>}
#end
#if(frame_number= 78 )
object { WindsorChair
    translate <1.900 ,2.000 ,0>}
#end
#if(frame_number= 79 )
object { WindsorChair
    translate <-1.900 ,-2.000 ,0>}
#end
#if(frame_number= 80 )
object { WindsorChair
    translate <2.000 ,2.000 ,0>}
#end
#if(frame_number= 81 )
object { WindsorChair
    translate <-2.000 ,-2.000 ,0>}
#end
#if(frame_number= 82 )
object { WindsorChair
    translate <2.000 ,2.100 ,0>}
#end
#if(frame_number= 83 )
object { WindsorChair
    translate <-2.000 ,-2.100 ,0>}
#end
#if(frame_number= 84 )
object { WindsorChair
    translate <2.100 ,2.100 ,0>}
#end
#if(frame_number= 85 )
object { WindsorChair
    translate <-2.100 ,-2.100 ,0>}
#end
#if(frame_number= 86 )
object { WindsorChair
    translate <2.100 ,2.200 ,0>}
#end
#if(frame_number= 87 )
object { WindsorChair
    translate <-2.100 ,-2.200 ,0>}
#end
#if(frame_number= 88 )
object { WindsorChair
    translate <2.200 ,2.200 ,0>}
#end
#if(frame_number= 89 )
object { WindsorChair
    translate <-2.200 ,-2.200 ,0>}
#end
#if(frame_number= 90 )
object { WindsorChair
    translate <2.200 ,2.300 ,0>}
#end
#if(frame_number= 91 )
object { WindsorChair
    translate <-2.200 ,-2.300 ,0>}
#end
#if(frame_number= 92 )
object { WindsorChair
    translate <2.300 ,2.300 ,0>}
#end
#if(frame_number= 93 )
object { WindsorChair
    translate <-2.300 ,-2.300 ,0>}
#end
#if(frame_number= 94 )
object { WindsorChair
    translate <2.300 ,2.400 ,0>}
#end
#if(frame_number= 95 )
object { WindsorChair
    translate <-2.300 ,-2.400 ,0>}
#end
#if(frame_number= 96 )
object { WindsorChair
    translate <2.400 ,2.400 ,0>}
#end
#if(frame_number= 97 )
object { WindsorChair
    translate <-2.400 ,-2.400 ,0>}
#end
#if(frame_number= 98 )
object { WindsorChair
    translate <2.400 ,2.500 ,0>}
#end
#if(frame_number= 99 )
object { WindsorChair
    translate <-2.400 ,-2.500 ,0>}
#end
#if(frame_number= 100 )
object { WindsorChair
    translate <2.500 ,2.500 ,0>}
#end
#if(frame_number= 101 )
object { WindsorChair
    translate <-2.500 ,-2.500 ,0>}
#end
#if(frame_number= 102 )
object { WindsorChair
    translate <2.500 ,2.600 ,0>}
#end
#if(frame_number= 103 )
object { WindsorChair
    translate <-2.500 ,-2.600 ,0>}
#end
#if(frame_number= 104 )
object { WindsorChair
    translate <2.600 ,2.600 ,0>}
#end
#if(frame_number= 105 )
object { WindsorChair
    translate <-2.600 ,-2.600 ,0>}
#end
#if(frame_number= 106 )
object { WindsorChair
    translate <2.600 ,2.700 ,0>}
#end
#if(frame_number= 107 )
object { WindsorChair
    translate <-2.600 ,-2.700 ,0>}
#end
#if(frame_number= 108 )
object { WindsorChair
    translate <2.700 ,2.700 ,0>}
#end
#if(frame_number= 109 )
object { WindsorChair
    translate <-2.700 ,-2.700 ,0>}
#end
#if(frame_number= 110 )
object { WindsorChair
    translate <2.700 ,2.800 ,0>}
#end
#if(frame_number= 111 )
object { WindsorChair
    translate <-2.700 ,-2.800 ,0>}
#end
#if(frame_number= 112 )
object { WindsorChair
    translate <2.800 ,2.800 ,0>}
#end
#if(frame_number= 113 )
object { WindsorChair
    translate <-2.800 ,-2.800 ,0>}
#end
#if(frame_number= 114 )
object { WindsorChair
    translate <2.800 ,2.900 ,0>}
#end
#if(frame_number= 115 )
object { WindsorChair
    translate <-2.800 ,-2.900 ,0>}
#end
#if(frame_number= 116 )
object { WindsorChair
    translate <2.900 ,2.900 ,0>}
#end
#if(frame_number= 117 )
object { WindsorChair
    translate <-2.900 ,-2.900 ,0>}
#end
#if(frame_number= 118 )
object { WindsorChair
    translate <2.900 ,3.000 ,0>}
#end
#if(frame_number= 119 )
object { WindsorChair
    translate <-2.900 ,-3.000 ,0>}
#end
#if(frame_number= 120 )
object { WindsorChair
    translate <3.000 ,3.000 ,0>}
#end
#if(frame_number= 121 )
object { WindsorChair
    translate <-3.000 ,-3.000 ,0>}
#end
#if(frame_number= 122 )
object { WindsorChair
    translate <3.000 ,3.100 ,0>}
#end
#if(frame_number= 123 )
object { WindsorChair
    translate <-3.000 ,-3.100 ,0>}
#end
#if(frame_number= 124 )
object { WindsorChair
    translate <3.100 ,3.100 ,0>}
#end
#if(frame_number= 125 )
object { WindsorChair
    translate <-3.100 ,-3.100 ,0>}
#end
#if(frame_number= 126 )
object { WindsorChair
    translate <3.100 ,3.200 ,0>}
#end
#if(frame_number= 127 )
object { WindsorChair
    translate <-3.100 ,-3.200 ,0>}
#end
#if(frame_number= 128 )
object { WindsorChair
    translate <3.200 ,3.200 ,0>}
#end
#if(frame_number= 129 )
object { WindsorChair
    translate <-3.200 ,-3.200 ,0>}
#end
#if(frame_number= 130 )
object { WindsorChair
    translate <3.200 ,3.300 ,0>}
#end
#if(frame_number= 131 )
object { WindsorChair
    translate <-3.200 ,-3.300 ,0>}
#end
#if(frame_number= 132 )
object { WindsorChair
    translate <3.300 ,3.300 ,0>}
#end
#if(frame_number= 133 )
object { WindsorChair
    translate <-3.300 ,-3.300 ,0>}
#end
#if(frame_number= 134 )
object { WindsorChair
    translate <3.300 ,3.400 ,0>}
#end
#if(frame_number= 135 )
object { WindsorChair
    translate <-3.300 ,-3.400 ,0>}
#end
#if(frame_number= 136 )
object { WindsorChair
    translate <3.400 ,3.400 ,0>}
#end
#if(frame_number= 137 )
object { WindsorChair
    translate <-3.400 ,-3.400 ,0>}
#end
#if(frame_number= 138 )
object { WindsorChair
    translate <3.400 ,3.500 ,0>}
#end
#if(frame_number= 139 )
object { WindsorChair
    translate <-3.400 ,-3.500 ,0>}
#end
#if(frame_number= 140 )
object { WindsorChair
    translate <3.500 ,3.500 ,0>}
#end
#if(frame_number= 141 )
object { WindsorChair
    translate <-3.500 ,-3.500 ,0>}
#end
#if(frame_number= 142 )
object { WindsorChair
    translate <3.500 ,3.600 ,0>}
#end
#if(frame_number= 143 )
object { WindsorChair
    translate <-3.500 ,-3.600 ,0>}
#end
#if(frame_number= 144 )
object { WindsorChair
    translate <3.600 ,3.600 ,0>}
#end
#if(frame_number= 145 )
object { WindsorChair
    translate <-3.600 ,-3.600 ,0>}
#end
#if(frame_number= 146 )
object { WindsorChair
    translate <3.600 ,3.700 ,0>}
#end
#if(frame_number= 147 )
object { WindsorChair
    translate <-3.600 ,-3.700 ,0>}
#end
#if(frame_number= 148 )
object { WindsorChair
    translate <3.700 ,3.700 ,0>}
#end
#if(frame_number= 149 )
object { WindsorChair
    translate <-3.700 ,-3.700 ,0>}
#end
#if(frame_number= 150 )
object { WindsorChair
    translate <3.700 ,3.800 ,0>}
#end
#if(frame_number= 151 )
object { WindsorChair
    translate <-3.700 ,-3.800 ,0>}
#end
#if(frame_number= 152 )
object { WindsorChair
    translate <3.800 ,3.800 ,0>}
#end
#if(frame_number= 153 )
object { WindsorChair
    translate <-3.800 ,-3.800 ,0>}
#end
#if(frame_number= 154 )
object { WindsorChair
    translate <3.800 ,3.900 ,0>}
#end
#if(frame_number= 155 )
object { WindsorChair
    translate <-3.800 ,-3.900 ,0>}
#end
#if(frame_number= 156 )
object { WindsorChair
    translate <3.900 ,3.900 ,0>}
#end
#if(frame_number= 157 )
object { WindsorChair
    translate <-3.900 ,-3.900 ,0>}
#end
#if(frame_number= 158 )
object { WindsorChair
    translate <3.900 ,4.000 ,0>}
#end
#if(frame_number= 159 )
object { WindsorChair
    translate <-3.900 ,-4.000 ,0>}
#end
#if(frame_number= 160 )
object { WindsorChair
    translate <4.000 ,4.000 ,0>}
#end
#if(frame_number= 161 )
object { WindsorChair
    translate <-4.000 ,-4.000 ,0>}
#end
#if(frame_number= 162 )
object { WindsorChair
    translate <4.000 ,4.100 ,0>}
#end
#if(frame_number= 163 )
object { WindsorChair
    translate <-4.000 ,-4.100 ,0>}
#end
#if(frame_number= 164 )
object { WindsorChair
    translate <4.100 ,4.100 ,0>}
#end
#if(frame_number= 165 )
object { WindsorChair
    translate <-4.100 ,-4.100 ,0>}
#end
#if(frame_number= 166 )
object { WindsorChair
    translate <4.100 ,4.200 ,0>}
#end
#if(frame_number= 167 )
object { WindsorChair
    translate <-4.100 ,-4.200 ,0>}
#end
#if(frame_number= 168 )
object { WindsorChair
    translate <4.200 ,4.200 ,0>}
#end
#if(frame_number= 169 )
object { WindsorChair
    translate <-4.200 ,-4.200 ,0>}
#end
#if(frame_number= 170 )
object { WindsorChair
    translate <4.200 ,4.300 ,0>}
#end
#if(frame_number= 171 )
object { WindsorChair
    translate <-4.200 ,-4.300 ,0>}
#end
#if(frame_number= 172 )
object { WindsorChair
    translate <4.300 ,4.300 ,0>}
#end
#if(frame_number= 173 )
object { WindsorChair
    translate <-4.300 ,-4.300 ,0>}
#end
#if(frame_number= 174 )
object { WindsorChair
    translate <4.300 ,4.400 ,0>}
#end
#if(frame_number= 175 )
object { WindsorChair
    translate <-4.300 ,-4.400 ,0>}
#end
#if(frame_number= 176 )
object { WindsorChair
    translate <4.400 ,4.400 ,0>}
#end
#if(frame_number= 177 )
object { WindsorChair
    translate <-4.400 ,-4.400 ,0>}
#end
#if(frame_number= 178 )
object { WindsorChair
    translate <4.400 ,4.500 ,0>}
#end
#if(frame_number= 179 )
object { WindsorChair
    translate <-4.400 ,-4.500 ,0>}
#end
#if(frame_number= 180 )
object { WindsorChair
    translate <4.500 ,4.500 ,0>}
#end
#if(frame_number= 181 )
object { WindsorChair
    translate <-4.500 ,-4.500 ,0>}
#end
#if(frame_number= 182 )
object { WindsorChair
    translate <4.500 ,4.600 ,0>}
#end
#if(frame_number= 183 )
object { WindsorChair
    translate <-4.500 ,-4.600 ,0>}
#end
#if(frame_number= 184 )
object { WindsorChair
    translate <4.600 ,4.600 ,0>}
#end
#if(frame_number= 185 )
object { WindsorChair
    translate <-4.600 ,-4.600 ,0>}
#end
#if(frame_number= 186 )
object { WindsorChair
    translate <4.600 ,4.700 ,0>}
#end
#if(frame_number= 187 )
object { WindsorChair
    translate <-4.600 ,-4.700 ,0>}
#end
#if(frame_number= 188 )
object { WindsorChair
    translate <4.700 ,4.700 ,0>}
#end
#if(frame_number= 189 )
object { WindsorChair
    translate <-4.700 ,-4.700 ,0>}
#end
#if(frame_number= 190 )
object { WindsorChair
    translate <4.700 ,4.800 ,0>}
#end
#if(frame_number= 191 )
object { WindsorChair
    translate <-4.700 ,-4.800 ,0>}
#end
#if(frame_number= 192 )
object { WindsorChair
    translate <4.800 ,4.800 ,0>}
#end
#if(frame_number= 193 )
object { WindsorChair
    translate <-4.800 ,-4.800 ,0>}
#end
#if(frame_number= 194 )
object { WindsorChair
    translate <4.800 ,4.900 ,0>}
#end
#if(frame_number= 195 )
object { WindsorChair
    translate <-4.800 ,-4.900 ,0>}
#end
#if(frame_number= 196 )
object { WindsorChair
    translate <4.900 ,4.900 ,0>}
#end
#if(frame_number= 197 )
object { WindsorChair
    translate <-4.900 ,-4.900 ,0>}
#end
#if(frame_number= 198 )
object { WindsorChair
    translate <4.900 ,5.000 ,0>}
#end
#if(frame_number= 199 )
object { WindsorChair
    translate <-4.900 ,-5.000 ,0>}
#end
#if(frame_number= 200 )
object { WindsorChair
    translate <5.000 ,5.000 ,0>}
#end
#if(frame_number= 201 )
object { WindsorChair
    translate <-5.000 ,-5.000 ,0>}
#end
#if(frame_number= 202 )
object { WindsorChair
    translate <5.000 ,5.100 ,0>}
#end
#if(frame_number= 203 )
object { WindsorChair
    translate <-5.000 ,-5.100 ,0>}
#end
#if(frame_number= 204 )
object { WindsorChair
    translate <5.100 ,5.100 ,0>}
#end
#if(frame_number= 205 )
object { WindsorChair
    translate <-5.100 ,-5.100 ,0>}
#end
#if(frame_number= 206 )
object { WindsorChair
    translate <5.100 ,5.200 ,0>}
#end
#if(frame_number= 207 )
object { WindsorChair
    translate <-5.100 ,-5.200 ,0>}
#end
#if(frame_number= 208 )
object { WindsorChair
    translate <5.200 ,5.200 ,0>}
#end
#if(frame_number= 209 )
object { WindsorChair
    translate <-5.200 ,-5.200 ,0>}
#end
#if(frame_number= 210 )
object { WindsorChair
    translate <5.200 ,5.300 ,0>}
#end
#if(frame_number= 211 )
object { WindsorChair
    translate <-5.200 ,-5.300 ,0>}
#end
#if(frame_number= 212 )
object { WindsorChair
    translate <5.300 ,5.300 ,0>}
#end
#if(frame_number= 213 )
object { WindsorChair
    translate <-5.300 ,-5.300 ,0>}
#end
#if(frame_number= 214 )
object { WindsorChair
    translate <5.300 ,5.400 ,0>}
#end
#if(frame_number= 215 )
object { WindsorChair
    translate <-5.300 ,-5.400 ,0>}
#end
#if(frame_number= 216 )
object { WindsorChair
    translate <5.400 ,5.400 ,0>}
#end
#if(frame_number= 217 )
object { WindsorChair
    translate <-5.400 ,-5.400 ,0>}
#end
#if(frame_number= 218 )
object { WindsorChair
    translate <5.400 ,5.500 ,0>}
#end
#if(frame_number= 219 )
object { WindsorChair
    translate <-5.400 ,-5.500 ,0>}
#end
#if(frame_number= 220 )
object { WindsorChair
    translate <5.500 ,5.500 ,0>}
#end
#if(frame_number= 221 )
object { WindsorChair
    translate <-5.500 ,-5.500 ,0>}
#end
#if(frame_number= 222 )
object { WindsorChair
    translate <5.500 ,5.600 ,0>}
#end
#if(frame_number= 223 )
object { WindsorChair
    translate <-5.500 ,-5.600 ,0>}
#end
#if(frame_number= 224 )
object { WindsorChair
    translate <5.600 ,5.600 ,0>}
#end
#if(frame_number= 225 )
object { WindsorChair
    translate <-5.600 ,-5.600 ,0>}
#end
#if(frame_number= 226 )
object { WindsorChair
    translate <5.600 ,5.700 ,0>}
#end
#if(frame_number= 227 )
object { WindsorChair
    translate <-5.600 ,-5.700 ,0>}
#end
#if(frame_number= 228 )
object { WindsorChair
    translate <5.700 ,5.700 ,0>}
#end
#if(frame_number= 229 )
object { WindsorChair
    translate <-5.700 ,-5.700 ,0>}
#end
#if(frame_number= 230 )
object { WindsorChair
    translate <5.700 ,5.800 ,0>}
#end
#if(frame_number= 231 )
object { WindsorChair
    translate <-5.700 ,-5.800 ,0>}
#end
#if(frame_number= 232 )
object { WindsorChair
    translate <5.800 ,5.800 ,0>}
#end
#if(frame_number= 233 )
object { WindsorChair
    translate <-5.800 ,-5.800 ,0>}
#end
#if(frame_number= 234 )
object { WindsorChair
    translate <5.800 ,5.900 ,0>}
#end
#if(frame_number= 235 )
object { WindsorChair
    translate <-5.800 ,-5.900 ,0>}
#end
#if(frame_number= 236 )
object { WindsorChair
    translate <5.900 ,5.900 ,0>}
#end
#if(frame_number= 237 )
object { WindsorChair
    translate <-5.900 ,-5.900 ,0>}
#end
#if(frame_number= 238 )
object { WindsorChair
    translate <5.900 ,6.000 ,0>}
#end
#if(frame_number= 239 )
object { WindsorChair
    translate <-5.900 ,-6.000 ,0>}
#end
#if(frame_number= 240 )
object { WindsorChair
    translate <6.000 ,6.000 ,0>}
#end
#if(frame_number= 241 )
object { WindsorChair
    translate <-6.000 ,-6.000 ,0>}
#end
#if(frame_number= 242 )
object { WindsorChair
    translate <6.000 ,6.100 ,0>}
#end
#if(frame_number= 243 )
object { WindsorChair
    translate <-6.000 ,-6.100 ,0>}
#end
#if(frame_number= 244 )
object { WindsorChair
    translate <6.100 ,6.100 ,0>}
#end
#if(frame_number= 245 )
object { WindsorChair
    translate <-6.100 ,-6.100 ,0>}
#end
#if(frame_number= 246 )
object { WindsorChair
    translate <6.100 ,6.200 ,0>}
#end
#if(frame_number= 247 )
object { WindsorChair
    translate <-6.100 ,-6.200 ,0>}
#end
#if(frame_number= 248 )
object { WindsorChair
    translate <6.200 ,6.200 ,0>}
#end
#if(frame_number= 249 )
object { WindsorChair
    translate <-6.200 ,-6.200 ,0>}
#end
#if(frame_number= 250 )
object { WindsorChair
    translate <6.200 ,6.300 ,0>}
#end
#if(frame_number= 251 )
object { WindsorChair
    translate <-6.200 ,-6.300 ,0>}
#end
#if(frame_number= 252 )
object { WindsorChair
    translate <6.300 ,6.300 ,0>}
#end
#if(frame_number= 253 )
object { WindsorChair
    translate <-6.300 ,-6.300 ,0>}
#end
#if(frame_number= 254 )
object { WindsorChair
    translate <6.300 ,6.400 ,0>}
#end
#if(frame_number= 255 )
object { WindsorChair
    translate <-6.300 ,-6.400 ,0>}
#end
#if(frame_number= 256 )
object { WindsorChair
    translate <6.400 ,6.400 ,0>}
#end
#if(frame_number= 257 )
object { WindsorChair
    translate <-6.400 ,-6.400 ,0>}
#end
#if(frame_number= 258 )
object { WindsorChair
    translate <6.400 ,6.500 ,0>}
#end
#if(frame_number= 259 )
object { WindsorChair
    translate <-6.400 ,-6.500 ,0>}
#end
#if(frame_number= 260 )
object { WindsorChair
    translate <6.500 ,6.500 ,0>}
#end
#if(frame_number= 261 )
object { WindsorChair
    translate <-6.500 ,-6.500 ,0>}
#end
#if(frame_number= 262 )
object { WindsorChair
    translate <6.500 ,6.600 ,0>}
#end
#if(frame_number= 263 )
object { WindsorChair
    translate <-6.500 ,-6.600 ,0>}
#end
#if(frame_number= 264 )
object { WindsorChair
    translate <6.600 ,6.600 ,0>}
#end
#if(frame_number= 265 )
object { WindsorChair
    translate <-6.600 ,-6.600 ,0>}
#end
#if(frame_number= 266 )
object { WindsorChair
    translate <6.600 ,6.700 ,0>}
#end
#if(frame_number= 267 )
object { WindsorChair
    translate <-6.600 ,-6.700 ,0>}
#end
#if(frame_number= 268 )
object { WindsorChair
    translate <6.700 ,6.700 ,0>}
#end
#if(frame_number= 269 )
object { WindsorChair
    translate <-6.700 ,-6.700 ,0>}
#end
#if(frame_number= 270 )
object { WindsorChair
    translate <6.700 ,6.800 ,0>}
#end
#if(frame_number= 271 )
object { WindsorChair
    translate <-6.700 ,-6.800 ,0>}
#end
#if(frame_number= 272 )
object { WindsorChair
    translate <6.800 ,6.800 ,0>}
#end
#if(frame_number= 273 )
object { WindsorChair
    translate <-6.800 ,-6.800 ,0>}
#end
#if(frame_number= 274 )
object { WindsorChair
    translate <6.800 ,6.900 ,0>}
#end
#if(frame_number= 275 )
object { WindsorChair
    translate <-6.800 ,-6.900 ,0>}
#end
#if(frame_number= 276 )
object { WindsorChair
    translate <6.900 ,6.900 ,0>}
#end
#if(frame_number= 277 )
object { WindsorChair
    translate <-6.900 ,-6.900 ,0>}
#end
#if(frame_number= 278 )
object { WindsorChair
    translate <6.900 ,7.000 ,0>}
#end
#if(frame_number= 279 )
object { WindsorChair
    translate <-6.900 ,-7.000 ,0>}
#end
#if(frame_number= 280 )
object { WindsorChair
    translate <7.000 ,7.000 ,0>}
#end
#if(frame_number= 281 )
object { WindsorChair
    translate <-7.000 ,-7.000 ,0>}
#end
#if(frame_number= 282 )
object { WindsorChair
    translate <7.000 ,7.100 ,0>}
#end
#if(frame_number= 283 )
object { WindsorChair
    translate <-7.000 ,-7.100 ,0>}
#end
#if(frame_number= 284 )
object { WindsorChair
    translate <7.100 ,7.100 ,0>}
#end
#if(frame_number= 285 )
object { WindsorChair
    translate <-7.100 ,-7.100 ,0>}
#end
#if(frame_number= 286 )
object { WindsorChair
    translate <7.100 ,7.200 ,0>}
#end
#if(frame_number= 287 )
object { WindsorChair
    translate <-7.100 ,-7.200 ,0>}
#end
#if(frame_number= 288 )
object { WindsorChair
    translate <7.200 ,7.200 ,0>}
#end
#if(frame_number= 289 )
object { WindsorChair
    translate <-7.200 ,-7.200 ,0>}
#end
#if(frame_number= 290 )
object { WindsorChair
    translate <7.200 ,7.300 ,0>}
#end
#if(frame_number= 291 )
object { WindsorChair
    translate <-7.200 ,-7.300 ,0>}
#end
#if(frame_number= 292 )
object { WindsorChair
    translate <7.300 ,7.300 ,0>}
#end
#if(frame_number= 293 )
object { WindsorChair
    translate <-7.300 ,-7.300 ,0>}
#end
#if(frame_number= 294 )
object { WindsorChair
    translate <7.300 ,7.400 ,0>}
#end
#if(frame_number= 295 )
object { WindsorChair
    translate <-7.300 ,-7.400 ,0>}
#end
#if(frame_number= 296 )
object { WindsorChair
    translate <7.400 ,7.400 ,0>}
#end
#if(frame_number= 297 )
object { WindsorChair
    translate <-7.400 ,-7.400 ,0>}
#end
#if(frame_number= 298 )
object { WindsorChair
    translate <7.400 ,7.500 ,0>}
#end
#if(frame_number= 299 )
object { WindsorChair
    translate <-7.400 ,-7.500 ,0>}
#end
#if(frame_number= 300 )
object { WindsorChair
    translate <7.500 ,7.500 ,0>}
#end
#if(frame_number= 301 )
object { WindsorChair
    translate <-7.500 ,-7.500 ,0>}
#end
#if(frame_number= 302 )
object { WindsorChair
    translate <7.500 ,7.600 ,0>}
#end
#if(frame_number= 303 )
object { WindsorChair
    translate <-7.500 ,-7.600 ,0>}
#end
#if(frame_number= 304 )
object { WindsorChair
    translate <7.600 ,7.600 ,0>}
#end
#if(frame_number= 305 )
object { WindsorChair
    translate <-7.600 ,-7.600 ,0>}
#end
#if(frame_number= 306 )
object { WindsorChair
    translate <7.600 ,7.700 ,0>}
#end
#if(frame_number= 307 )
object { WindsorChair
    translate <-7.600 ,-7.700 ,0>}
#end
#if(frame_number= 308 )
object { WindsorChair
    translate <7.700 ,7.700 ,0>}
#end
#if(frame_number= 309 )
object { WindsorChair
    translate <-7.700 ,-7.700 ,0>}
#end
#if(frame_number= 310 )
object { WindsorChair
    translate <7.700 ,7.800 ,0>}
#end
#if(frame_number= 311 )
object { WindsorChair
    translate <-7.700 ,-7.800 ,0>}
#end
#if(frame_number= 312 )
object { WindsorChair
    translate <7.800 ,7.800 ,0>}
#end
#if(frame_number= 313 )
object { WindsorChair
    translate <-7.800 ,-7.800 ,0>}
#end
#if(frame_number= 314 )
object { WindsorChair
    translate <7.800 ,7.900 ,0>}
#end
#if(frame_number= 315 )
object { WindsorChair
    translate <-7.800 ,-7.900 ,0>}
#end
#if(frame_number= 316 )
object { WindsorChair
    translate <7.900 ,7.900 ,0>}
#end
#if(frame_number= 317 )
object { WindsorChair
    translate <-7.900 ,-7.900 ,0>}
#end
#if(frame_number= 318 )
object { WindsorChair
    translate <7.900 ,8.000 ,0>}
#end
#if(frame_number= 319 )
object { WindsorChair
    translate <-7.900 ,-8.000 ,0>}
#end
#if(frame_number= 320 )
object { WindsorChair
    translate <8.000 ,8.000 ,0>}
#end
#if(frame_number= 321 )
object { WindsorChair
    translate <-8.000 ,-8.000 ,0>}
#end
#if(frame_number= 322 )
object { WindsorChair
    translate <8.000 ,8.100 ,0>}
#end
#if(frame_number= 323 )
object { WindsorChair
    translate <-8.000 ,-8.100 ,0>}
#end
#if(frame_number= 324 )
object { WindsorChair
    translate <8.100 ,8.100 ,0>}
#end
#if(frame_number= 325 )
object { WindsorChair
    translate <-8.100 ,-8.100 ,0>}
#end
#if(frame_number= 326 )
object { WindsorChair
    translate <8.100 ,8.200 ,0>}
#end
#if(frame_number= 327 )
object { WindsorChair
    translate <-8.100 ,-8.200 ,0>}
#end
#if(frame_number= 328 )
object { WindsorChair
    translate <8.200 ,8.200 ,0>}
#end
#if(frame_number= 329 )
object { WindsorChair
    translate <-8.200 ,-8.200 ,0>}
#end
#if(frame_number= 330 )
object { WindsorChair
    translate <8.200 ,8.300 ,0>}
#end
#if(frame_number= 331 )
object { WindsorChair
    translate <-8.200 ,-8.300 ,0>}
#end
#if(frame_number= 332 )
object { WindsorChair
    translate <8.300 ,8.300 ,0>}
#end
#if(frame_number= 333 )
object { WindsorChair
    translate <-8.300 ,-8.300 ,0>}
#end
#if(frame_number= 334 )
object { WindsorChair
    translate <8.300 ,8.400 ,0>}
#end
#if(frame_number= 335 )
object { WindsorChair
    translate <-8.300 ,-8.400 ,0>}
#end
#if(frame_number= 336 )
object { WindsorChair
    translate <8.400 ,8.400 ,0>}
#end
#if(frame_number= 337 )
object { WindsorChair
    translate <-8.400 ,-8.400 ,0>}
#end
#if(frame_number= 338 )
object { WindsorChair
    translate <8.400 ,8.500 ,0>}
#end
#if(frame_number= 339 )
object { WindsorChair
    translate <-8.400 ,-8.500 ,0>}
#end
#if(frame_number= 340 )
object { WindsorChair
    translate <8.500 ,8.500 ,0>}
#end
#if(frame_number= 341 )
object { WindsorChair
    translate <-8.500 ,-8.500 ,0>}
#end
#if(frame_number= 342 )
object { WindsorChair
    translate <8.500 ,8.600 ,0>}
#end
#if(frame_number= 343 )
object { WindsorChair
    translate <-8.500 ,-8.600 ,0>}
#end
#if(frame_number= 344 )
object { WindsorChair
    translate <8.600 ,8.600 ,0>}
#end
#if(frame_number= 345 )
object { WindsorChair
    translate <-8.600 ,-8.600 ,0>}
#end
#if(frame_number= 346 )
object { WindsorChair
    translate <8.600 ,8.700 ,0>}
#end
#if(frame_number= 347 )
object { WindsorChair
    translate <-8.600 ,-8.700 ,0>}
#end
#if(frame_number= 348 )
object { WindsorChair
    translate <8.700 ,8.700 ,0>}
#end
#if(frame_number= 349 )
object { WindsorChair
    translate <-8.700 ,-8.700 ,0>}
#end
#if(frame_number= 350 )
object { WindsorChair
    translate <8.700 ,8.800 ,0>}
#end
#if(frame_number= 351 )
object { WindsorChair
    translate <-8.700 ,-8.800 ,0>}
#end
#if(frame_number= 352 )
object { WindsorChair
    translate <8.800 ,8.800 ,0>}
#end
#if(frame_number= 353 )
object { WindsorChair
    translate <-8.800 ,-8.800 ,0>}
#end
#if(frame_number= 354 )
object { WindsorChair
    translate <8.800 ,8.900 ,0>}
#end
#if(frame_number= 355 )
object { WindsorChair
    translate <-8.800 ,-8.900 ,0>}
#end
#if(frame_number= 356 )
object { WindsorChair
    translate <8.900 ,8.900 ,0>}
#end
#if(frame_number= 357 )
object { WindsorChair
    translate <-8.900 ,-8.900 ,0>}
#end
#if(frame_number= 358 )
object { WindsorChair
    translate <8.900 ,9.000 ,0>}
#end
#if(frame_number= 359 )
object { WindsorChair
    translate <-8.900 ,-9.000 ,0>}
#end
#if(frame_number= 360 )
object { WindsorChair
    translate <9.000 ,9.000 ,0>}
#end
#if(frame_number= 361 )
object { WindsorChair
    translate <-9.000 ,-9.000 ,0>}
#end
#if(frame_number= 362 )
object { WindsorChair
    translate <9.000 ,9.100 ,0>}
#end
#if(frame_number= 363 )
object { WindsorChair
    translate <-9.000 ,-9.100 ,0>}
#end
#if(frame_number= 364 )
object { WindsorChair
    translate <9.100 ,9.100 ,0>}
#end
#if(frame_number= 365 )
object { WindsorChair
    translate <-9.100 ,-9.100 ,0>}
#end
#if(frame_number= 366 )
object { WindsorChair
    translate <9.100 ,9.200 ,0>}
#end
#if(frame_number= 367 )
object { WindsorChair
    translate <-9.100 ,-9.200 ,0>}
#end
#if(frame_number= 368 )
object { WindsorChair
    translate <9.200 ,9.200 ,0>}
#end
#if(frame_number= 369 )
object { WindsorChair
    translate <-9.200 ,-9.200 ,0>}
#end
#if(frame_number= 370 )
object { WindsorChair
    translate <9.200 ,9.300 ,0>}
#end
#if(frame_number= 371 )
object { WindsorChair
    translate <-9.200 ,-9.300 ,0>}
#end
#if(frame_number= 372 )
object { WindsorChair
    translate <9.300 ,9.300 ,0>}
#end
#if(frame_number= 373 )
object { WindsorChair
    translate <-9.300 ,-9.300 ,0>}
#end
#if(frame_number= 374 )
object { WindsorChair
    translate <9.300 ,9.400 ,0>}
#end
#if(frame_number= 375 )
object { WindsorChair
    translate <-9.300 ,-9.400 ,0>}
#end
#if(frame_number= 376 )
object { WindsorChair
    translate <9.400 ,9.400 ,0>}
#end
#if(frame_number= 377 )
object { WindsorChair
    translate <-9.400 ,-9.400 ,0>}
#end
#if(frame_number= 378 )
object { WindsorChair
    translate <9.400 ,9.500 ,0>}
#end
#if(frame_number= 379 )
object { WindsorChair
    translate <-9.400 ,-9.500 ,0>}
#end
#if(frame_number= 380 )
object { WindsorChair
    translate <9.500 ,9.500 ,0>}
#end
#if(frame_number= 381 )
object { WindsorChair
    translate <-9.500 ,-9.500 ,0>}
#end
#if(frame_number= 382 )
object { WindsorChair
    translate <9.500 ,9.600 ,0>}
#end
#if(frame_number= 383 )
object { WindsorChair
    translate <-9.500 ,-9.600 ,0>}
#end
#if(frame_number= 384 )
object { WindsorChair
    translate <9.600 ,9.600 ,0>}
#end
#if(frame_number= 385 )
object { WindsorChair
    translate <-9.600 ,-9.600 ,0>}
#end
#if(frame_number= 386 )
object { WindsorChair
    translate <9.600 ,9.700 ,0>}
#end
#if(frame_number= 387 )
object { WindsorChair
    translate <-9.600 ,-9.700 ,0>}
#end
#if(frame_number= 388 )
object { WindsorChair
    translate <9.700 ,9.700 ,0>}
#end
#if(frame_number= 389 )
object { WindsorChair
    translate <-9.700 ,-9.700 ,0>}
#end
#if(frame_number= 390 )
object { WindsorChair
    translate <9.700 ,9.800 ,0>}
#end
#if(frame_number= 391 )
object { WindsorChair
    translate <-9.700 ,-9.800 ,0>}
#end
#if(frame_number= 392 )
object { WindsorChair
    translate <9.800 ,9.800 ,0>}
#end
#if(frame_number= 393 )
object { WindsorChair
    translate <-9.800 ,-9.800 ,0>}
#end
#if(frame_number= 394 )
object { WindsorChair
    translate <9.800 ,9.900 ,0>}
#end
#if(frame_number= 395 )
object { WindsorChair
    translate <-9.800 ,-9.900 ,0>}
#end
#if(frame_number= 396 )
object { WindsorChair
    translate <9.900 ,9.900 ,0>}
#end
#if(frame_number= 397 )
object { WindsorChair
    translate <-9.900 ,-9.900 ,0>}
#end
#if(frame_number= 398 )
object { WindsorChair
    translate <9.900 ,10.000 ,0>}
#end
#if(frame_number= 399 )
object { WindsorChair
    translate <-9.900 ,-10.000 ,0>}
#end
#if(frame_number= 400 )
object { WindsorChair
    translate <10.000 ,10.000 ,0>}
#end
#if(frame_number= 401 )
object { WindsorChair
    translate <-10.000 ,-10.000 ,0>}
#end
#if(frame_number= 402 )
object { WindsorChair
    translate <10.000 ,10.100 ,0>}
#end
#if(frame_number= 403 )
object { WindsorChair
    translate <-10.000 ,-10.100 ,0>}
#end
#if(frame_number= 404 )
object { WindsorChair
    translate <10.100 ,10.100 ,0>}
#end
#if(frame_number= 405 )
object { WindsorChair
    translate <-10.100 ,-10.100 ,0>}
#end
#if(frame_number= 406 )
object { WindsorChair
    translate <10.100 ,10.200 ,0>}
#end
#if(frame_number= 407 )
object { WindsorChair
    translate <-10.100 ,-10.200 ,0>}
#end
#if(frame_number= 408 )
object { WindsorChair
    translate <10.200 ,10.200 ,0>}
#end
#if(frame_number= 409 )
object { WindsorChair
    translate <-10.200 ,-10.200 ,0>}
#end
#if(frame_number= 410 )
object { WindsorChair
    translate <10.200 ,10.300 ,0>}
#end
#if(frame_number= 411 )
object { WindsorChair
    translate <-10.200 ,-10.300 ,0>}
#end
#if(frame_number= 412 )
object { WindsorChair
    translate <10.300 ,10.300 ,0>}
#end
#if(frame_number= 413 )
object { WindsorChair
    translate <-10.300 ,-10.300 ,0>}
#end
#if(frame_number= 414 )
object { WindsorChair
    translate <10.300 ,10.400 ,0>}
#end
#if(frame_number= 415 )
object { WindsorChair
    translate <-10.300 ,-10.400 ,0>}
#end
#if(frame_number= 416 )
object { WindsorChair
    translate <10.400 ,10.400 ,0>}
#end
#if(frame_number= 417 )
object { WindsorChair
    translate <-10.400 ,-10.400 ,0>}
#end
#if(frame_number= 418 )
object { WindsorChair
    translate <10.400 ,10.500 ,0>}
#end
#if(frame_number= 419 )
object { WindsorChair
    translate <-10.400 ,-10.500 ,0>}
#end
#if(frame_number= 420 )
object { WindsorChair
    translate <10.500 ,10.500 ,0>}
#end
#if(frame_number= 421 )
object { WindsorChair
    translate <-10.500 ,-10.500 ,0>}
#end
#if(frame_number= 422 )
object { WindsorChair
    translate <10.500 ,10.600 ,0>}
#end
#if(frame_number= 423 )
object { WindsorChair
    translate <-10.500 ,-10.600 ,0>}
#end
#if(frame_number= 424 )
object { WindsorChair
    translate <10.600 ,10.600 ,0>}
#end
#if(frame_number= 425 )
object { WindsorChair
    translate <-10.600 ,-10.600 ,0>}
#end
#if(frame_number= 426 )
object { WindsorChair
    translate <10.600 ,10.700 ,0>}
#end
#if(frame_number= 427 )
object { WindsorChair
    translate <-10.600 ,-10.700 ,0>}
#end
#if(frame_number= 428 )
object { WindsorChair
    translate <10.700 ,10.700 ,0>}
#end
#if(frame_number= 429 )
object { WindsorChair
    translate <-10.700 ,-10.700 ,0>}
#end
#if(frame_number= 430 )
object { WindsorChair
    translate <10.700 ,10.800 ,0>}
#end
#if(frame_number= 431 )
object { WindsorChair
    translate <-10.700 ,-10.800 ,0>}
#end
#if(frame_number= 432 )
object { WindsorChair
    translate <10.800 ,10.800 ,0>}
#end
#if(frame_number= 433 )
object { WindsorChair
    translate <-10.800 ,-10.800 ,0>}
#end
#if(frame_number= 434 )
object { WindsorChair
    translate <10.800 ,10.900 ,0>}
#end
#if(frame_number= 435 )
object { WindsorChair
    translate <-10.800 ,-10.900 ,0>}
#end
#if(frame_number= 436 )
object { WindsorChair
    translate <10.900 ,10.900 ,0>}
#end
#if(frame_number= 437 )
object { WindsorChair
    translate <-10.900 ,-10.900 ,0>}
#end
#if(frame_number= 438 )
object { WindsorChair
    translate <10.900 ,11.000 ,0>}
#end
#if(frame_number= 439 )
object { WindsorChair
    translate <-10.900 ,-11.000 ,0>}
#end
#if(frame_number= 440 )
object { WindsorChair
    translate <11.000 ,11.000 ,0>}
#end
#if(frame_number= 441 )
object { WindsorChair
    translate <-11.000 ,-11.000 ,0>}
#end
#if(frame_number= 442 )
object { WindsorChair
    translate <11.000 ,11.100 ,0>}
#end
#if(frame_number= 443 )
object { WindsorChair
    translate <-11.000 ,-11.100 ,0>}
#end
#if(frame_number= 444 )
object { WindsorChair
    translate <11.100 ,11.100 ,0>}
#end
#if(frame_number= 445 )
object { WindsorChair
    translate <-11.100 ,-11.100 ,0>}
#end
#if(frame_number= 446 )
object { WindsorChair
    translate <11.100 ,11.200 ,0>}
#end
#if(frame_number= 447 )
object { WindsorChair
    translate <-11.100 ,-11.200 ,0>}
#end
#if(frame_number= 448 )
object { WindsorChair
    translate <11.200 ,11.200 ,0>}
#end
#if(frame_number= 449 )
object { WindsorChair
    translate <-11.200 ,-11.200 ,0>}
#end
#if(frame_number= 450 )
object { WindsorChair
    translate <11.200 ,11.300 ,0>}
#end
#if(frame_number= 451 )
object { WindsorChair
    translate <-11.200 ,-11.300 ,0>}
#end
#if(frame_number= 452 )
object { WindsorChair
    translate <11.300 ,11.300 ,0>}
#end
#if(frame_number= 453 )
object { WindsorChair
    translate <-11.300 ,-11.300 ,0>}
#end
#if(frame_number= 454 )
object { WindsorChair
    translate <11.300 ,11.400 ,0>}
#end
#if(frame_number= 455 )
object { WindsorChair
    translate <-11.300 ,-11.400 ,0>}
#end
#if(frame_number= 456 )
object { WindsorChair
    translate <11.400 ,11.400 ,0>}
#end
#if(frame_number= 457 )
object { WindsorChair
    translate <-11.400 ,-11.400 ,0>}
#end
#if(frame_number= 458 )
object { WindsorChair
    translate <11.400 ,11.500 ,0>}
#end
#if(frame_number= 459 )
object { WindsorChair
    translate <-11.400 ,-11.500 ,0>}
#end
#if(frame_number= 460 )
object { WindsorChair
    translate <11.500 ,11.500 ,0>}
#end
#if(frame_number= 461 )
object { WindsorChair
    translate <-11.500 ,-11.500 ,0>}
#end
#if(frame_number= 462 )
object { WindsorChair
    translate <11.500 ,11.600 ,0>}
#end
#if(frame_number= 463 )
object { WindsorChair
    translate <-11.500 ,-11.600 ,0>}
#end
#if(frame_number= 464 )
object { WindsorChair
    translate <11.600 ,11.600 ,0>}
#end
#if(frame_number= 465 )
object { WindsorChair
    translate <-11.600 ,-11.600 ,0>}
#end
#if(frame_number= 466 )
object { WindsorChair
    translate <11.600 ,11.700 ,0>}
#end
#if(frame_number= 467 )
object { WindsorChair
    translate <-11.600 ,-11.700 ,0>}
#end
#if(frame_number= 468 )
object { WindsorChair
    translate <11.700 ,11.700 ,0>}
#end
#if(frame_number= 469 )
object { WindsorChair
    translate <-11.700 ,-11.700 ,0>}
#end
#if(frame_number= 470 )
object { WindsorChair
    translate <11.700 ,11.800 ,0>}
#end
#if(frame_number= 471 )
object { WindsorChair
    translate <-11.700 ,-11.800 ,0>}
#end
#if(frame_number= 472 )
object { WindsorChair
    translate <11.800 ,11.800 ,0>}
#end
#if(frame_number= 473 )
object { WindsorChair
    translate <-11.800 ,-11.800 ,0>}
#end
#if(frame_number= 474 )
object { WindsorChair
    translate <11.800 ,11.900 ,0>}
#end
#if(frame_number= 475 )
object { WindsorChair
    translate <-11.800 ,-11.900 ,0>}
#end
#if(frame_number= 476 )
object { WindsorChair
    translate <11.900 ,11.900 ,0>}
#end
#if(frame_number= 477 )
object { WindsorChair
    translate <-11.900 ,-11.900 ,0>}
#end
#if(frame_number= 478 )
object { WindsorChair
    translate <11.900 ,12.000 ,0>}
#end
#if(frame_number= 479 )
object { WindsorChair
    translate <-11.900 ,-12.000 ,0>}
#end
#if(frame_number= 480 )
object { WindsorChair
    translate <12.000 ,12.000 ,0>}
#end
#if(frame_number= 481 )
object { WindsorChair
    translate <-12.000 ,-12.000 ,0>}
#end
#if(frame_number= 482 )
object { WindsorChair
    translate <12.000 ,12.100 ,0>}
#end
#if(frame_number= 483 )
object { WindsorChair
    translate <-12.000 ,-12.100 ,0>}
#end
#if(frame_number= 484 )
object { WindsorChair
    translate <12.100 ,12.100 ,0>}
#end
#if(frame_number= 485 )
object { WindsorChair
    translate <-12.100 ,-12.100 ,0>}
#end
#if(frame_number= 486 )
object { WindsorChair
    translate <12.100 ,12.200 ,0>}
#end
#if(frame_number= 487 )
object { WindsorChair
    translate <-12.100 ,-12.200 ,0>}
#end
#if(frame_number= 488 )
object { WindsorChair
    translate <12.200 ,12.200 ,0>}
#end
#if(frame_number= 489 )
object { WindsorChair
    translate <-12.200 ,-12.200 ,0>}
#end
#if(frame_number= 490 )
object { WindsorChair
    translate <12.200 ,12.300 ,0>}
#end
#if(frame_number= 491 )
object { WindsorChair
    translate <-12.200 ,-12.300 ,0>}
#end
#if(frame_number= 492 )
object { WindsorChair
    translate <12.300 ,12.300 ,0>}
#end
#if(frame_number= 493 )
object { WindsorChair
    translate <-12.300 ,-12.300 ,0>}
#end
#if(frame_number= 494 )
object { WindsorChair
    translate <12.300 ,12.400 ,0>}
#end
#if(frame_number= 495 )
object { WindsorChair
    translate <-12.300 ,-12.400 ,0>}
#end
#if(frame_number= 496 )
object { WindsorChair
    translate <12.400 ,12.400 ,0>}
#end
#if(frame_number= 497 )
object { WindsorChair
    translate <-12.400 ,-12.400 ,0>}
#end
#if(frame_number= 498 )
object { WindsorChair
    translate <12.400 ,12.500 ,0>}
#end
#if(frame_number= 499 )
object { WindsorChair
    translate <-12.400 ,-12.500 ,0>}
#end
#if(frame_number= 500 )
object { WindsorChair
    translate <12.500 ,12.500 ,0>}
#end
#if(frame_number= 501 )
object { WindsorChair
    translate <-12.500 ,-12.500 ,0>}
#end
#if(frame_number= 502 )
object { WindsorChair
    translate <12.500 ,12.600 ,0>}
#end
#if(frame_number= 503 )
object { WindsorChair
    translate <-12.500 ,-12.600 ,0>}
#end
#if(frame_number= 504 )
object { WindsorChair
    translate <12.600 ,12.600 ,0>}
#end
#if(frame_number= 505 )
object { WindsorChair
    translate <-12.600 ,-12.600 ,0>}
#end
#if(frame_number= 506 )
object { WindsorChair
    translate <12.600 ,12.700 ,0>}
#end
#if(frame_number= 507 )
object { WindsorChair
    translate <-12.600 ,-12.700 ,0>}
#end
#if(frame_number= 508 )
object { WindsorChair
    translate <12.700 ,12.700 ,0>}
#end
#if(frame_number= 509 )
object { WindsorChair
    translate <-12.700 ,-12.700 ,0>}
#end
#if(frame_number= 510 )
object { WindsorChair
    translate <12.700 ,12.800 ,0>}
#end
#if(frame_number= 511 )
object { WindsorChair
    translate <-12.700 ,-12.800 ,0>}
#end
#if(frame_number= 512 )
object { WindsorChair
    translate <12.800 ,12.800 ,0>}
#end
#if(frame_number= 513 )
object { WindsorChair
    translate <-12.800 ,-12.800 ,0>}
#end
#if(frame_number= 514 )
object { WindsorChair
    translate <12.800 ,12.900 ,0>}
#end
#if(frame_number= 515 )
object { WindsorChair
    translate <-12.800 ,-12.900 ,0>}
#end
#if(frame_number= 516 )
object { WindsorChair
    translate <12.900 ,12.900 ,0>}
#end
#if(frame_number= 517 )
object { WindsorChair
    translate <-12.900 ,-12.900 ,0>}
#end
#if(frame_number= 518 )
object { WindsorChair
    translate <12.900 ,13.000 ,0>}
#end
#if(frame_number= 519 )
object { WindsorChair
    translate <-12.900 ,-13.000 ,0>}
#end
#if(frame_number= 520 )
object { WindsorChair
    translate <13.000 ,13.000 ,0>}
#end
#if(frame_number= 521 )
object { WindsorChair
    translate <-13.000 ,-13.000 ,0>}
#end
#if(frame_number= 522 )
object { WindsorChair
    translate <13.000 ,13.100 ,0>}
#end
#if(frame_number= 523 )
object { WindsorChair
    translate <-13.000 ,-13.100 ,0>}
#end
#if(frame_number= 524 )
object { WindsorChair
    translate <13.100 ,13.100 ,0>}
#end
#if(frame_number= 525 )
object { WindsorChair
    translate <-13.100 ,-13.100 ,0>}
#end
#if(frame_number= 526 )
object { WindsorChair
    translate <13.100 ,13.200 ,0>}
#end
#if(frame_number= 527 )
object { WindsorChair
    translate <-13.100 ,-13.200 ,0>}
#end
#if(frame_number= 528 )
object { WindsorChair
    translate <13.200 ,13.200 ,0>}
#end
#if(frame_number= 529 )
object { WindsorChair
    translate <-13.200 ,-13.200 ,0>}
#end
#if(frame_number= 530 )
object { WindsorChair
    translate <13.200 ,13.300 ,0>}
#end
#if(frame_number= 531 )
object { WindsorChair
    translate <-13.200 ,-13.300 ,0>}
#end
#if(frame_number= 532 )
object { WindsorChair
    translate <13.300 ,13.300 ,0>}
#end
#if(frame_number= 533 )
object { WindsorChair
    translate <-13.300 ,-13.300 ,0>}
#end
#if(frame_number= 534 )
object { WindsorChair
    translate <13.300 ,13.400 ,0>}
#end
#if(frame_number= 535 )
object { WindsorChair
    translate <-13.300 ,-13.400 ,0>}
#end
#if(frame_number= 536 )
object { WindsorChair
    translate <13.400 ,13.400 ,0>}
#end
#if(frame_number= 537 )
object { WindsorChair
    translate <-13.400 ,-13.400 ,0>}
#end
#if(frame_number= 538 )
object { WindsorChair
    translate <13.400 ,13.500 ,0>}
#end
#if(frame_number= 539 )
object { WindsorChair
    translate <-13.400 ,-13.500 ,0>}
#end
#if(frame_number= 540 )
object { WindsorChair
    translate <13.500 ,13.500 ,0>}
#end
#if(frame_number= 541 )
object { WindsorChair
    translate <-13.500 ,-13.500 ,0>}
#end
#if(frame_number= 542 )
object { WindsorChair
    translate <13.500 ,13.600 ,0>}
#end
#if(frame_number= 543 )
object { WindsorChair
    translate <-13.500 ,-13.600 ,0>}
#end
#if(frame_number= 544 )
object { WindsorChair
    translate <13.600 ,13.600 ,0>}
#end
#if(frame_number= 545 )
object { WindsorChair
    translate <-13.600 ,-13.600 ,0>}
#end
#if(frame_number= 546 )
object { WindsorChair
    translate <13.600 ,13.700 ,0>}
#end
#if(frame_number= 547 )
object { WindsorChair
    translate <-13.600 ,-13.700 ,0>}
#end
#if(frame_number= 548 )
object { WindsorChair
    translate <13.700 ,13.700 ,0>}
#end
#if(frame_number= 549 )
object { WindsorChair
    translate <-13.700 ,-13.700 ,0>}
#end
#if(frame_number= 550 )
object { WindsorChair
    translate <13.700 ,13.800 ,0>}
#end
#if(frame_number= 551 )
object { WindsorChair
    translate <-13.700 ,-13.800 ,0>}
#end
#if(frame_number= 552 )
object { WindsorChair
    translate <13.800 ,13.800 ,0>}
#end
#if(frame_number= 553 )
object { WindsorChair
    translate <-13.800 ,-13.800 ,0>}
#end
#if(frame_number= 554 )
object { WindsorChair
    translate <13.800 ,13.900 ,0>}
#end
#if(frame_number= 555 )
object { WindsorChair
    translate <-13.800 ,-13.900 ,0>}
#end
#if(frame_number= 556 )
object { WindsorChair
    translate <13.900 ,13.900 ,0>}
#end
#if(frame_number= 557 )
object { WindsorChair
    translate <-13.900 ,-13.900 ,0>}
#end
#if(frame_number= 558 )
object { WindsorChair
    translate <13.900 ,14.000 ,0>}
#end
#if(frame_number= 559 )
object { WindsorChair
    translate <-13.900 ,-14.000 ,0>}
#end
#if(frame_number= 560 )
object { WindsorChair
    translate <14.000 ,14.000 ,0>}
#end
#if(frame_number= 561 )
object { WindsorChair
    translate <-14.000 ,-14.000 ,0>}
#end
#if(frame_number= 562 )
object { WindsorChair
    translate <14.000 ,14.100 ,0>}
#end
#if(frame_number= 563 )
object { WindsorChair
    translate <-14.000 ,-14.100 ,0>}
#end
#if(frame_number= 564 )
object { WindsorChair
    translate <14.100 ,14.100 ,0>}
#end
#if(frame_number= 565 )
object { WindsorChair
    translate <-14.100 ,-14.100 ,0>}
#end
#if(frame_number= 566 )
object { WindsorChair
    translate <14.100 ,14.200 ,0>}
#end
#if(frame_number= 567 )
object { WindsorChair
    translate <-14.100 ,-14.200 ,0>}
#end
#if(frame_number= 568 )
object { WindsorChair
    translate <14.200 ,14.200 ,0>}
#end
#if(frame_number= 569 )
object { WindsorChair
    translate <-14.200 ,-14.200 ,0>}
#end
#if(frame_number= 570 )
object { WindsorChair
    translate <14.200 ,14.300 ,0>}
#end
#if(frame_number= 571 )
object { WindsorChair
    translate <-14.200 ,-14.300 ,0>}
#end
#if(frame_number= 572 )
object { WindsorChair
    translate <14.300 ,14.300 ,0>}
#end
#if(frame_number= 573 )
object { WindsorChair
    translate <-14.300 ,-14.300 ,0>}
#end
#if(frame_number= 574 )
object { WindsorChair
    translate <14.300 ,14.400 ,0>}
#end
#if(frame_number= 575 )
object { WindsorChair
    translate <-14.300 ,-14.400 ,0>}
#end
#if(frame_number= 576 )
object { WindsorChair
    translate <14.400 ,14.400 ,0>}
#end
#if(frame_number= 577 )
object { WindsorChair
    translate <-14.400 ,-14.400 ,0>}
#end
#if(frame_number= 578 )
object { WindsorChair
    translate <14.400 ,14.500 ,0>}
#end
#if(frame_number= 579 )
object { WindsorChair
    translate <-14.400 ,-14.500 ,0>}
#end
#if(frame_number= 580 )
object { WindsorChair
    translate <14.500 ,14.500 ,0>}
#end
#if(frame_number= 581 )
object { WindsorChair
    translate <-14.500 ,-14.500 ,0>}
#end
#if(frame_number= 582 )
object { WindsorChair
    translate <14.500 ,14.600 ,0>}
#end
#if(frame_number= 583 )
object { WindsorChair
    translate <-14.500 ,-14.600 ,0>}
#end
#if(frame_number= 584 )
object { WindsorChair
    translate <14.600 ,14.600 ,0>}
#end
#if(frame_number= 585 )
object { WindsorChair
    translate <-14.600 ,-14.600 ,0>}
#end
#if(frame_number= 586 )
object { WindsorChair
    translate <14.600 ,14.700 ,0>}
#end
#if(frame_number= 587 )
object { WindsorChair
    translate <-14.600 ,-14.700 ,0>}
#end
#if(frame_number= 588 )
object { WindsorChair
    translate <14.700 ,14.700 ,0>}
#end
#if(frame_number= 589 )
object { WindsorChair
    translate <-14.700 ,-14.700 ,0>}
#end
#if(frame_number= 590 )
object { WindsorChair
    translate <14.700 ,14.800 ,0>}
#end
#if(frame_number= 591 )
object { WindsorChair
    translate <-14.700 ,-14.800 ,0>}
#end
#if(frame_number= 592 )
object { WindsorChair
    translate <14.800 ,14.800 ,0>}
#end
#if(frame_number= 593 )
object { WindsorChair
    translate <-14.800 ,-14.800 ,0>}
#end
#if(frame_number= 594 )
object { WindsorChair
    translate <14.800 ,14.900 ,0>}
#end
#if(frame_number= 595 )
object { WindsorChair
    translate <-14.800 ,-14.900 ,0>}
#end
#if(frame_number= 596 )
object { WindsorChair
    translate <14.900 ,14.900 ,0>}
#end
#if(frame_number= 597 )
object { WindsorChair
    translate <-14.900 ,-14.900 ,0>}
#end
#if(frame_number= 598 )
object { WindsorChair
    translate <14.900 ,15.000 ,0>}
#end
#if(frame_number= 599 )
object { WindsorChair
    translate <-14.900 ,-15.000 ,0>}
#end
#if(frame_number= 600 )
object { WindsorChair
    translate <15.000 ,15.000 ,0>}
#end
#if(frame_number= 601 )
object { WindsorChair
    translate <-15.000 ,-15.000 ,0>}
#end
