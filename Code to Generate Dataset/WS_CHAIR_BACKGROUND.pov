

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
sphere { <0,0,0>, 0.5 

        texture { pigment{ color rgb<1.00, 0.55, 0.00>}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale 25  rotate<0,0,0>  translate<0,-20,0>  
       }  // end of sphere ----------------------------------- 


#end
#if(frame_number=2)
object { WindsorChair
    translate <0,0,0>
}
sphere { <0,0,0>, 1.00 
         texture { pigment{ color rgb<0.35,0.65,0.0>*0.9} //color rgb<0.2,0.7,0.05> }                                     
                   normal { bumps 1.75 scale 0.05} 
                   finish { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                 } // end of texture
          scale 10  rotate<0,0,0>  translate<0,-20,0>  
       }  // end of sphere ------------------------------ 

#end
#if(frame_number=3)
object { WindsorChair
    translate <0,0,0>
}
sphere { <0,0,0>, 1.25  
         scale<1,0.25,1>
         
         texture { pigment{ color rgb< 1.0, 0.0, 0.2>}
                   normal { ripples 2.5 scale 0.07}
                   finish { phong 1 reflection{ 0.30 metallic 0.20} } 
                 } // end of texture
         scale 15 rotate<0,0,0>  translate<0,-25,0>  
       }  // end of sphere -------------------------------------------------- 

#end  
#if(frame_number=4)
object { WindsorChair
    translate <0,0,0>
}                 
//-------------------------------------------------------------------------
ovus{ 1.00, 0.65 // base_radius, top_radius  with: top_radius< base_radius! 
      texture{ pigment{ color rgb< 1.0, 0.9, 0.8>*0.9}  
            // normal { bumps 0.75 scale 0.02 }
               finish { phong 0.3 reflection { 0.00 metallic 0.00}  }
             } // end of texture 
      scale 10
      rotate<0,0,0>
      translate<0,-25,0> 
    } // ------------------------------------------------------------------ 
//-------------------------------------------------------------------------
#end  
#if(frame_number=5)
object { WindsorChair
    translate <0,0,0>
}     
cylinder { <0,0,0>,<0,2.00,0>, 0.30 

           texture { pigment { color rgb<1,1,1> }
                   //normal  { bumps 0.5 scale <0.005,0.25,0.005>}
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture

           scale 15 rotate<0,0,0> translate<0,-30,0>
         } // end of cylinder -------------------------------------
#end  
#if(frame_number=6)
object { WindsorChair
    translate <0,0,0>
} 
cylinder { <-1,0,0>,<1,0,0>, 0.30
           texture { pigment { color rgb<1,1,1>}
                   //normal  { bumps 0.5 scale <0.25, 0.005,0.005>}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale 20 rotate<0,0,0> translate<0,-25,0>
         } // end of cylinder  ------------------------------------
#end  
#if(frame_number=7)
object { WindsorChair
    translate <0,0,0>
} 
cylinder { <0,0,0>,<0,0,2.00>,0.30 
           texture { pigment { color rgb<1,1,1>}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale 20 rotate<0,0,0> translate<0,-30,0>
         } // end of cylinder  ------------------------------------
#end  
#if(frame_number=8)
object { WindsorChair
    translate <0,0,0>
} 
cylinder{ <0,0.0,0>,<0,0.75,0>, 1.00
          open
          texture { pigment{ color rgb<1.0,1.0,1.0>*1.1}
                    normal { ripples 3.5 scale 0.05  translate<0,-1.0,0> }
                    finish { phong 0.4 reflection{ 0.05 metallic 0.10} } 
                  } // end of texture

          scale 15 rotate<0,0,0> translate<0,-30,0>
        } // end of cylinder -------------------------------------
#end  
#if(frame_number=9)
object { WindsorChair
    translate <0,0,0>
} 
cone{ <0,0,0>,1.00,<0,0.80,0>,0.600 

      texture{ pigment{ color rgbf<1.00,1,1,0.75>}
               // pigment{ color rgb<1.00,0.60,0.00>}
               finish { phong 0.5 reflection{ 0.00 metallic 0.00} } 
             } // end of texture
      scale 15 rotate<0,0,0> translate<0,-25,0> 
    } // end of cone -----------------------------------
#end  
#if(frame_number=10)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>,0.5,<0,1.00,0>, 1.0 
       open
       texture { pigment{ color rgbf<1.00,1,1,0.55>}
                 //pigment{ color rgb<0.8,1.0,0.25>*0.75}
                 finish { phong 0.4 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale 15 rotate<0,0,0> translate<0,-20,0>         
     } // end of cone ------------------------------------------
#end  
#if(frame_number=11)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>,0.35,<0,0.50,0>, 1.1  
       open // 
       texture{ radial frequency 16  
                texture_map{
                   [ 0.00 pigment{color rgbf<1,1,1,1>} ] 
                   [ 0.15 pigment{color rgbf<1,1,1,1>} ] 
                   [ 0.15 pigment{color rgbf<1,1,1,0>} finish { phong 1  reflection{ 0.10 } } ] 
                   [ 1.00 pigment{color rgbf<1,1,1,0>} finish { phong 1  reflection{ 0.10 } } ] 
                } // end texture_map
              } // end of texture

       scale 15 
       //rotate<-90,-20,0>
       rotate<0,0,0>  
       translate<0,-30,0>
     } // end of cone ------------------------------------------
#end  
#if(frame_number=12)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>,-0.5,<0,1.00,0>, 1.0 
       open
       texture { pigment{ color rgbf<0.75,0.70,0.65, 0.915> }
                 finish { phong 1 reflection{ 0.20 metallic 0.00} } 
               } // end of texture

       scale 15 rotate<0,0,0> translate<0,-30,0>         
     } // end of cone ------------------------------------------
#end  
#if(frame_number=13)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>,0.75,<0,1.50,0>,0 

       texture { pigment{ color rgb<1,0.60,0.0>}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale 20 rotate<0,0,0> translate<0,-25,0>         
     } // end of cone -------------------------------------
#end  
#if(frame_number=14)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>, 0.75, <0,2.00,0>, 0 
       texture { pigment{ color rgb<0.1,0.4,0.10>*0.8 }                                     
                 normal { bumps 1.25 scale 0.05} 
                 finish { phong 1 reflection 0.00}
               } // end of texture

       scale 15 rotate<0,0,0>  translate<0,-25,0>  
     }  // end of cone -------------------------------------- 
#end  
#if(frame_number=15)
object { WindsorChair
    translate <0,0,0>
} 
cone { <0,0,0>,0.35,<0,2.20,0>,0.25 

       texture { pigment{ color rgb<1.0,1.0,1.0>}
                 finish { phong 1 reflection{ 0.00 metallic 0.00} } 
               } // end of texture

       scale 15 rotate<0,0,0> translate<0,-30,0>         
     } // end of cone -----------------------------------
#end  
#if(frame_number=16)
object { WindsorChair
    translate <0,0,0>
} 
torus { 0.35,0.05 
        texture { pigment{ color rgb<1.0,1.0,1.0>}
                  finish { phong 1 reflection 0.00}
                } // end of texture
        scale 50 rotate<0,0,0> translate<0,-20,0>
      } // end of torus  -------------------------------              

#end  
#if(frame_number=17)
object { WindsorChair
    translate <0,0,0>
} 
torus { 1.0,0.25  rotate<0,0,0>
        texture { pigment{ color rgbt<1,1,1,0.7>}
                  finish { phong 1 reflection{ 0.00 metallic 0.00} } 
                } // end of texture
        scale 15 rotate<0,0,0> translate<0,-25,0>
      } // end of torus  -------------------------------              
#end  
#if(frame_number=18)
object { WindsorChair
    translate <0,0,0>
}                  
torus { 1.0,0.25 
        texture { pigment{ color rgb<1,0.7,0>}
                  finish { phong 1 reflection { 0.00 metallic 0.50} }
                } // end of texture
        scale 15 rotate<0,0,0> translate<0,-20,0>
      } // end of torus  -------------------------------              
#end  
#if(frame_number=19)
object { WindsorChair
    translate <0,0,0>
} 
torus { 0.35,0.15 
        texture { pigment{ color rgb<1,1,1>*0.15 }
                  finish { phong 0.4 }
                } // end of texture
        scale 25 rotate<90,0,0> translate<0,-20,0>
      } // end of torus  -------------------------------              
#end  
#if(frame_number=20)
object { WindsorChair
    translate <0,0,0>
} 
///sor Surface of Revolution 
sor{  7, // # of points,  list of <x,y> points, spline rotates around y-axis 
     <0.00,0.00> 
     <0.12,0.00> 
     <0.62,0.54> 
     <0.21,0.83> 
     <0.19,1.46> 
     <0.29,1.50> 
     <0.46,1.53>
     sturm  // optional!
     texture { pigment{ color LightWood}
               normal { bumps 0.75 scale 0.010}
               finish { phong 1}
             } // end of texture 
     scale 15  rotate<0,0,0> translate<0,-25,0>
   } // end of sor ---------------------------------------------------------------------


#end  
#if(frame_number=21)
object { WindsorChair
    translate <0,0,0>
} 
///sor Surface of Revolution 
sor{
  7,
  <0.306,-0.140>,
  <0.605,-0.030>,
  <0.688, 0.341>,
  <0.313, 0.547>,
  <0.165, 0.894>,
  <0.265, 1.000>,
  <0.748, 1.215>

  //  sturm  // optional!
     texture { pigment{ color rgb<0.6,0.5,1>}
               // normal { bumps 0.75 scale 0.010}
               finish { phong 1}
             } // end of texture 
     scale 15  rotate<0,0,0> translate<0,-20,0>
   } // end of sor ---------------------------------- 

#end  
#if(frame_number=22)
object { WindsorChair
    translate <0,0,0>
} 
///sor Surface of Revolution 
sor{
  10,
  <0.000, 0.000>
  <0.289, 0.000>
  <0.274, 0.026>
  <0.072, 0.100>
  <0.070, 0.123>
  <0.070, 0.436>
  <0.175, 0.536>
  <0.240, 0.672>
  <0.327, 1.000>
  <0.290, 1.000>
  open
    //  sturm  // optional!
    material{   //-----------------------------------------------------------
        texture { pigment{ rgbf <0.98, 0.92, 0.80, 0.7> }
                  finish { diffuse 0.1 reflection{ 0.25 metallic 0.20}   
                           specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
      } // end of material ----------------------------------------------------
   scale 20  rotate<0,0,0> translate<0,-20,0>
 } // end of sor --------------------------------- 


#end  
#if(frame_number=23)
object { WindsorChair
    translate <0,0,0>
} 
///sor Surface of Revolution 
sor{
  10,
  <0.000, 0.000>
  <0.289, 0.000>
  <0.274, 0.026>
  <0.072, 0.100>
  <0.070, 0.123>
  <0.070, 0.436>
  <0.175, 0.536>
  <0.240, 0.672>
  <0.327, 1.000>
  <0.290, 1.000>
  open
    //  sturm  // optional!
    material{   //-----------------------------------------------------------
        texture { pigment{ rgbf <0.98, 0.92, 0.80, 0.7> }
                  finish { diffuse 0.1 reflection{ 0.25 metallic 0.20}   
                           specular 0.8 roughness 0.0003 phong 1 phong_size 400}
                } // end of texture -------------------------------------------
        interior{ ior 1.5 caustics 0.5
                } // end of interior ------------------------------------------
      } // end of material ----------------------------------------------------
   scale 20  rotate<0,0,0> translate<0,-20,0>
 } // end of sor --------------------------------- 


#end  
#if(frame_number=24)
object { WindsorChair
    translate <0,0,0>
}
box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   

      texture { pigment{ color rgb<1.00, 1.00, 1.00>}  
                finish { phong 1 reflection{ 0.00 metallic 0.00} } 
              } // end of texture

      scale 15 rotate<0,0,0> translate<0,-50,0> 
    } // end of box --------------------------------------
#end  
#if(frame_number=25)
object { WindsorChair
    translate <0,0,0>
}
superellipsoid{ <3.50,0.25> 

     texture{ pigment{ color rgb<0.75,0.3,1.00> }
              finish { phong 1 }
            }
     scale 15 
     rotate<0,0,0> 
     translate<0,-25,0>
   } // ------------------ end superellipsoid  
#end  
#if(frame_number=26)
object { WindsorChair
    translate <0,0,0>
}                  
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

// sun ----------------------------------------------------------------------
light_source{< 3000,3000,-3000> color White}
// sky ----------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}
              //normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane
#end      
#if(frame_number=27)
object { WindsorChair
    translate <0,0,0>
}         
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
// sun ---------------------------------------------------------------------
light_source{<-1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture
     } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------

#end
#if(frame_number=28)
object { WindsorChair
    translate <0,0,0>
}   
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<-1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ color rgb <1.00,0.95,0.8>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
              } // end of texture
     } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=29)
object { WindsorChair
    translate <0,0,0>
}   
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.76
                         color_map { [0.5 rgb <0.20, 0.20, 1.0>]
                                     [0.6 rgb <1,1,1>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog ---------------------------------------------------------------------
fog{fog_type   2
    distance   50
    color      White
    fog_offset 0.1
    fog_alt    2.0
    turbulence 0.8}
// ground ------------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.9 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=30)
object { WindsorChair
    translate <0,0,0>
}   
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<-1500,2000,-2500> color White}

// sky -------------------------------------------------------------- 
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }

// ground ------------------------------------------------------------
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
	         normal { bumps 0.75 scale 0.015 }
                 finish { phong 0.1 }
               } // end of texture
      } // end of plane
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=31)
object { WindsorChair
    translate <0,0,0>
}  
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.85 scale 1.0 translate<5,0,0>
                        color_map { [0.5 rgb <0.20, 0.20, 1.0>]
                                    [0.6 rgb <1,1,1>]
                                    [1.0 rgb <0.5,0.5,0.5>]}
                       }
               finish {ambient 1 diffuse 0} }      
       scale 10000}
//------------------------------
fog{distance 300000 color White}
// sea ---------------------------------------------------------------------
plane{<0,1,0>, 0 
       texture{Polished_Chrome
               normal { crackle 0.15 scale <0.35,0.25,0.25> turbulence 0.5 } 
               finish { reflection 0.60 }}}

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=32)
object { WindsorChair
    translate <0,0,0>
}  
// PoVRay 3.7 Scene File " ... .pov"
// author:   ...  
// date:   ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000}
// fog on the ground -------------------------------------------------
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
    }
// sea ---------------------------------------------------------------------
plane{<0,1,0>, 0 
       texture{Polished_Chrome
               normal { crackle 0.15 scale <0.35,0.25,0.25> turbulence 0.5 } 
               finish { reflection 0.60}}}

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------

#end
#if(frame_number=33)
object { WindsorChair
    translate <0,0,0>
}
// PoVRay 3.7 Scene File " ... .pov"
// author:   ...  
// date:   ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
// sky ---------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.8,0.9,1.0>]
                                   [0.35 rgb <0.0,0.1,0.8>]
                                   [0.65 rgb <0.0,0.1,0.8>]
                                   [1.00 rgb <0.8,0.9,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
//------------------------------
//fog{distance 300000 color White}
// sea ---------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ Polished_Chrome
                normal{ bumps 0.25 scale <0.25,0.25,0.25>*0.5 turbulence 0.5 } 
                finish{ reflection 0.60 }}}

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=34)
object { WindsorChair
    translate <0,0,0>
}    
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
light_source{ <-1000, 800, 3000> 
              color White
              looks_like{ sphere{ <0,0,0>,300 
                                  texture{ pigment{ color White }
                                           normal { bumps 0.5
                                                    scale 50    }
                                           finish { ambient 0.8   
                                                    diffuse 0.2
                                                    phong 1     }
                                                  
                                         } // end of texture
                                } // end of sphere
                        } //end of looks_like
            } //end of light_source
// sky --------------------------------------------------------------------
  // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
  // the clouds 
plane{<0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5 rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6 rgb <1.0,1.0,1.0>     ]
                                    [1.0 rgb <0.5,0.5,0.5>     ]}
                       }
               finish { ambient 0.25 diffuse 0} 
              }      
       scale 500}

// fog ---------------------------------------------------------------------

fog{ fog_type   2
     distance   50
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
// ground ------------------------------------------------------------------

plane { <0,1,0>, 0 
        texture { pigment{ color rgb<0.35,0.65,0.0>*0.72}
                  normal { bumps 0.75 scale 0.015  }
                  finish { phong 0.1 }
                }
      }
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
#if(frame_number=35)
object { WindsorChair
    translate <0,0,0>
}  
// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------

// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
light_source{ <-1000, 800, 3000> 
              color White
              looks_like{ sphere{ <0,0,0>, 200 
                                  texture{ pigment{ color White*0.9 }
                                           normal { bumps 1.5
                                                    scale 20    }
                                           finish { ambient 0.8   
                                                    diffuse 0.2
                                                    phong 1     }
                                                  
                                         } // end of texture
                                } // end of sphere
                        } //end of looks_like
            } //end of light_source
// sky --------------------------------------------------------------------
  // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
  // the clouds 
plane{ <0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5  rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6  rgb <1.0,1.0,1.0>     ]
                                    [0.65 rgb <1.5,1.5,1.5>     ]
                                    [1.0  rgb <0.5,0.5,0.5>     ] }
                       }
               finish { ambient 0.25 diffuse 0} 
              }      
       scale 500}

// fog ---------------------------------------------------------------------

fog{ fog_type   2
     distance   50
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
// ground ------------------------------------------------------------------

// sea ---------------------------------------------------------------------

plane{ <0,1,0>, 0 
       texture{ Polished_Chrome
                normal { crackle 0.15 scale <0.35,0.25,0.25> turbulence 0.5 } 
                finish { reflection 0.60}
              }
     }
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------
#end
