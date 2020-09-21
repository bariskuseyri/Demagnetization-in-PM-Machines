// BEGIN ANSOFT HEADER
//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position
// END ANSOFT HEADER

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=0.650011 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=0.650011 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=0.650011 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.0116737, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.0116737, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.0116737, I0:=0 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_4, NAN:=N, NBP:=N0_5, NBN:=N, NCP:=N0_6, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


// BEGIN ANSOFT HEADER
//         Left: N_1 N_2 N_3
//        Right: N_4 N_5
// END ANSOFT HEADER

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  AM       VR1a  N1:=N_1, N2:=N_17  ; 
INTERN  E        BEma  N1:=N_19, N2:=N_17  ( EMF:=N_4.V * N_10.V, PARTDERIV:=1 ); 
INTERN  E        BVa  N1:=N_21, N2:=N_19  ( EMF:=N_23.V*cos(N_8.V) + N_24.V*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIa  N1:=N_21, N2:=GND  ; 
INTERN  VM       VM_Ea  N1:=N_17, N2:=GND  ; 
INTERN  AM       VR1b  N1:=N_2, N2:=N_18  ; 
INTERN  E        BEmb  N1:=N_20, N2:=N_18  ( EMF:=N_4.V * N_11.V, PARTDERIV:=1 ); 
INTERN  E        BVb  N1:=N_22, N2:=N_20  ( EMF:=N_23.V*sin(N_8.V) - N_24.V*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIb  N1:=N_22, N2:=GND  ; 
INTERN  VM       VM_Eb  N1:=N_18, N2:=GND  ; 
INTERN  AM       VR0  N1:=N_3, N2:=N_14  ; 
INTERN  E        BEm0  N1:=GND, N2:=N_14  ( EMF:=N_4.V * N_12.V, PARTDERIV:=1 ); 
INTERN  I        BI1d  N1:=GND, N2:=N_23  ( IS:=VIa.I*cos(N_8.V) + VIb.I*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1d  N1:=N_23, N2:=N_25  ; 
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.0208628 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.00221889, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.0110944 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.00417256, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  I        BTdq  N1:=GND, N2:=N_4  ( IS:=0.00976836 * VI1d.I * VI1q.I, PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=5 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke N0:=N_10, N1:=GND, N2:=N_11, N3:=GND, N4:=N_12, N5:=GND  ( QUANT:={N_8.V}, SRC:={vsrc, vsrc, vsrc}, TableData:="\
.MODEL Setup1_ke_table pwl TABLE=( 361, 0.261799, 0.279253, 0.296706, 0.314159,\
 0.331613, 0.349066, 0.366519, 0.383972, 0.401426, 0.418879, 0.436332,\
 0.453786, 0.471239, 0.488692, 0.506145, 0.523599, 0.541052, 0.558505,\
 0.575959, 0.593412, 0.610865, 0.628319, 0.645772, 0.663225, 0.680678,\
 0.698132, 0.715585, 0.733038, 0.750492, 0.767945, 0.785398, 0.802851,\
 0.820305, 0.837758, 0.855211, 0.872665, 0.890118, 0.907571, 0.925025,\
 0.942478, 0.959931, 0.977384, 0.994838, 1.01229, 1.02974, 1.0472, 1.06465,\
 1.0821, 1.09956, 1.11701, 1.13446, 1.15192, 1.16937, 1.18682, 1.20428,\
 1.22173, 1.23918, 1.25664, 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136,\
 1.37881, 1.39626, 1.41372, 1.43117, 1.44862, 1.46608, 1.48353, 1.50098,\
 1.51844, 1.53589, 1.55334, 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806,\
 1.67552, 1.69297, 1.71042, 1.72788, 1.74533, 1.76278, 1.78024, 1.79769,\
 1.81514, 1.8326, 1.85005, 1.8675, 1.88496, 1.90241, 1.91986, 1.93732, 1.95477,\
 1.97222, 1.98968, 2.00713, 2.02458, 2.04204, 2.05949, 2.07694, 2.0944,\
 2.11185, 2.1293, 2.14675, 2.16421, 2.18166, 2.19911, 2.21657, 2.23402,\
 2.25147, 2.26893, 2.28638, 2.30383, 2.32129, 2.33874, 2.35619, 2.37365,\
 2.3911, 2.40855, 2.42601, 2.44346, 2.46091, 2.47837, 2.49582, 2.51327,\
 2.53073, 2.54818, 2.56563, 2.58309, 2.60054, 2.61799, 2.63545, 2.6529,\
 2.67035, 2.68781, 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253,\
 2.80998, 2.82743, 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215,\
 2.94961, 2.96706, 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178,\
 3.08923, 3.10669, 3.12414, 3.14159, 3.15905, 3.1765, 3.19395, 3.21141,\
 3.22886, 3.24631, 3.26377, 3.28122, 3.29867, 3.31613, 3.33358, 3.35103,\
 3.36849, 3.38594, 3.40339, 3.42085, 3.4383, 3.45575, 3.47321, 3.49066,\
 3.50811, 3.52557, 3.54302, 3.56047, 3.57792, 3.59538, 3.61283, 3.63028,\
 3.64774, 3.66519, 3.68264, 3.7001, 3.71755, 3.735, 3.75246, 3.76991, 3.78736,\
 3.80482, 3.82227, 3.83972, 3.85718, 3.87463, 3.89208, 3.90954, 3.92699,\
 3.94444, 3.9619, 3.97935, 3.9968, 4.01426, 4.03171, 4.04916, 4.06662, 4.08407,\
 4.10152, 4.11898, 4.13643, 4.15388, 4.17134, 4.18879, 4.20624, 4.2237,\
 4.24115, 4.2586, 4.27606, 4.29351, 4.31096, 4.32842, 4.34587, 4.36332,\
 4.38078, 4.39823, 4.41568, 4.43314, 4.45059, 4.46804, 4.4855, 4.50295, 4.5204,\
 4.53786, 4.55531, 4.57276, 4.59022, 4.60767, 4.62512, 4.64258, 4.66003,\
 4.67748, 4.69494, 4.71239, 4.72984, 4.7473, 4.76475, 4.7822, 4.79966, 4.81711,\
 4.83456, 4.85202, 4.86947, 4.88692, 4.90438, 4.92183, 4.93928, 4.95674,\
 4.97419, 4.99164, 5.00909, 5.02655, 5.044, 5.06145, 5.07891, 5.09636, 5.11381,\
 5.13127, 5.14872, 5.16617, 5.18363, 5.20108, 5.21853, 5.23599, 5.25344,\
 5.27089, 5.28835, 5.3058, 5.32325, 5.34071, 5.35816, 5.37561, 5.39307,\
 5.41052, 5.42797, 5.44543, 5.46288, 5.48033, 5.49779, 5.51524, 5.53269,\
 5.55015, 5.5676, 5.58505, 5.60251, 5.61996, 5.63741, 5.65487, 5.67232,\
 5.68977, 5.70723, 5.72468, 5.74213, 5.75959, 5.77704, 5.79449, 5.81195,\
 5.8294, 5.84685, 5.86431, 5.88176, 5.89921, 5.91667, 5.93412, 5.95157,\
 5.96903, 5.98648, 6.00393, 6.02139, 6.03884, 6.05629, 6.07375, 6.0912,\
 6.10865, 6.12611, 6.14356, 6.16101, 6.17847, 6.19592, 6.21337, 6.23083,\
 6.24828, 6.26573, 6.28319, 6.30064, 6.31809, 6.33555, 6.353, 6.37045, 6.38791,\
 6.40536, 6.42281, 6.44026, 6.45772, 6.47517, 6.49262, 6.51008, 6.52753,\
 6.54498, 3, 0.1127, 0.113028, 0.113381, 0.113616, 0.114165, 0.115316,\
 0.117174, 0.12293, 0.131784, 0.140407, 0.148571, 0.15592, 0.162615, 0.168937,\
 0.175252, 0.181773, 0.188704, 0.196268, 0.204729, 0.214442, 0.225713,\
 0.238805, 0.252985, 0.268084, 0.277631, 0.279881, 0.280991, 0.281515,\
 0.281693, 0.281883, 0.282058, 0.282233, 0.282421, 0.282462, 0.282747,\
 0.283555, 0.284975, 0.290116, 0.298125, 0.305741, 0.312837, 0.319077,\
 0.324576, 0.329502, 0.334127, 0.338608, 0.343089, 0.347712, 0.352635,\
 0.358039, 0.364172, 0.37123, 0.378796, 0.386727, 0.391744, 0.393008, 0.393626,\
 0.394106, 0.394439, 0.394606, 0.394759, 0.394911, 0.395074, 0.395131,\
 0.395157, 0.395197, 0.394805, 0.391014, 0.384769, 0.379213, 0.374284,\
 0.370362, 0.367344, 0.365206, 0.363956, 0.363545, 0.363956, 0.365206,\
 0.367344, 0.370362, 0.374284, 0.379213, 0.384769, 0.391014, 0.394805,\
 0.395197, 0.395157, 0.395131, 0.395074, 0.394911, 0.394759, 0.394606,\
 0.394439, 0.394106, 0.393626, 0.393008, 0.391744, 0.386727, 0.378796, 0.37123,\
 0.364172, 0.358039, 0.352635, 0.347712, 0.343089, 0.338608, 0.334127,\
 0.329502, 0.324576, 0.319077, 0.312837, 0.305741, 0.298125, 0.290116,\
 0.284975, 0.283555, 0.282747, 0.282462, 0.282421, 0.282233, 0.282058,\
 0.281883, 0.281693, 0.281515, 0.280991, 0.279881, 0.277631, 0.268084,\
 0.252985, 0.238805, 0.225713, 0.214442, 0.204729, 0.196268, 0.188704,\
 0.181773, 0.175252, 0.168937, 0.162615, 0.15592, 0.148571, 0.140407, 0.131784,\
 0.12293, 0.117174, 0.115316, 0.114165, 0.113616, 0.113381, 0.113028, 0.1127,\
 0.112372, 0.112018, 0.111644, 0.110879, 0.109453, 0.106769, 0.0966108,\
 0.0806716, 0.0654896, 0.0513355, 0.0389614, 0.0280584, 0.0182092, 0.00896241,\
 -1.31442e-15, -0.00896241, -0.0182092, -0.0280584, -0.0389614, -0.0513355,\
 -0.0654896, -0.0806716, -0.0966108, -0.106769, -0.109453, -0.110879,\
 -0.111644, -0.112018, -0.112372, -0.1127, -0.113028, -0.113381, -0.113616,\
 -0.114165, -0.115316, -0.117174, -0.12293, -0.131784, -0.140407, -0.148571,\
 -0.15592, -0.162615, -0.168937, -0.175252, -0.181773, -0.188704, -0.196268,\
 -0.204729, -0.214442, -0.225713, -0.238805, -0.252985, -0.268084, -0.277631,\
 -0.279881, -0.280991, -0.281515, -0.281693, -0.281883, -0.282058, -0.282233,\
 -0.282421, -0.282462, -0.282747, -0.283555, -0.284975, -0.290116, -0.298125,\
 -0.305741, -0.312837, -0.319077, -0.324576, -0.329502, -0.334127, -0.338608,\
 -0.343089, -0.347712, -0.352635, -0.358039, -0.364172, -0.37123, -0.378796,\
 -0.386727, -0.391744, -0.393008, -0.393626, -0.394106, -0.394439, -0.394606,\
 -0.394759, -0.394911, -0.395074, -0.395131, -0.395157, -0.395197, -0.394805,\
 -0.391014, -0.384769, -0.379213, -0.374284, -0.370362, -0.367344, -0.365206,\
 -0.363956, -0.363545, -0.363956, -0.365206, -0.367344, -0.370362, -0.374284,\
 -0.379213, -0.384769, -0.391014, -0.394805, -0.395197, -0.395157, -0.395131,\
 -0.395074, -0.394911, -0.394759, -0.394606, -0.394439, -0.394106, -0.393626,\
 -0.393008, -0.391744, -0.386727, -0.378796, -0.37123, -0.364172, -0.358039,\
 -0.352635, -0.347712, -0.343089, -0.338608, -0.334127, -0.329502, -0.324576,\
 -0.319077, -0.312837, -0.305741, -0.298125, -0.290116, -0.284975, -0.283555,\
 -0.282747, -0.282462, -0.282421, -0.282233, -0.282058, -0.281883, -0.281693,\
 -0.281515, -0.280991, -0.279881, -0.277631, -0.268084, -0.252985, -0.238805,\
 -0.225713, -0.214442, -0.204729, -0.196268, -0.188704, -0.181773, -0.175252,\
 -0.168937, -0.162615, -0.15592, -0.148571, -0.140407, -0.131784, -0.12293,\
 -0.117174, -0.115316, -0.114165, -0.113616, -0.113381, -0.113028, -0.1127,\
 -0.112372, -0.112018, -0.111644, -0.110879, -0.109453, -0.106769, -0.0966108,\
 -0.0806716, -0.0654896, -0.0513355, -0.0389614, -0.0280584, -0.0182092,\
 -0.00896241, 1.31442e-15, 0.00896241, 0.0182092, 0.0280584, 0.0389614,\
 0.0513355, 0.0654896, 0.0806716, 0.0966108, 0.106769, 0.109453, 0.110879,\
 0.111644, 0.112018, 0.112372, 0.1127, -0.39076, -0.390747, -0.390732,\
 -0.390662, -0.390374, -0.389756, -0.388231, -0.38053, -0.368208, -0.356813,\
 -0.346408, -0.337637, -0.330286, -0.324167, -0.319079, -0.314839, -0.311312,\
 -0.308388, -0.305972, -0.303849, -0.30187, -0.300003, -0.298232, -0.296725,\
 -0.295591, -0.294745, -0.294057, -0.293726, -0.293556, -0.293258, -0.292982,\
 -0.292704, -0.292403, -0.291995, -0.291276, -0.290096, -0.287816, -0.279055,\
 -0.265274, -0.25214, -0.239894, -0.229208, -0.219793, -0.211264, -0.203257,\
 -0.195495, -0.187734, -0.179725, -0.171195, -0.161725, -0.150978, -0.138709,\
 -0.125547, -0.11172, -0.102887, -0.100518, -0.0992276, -0.0986213, -0.0983823,\
 -0.0980692, -0.0977789, -0.0974885, -0.0971754, -0.0969362, -0.0963168,\
 -0.0950117, -0.0926403, -0.0838046, -0.0699755, -0.05681, -0.044538,\
 -0.0337874, -0.0243141, -0.0157795, -0.0077666, 1.15794e-15, 0.0077666,\
 0.0157795, 0.0243141, 0.0337874, 0.044538, 0.05681, 0.0699755, 0.0838046,\
 0.0926403, 0.0950117, 0.0963168, 0.0969362, 0.0971754, 0.0974885, 0.0977789,\
 0.0980692, 0.0983823, 0.0986213, 0.0992276, 0.100518, 0.102887, 0.11172,\
 0.125547, 0.138709, 0.150978, 0.161725, 0.171195, 0.179725, 0.187734,\
 0.195495, 0.203257, 0.211264, 0.219793, 0.229208, 0.239894, 0.25214, 0.265274,\
 0.279055, 0.287816, 0.290096, 0.291276, 0.291995, 0.292403, 0.292704,\
 0.292982, 0.293258, 0.293556, 0.293726, 0.294057, 0.294745, 0.295591,\
 0.296725, 0.298232, 0.300003, 0.30187, 0.303849, 0.305972, 0.308388, 0.311312,\
 0.314839, 0.319079, 0.324167, 0.330286, 0.337637, 0.346408, 0.356813,\
 0.368208, 0.38053, 0.388231, 0.389756, 0.390374, 0.390662, 0.390732, 0.390747,\
 0.39076, 0.390773, 0.390785, 0.390616, 0.390504, 0.390614, 0.390704, 0.390775,\
 0.39082, 0.390849, 0.390871, 0.390933, 0.390988, 0.39099, 0.390991, 0.390991,\
 0.390991, 0.39099, 0.390988, 0.390933, 0.390871, 0.390849, 0.39082, 0.390775,\
 0.390704, 0.390614, 0.390504, 0.390616, 0.390785, 0.390773, 0.39076, 0.390747,\
 0.390732, 0.390662, 0.390374, 0.389756, 0.388231, 0.38053, 0.368208, 0.356813,\
 0.346408, 0.337637, 0.330286, 0.324167, 0.319079, 0.314839, 0.311312,\
 0.308388, 0.305972, 0.303849, 0.30187, 0.300003, 0.298232, 0.296725, 0.295591,\
 0.294745, 0.294057, 0.293726, 0.293556, 0.293258, 0.292982, 0.292704,\
 0.292403, 0.291995, 0.291276, 0.290096, 0.287816, 0.279055, 0.265274, 0.25214,\
 0.239894, 0.229208, 0.219793, 0.211264, 0.203257, 0.195495, 0.187734,\
 0.179725, 0.171195, 0.161725, 0.150978, 0.138709, 0.125547, 0.11172, 0.102887,\
 0.100518, 0.0992276, 0.0986213, 0.0983823, 0.0980692, 0.0977789, 0.0974885,\
 0.0971754, 0.0969362, 0.0963168, 0.0950117, 0.0926403, 0.0838046, 0.0699755,\
 0.05681, 0.044538, 0.0337874, 0.0243141, 0.0157795, 0.0077666, -1.15794e-15,\
 -0.0077666, -0.0157795, -0.0243141, -0.0337874, -0.044538, -0.05681,\
 -0.0699755, -0.0838046, -0.0926403, -0.0950117, -0.0963168, -0.0969362,\
 -0.0971754, -0.0974885, -0.0977789, -0.0980692, -0.0983823, -0.0986213,\
 -0.0992276, -0.100518, -0.102887, -0.11172, -0.125547, -0.138709, -0.150978,\
 -0.161725, -0.171195, -0.179725, -0.187734, -0.195495, -0.203257, -0.211264,\
 -0.219793, -0.229208, -0.239894, -0.25214, -0.265274, -0.279055, -0.287816,\
 -0.290096, -0.291276, -0.291995, -0.292403, -0.292704, -0.292982, -0.293258,\
 -0.293556, -0.293726, -0.294057, -0.294745, -0.295591, -0.296725, -0.298232,\
 -0.300003, -0.30187, -0.303849, -0.305972, -0.308388, -0.311312, -0.314839,\
 -0.319079, -0.324167, -0.330286, -0.337637, -0.346408, -0.356813, -0.368208,\
 -0.38053, -0.388231, -0.389756, -0.390374, -0.390662, -0.390732, -0.390747,\
 -0.39076, -0.390773, -0.390785, -0.390616, -0.390504, -0.390614, -0.390704,\
 -0.390775, -0.39082, -0.390849, -0.390871, -0.390933, -0.390988, -0.39099,\
 -0.390991, -0.390991, -0.390991, -0.39099, -0.390988, -0.390933, -0.390871,\
 -0.390849, -0.39082, -0.390775, -0.390704, -0.390614, -0.390504, -0.390616,\
 -0.390785, -0.390773, -0.39076, 0.0793475, 0.0795698, 0.0798076, 0.0799339,\
 0.0800124, 0.080072, 0.0795206, 0.0741608, 0.0653322, 0.0574754, 0.0505061,\
 0.0449618, 0.0406938, 0.0376706, 0.0359045, 0.0353228, 0.0359045, 0.0376706,\
 0.0406938, 0.0449618, 0.0505061, 0.0574754, 0.0653322, 0.0741608, 0.0795206,\
 0.080072, 0.0800124, 0.0799339, 0.0798076, 0.0795698, 0.0793475, 0.0791238,\
 0.0788805, 0.0784407, 0.077823, 0.0769722, 0.0751785, 0.0680777, 0.0568569,\
 0.0461522, 0.0361661, 0.0274879, 0.0198417, 0.0128768, 0.00633792,\
 -3.49925e-16, -0.00633792, -0.0128768, -0.0198417, -0.0274879, -0.0361661,\
 -0.0461522, -0.0568569, -0.0680777, -0.0751785, -0.0769722, -0.077823,\
 -0.0784407, -0.0788805, -0.0791238, -0.0793475, -0.0795698, -0.0798076,\
 -0.0799339, -0.0800124, -0.080072, -0.0795206, -0.0741608, -0.0653322,\
 -0.0574754, -0.0505061, -0.0449618, -0.0406938, -0.0376706, -0.0359045,\
 -0.0353228, -0.0359045, -0.0376706, -0.0406938, -0.0449618, -0.0505061,\
 -0.0574754, -0.0653322, -0.0741608, -0.0795206, -0.080072, -0.0800124,\
 -0.0799339, -0.0798076, -0.0795698, -0.0793475, -0.0791238, -0.0788805,\
 -0.0784407, -0.077823, -0.0769722, -0.0751785, -0.0680777, -0.0568569,\
 -0.0461522, -0.0361661, -0.0274879, -0.0198417, -0.0128768, -0.00633792,\
 3.52543e-16, 0.00633792, 0.0128768, 0.0198417, 0.0274879, 0.0361661,\
 0.0461522, 0.0568569, 0.0680777, 0.0751785, 0.0769722, 0.077823, 0.0784407,\
 0.0788805, 0.0791238, 0.0793475, 0.0795698, 0.0798076, 0.0799339, 0.0800124,\
 0.080072, 0.0795206, 0.0741608, 0.0653322, 0.0574754, 0.0505061, 0.0449618,\
 0.0406938, 0.0376706, 0.0359045, 0.0353228, 0.0359045, 0.0376706, 0.0406938,\
 0.0449618, 0.0505061, 0.0574754, 0.0653322, 0.0741608, 0.0795206, 0.080072,\
 0.0800124, 0.0799339, 0.0798076, 0.0795698, 0.0793475, 0.0791238, 0.0788805,\
 0.0784407, 0.077823, 0.0769722, 0.0751785, 0.0680777, 0.0568569, 0.0461522,\
 0.0361661, 0.0274879, 0.0198417, 0.0128768, 0.00633792, -3.52543e-16,\
 -0.00633792, -0.0128768, -0.0198417, -0.0274879, -0.0361661, -0.0461522,\
 -0.0568569, -0.0680777, -0.0751785, -0.0769722, -0.077823, -0.0784407,\
 -0.0788805, -0.0791238, -0.0793475, -0.0795698, -0.0798076, -0.0799339,\
 -0.0800124, -0.080072, -0.0795206, -0.0741608, -0.0653322, -0.0574754,\
 -0.0505061, -0.0449618, -0.0406938, -0.0376706, -0.0359045, -0.0353228,\
 -0.0359045, -0.0376706, -0.0406938, -0.0449618, -0.0505061, -0.0574754,\
 -0.0653322, -0.0741608, -0.0795206, -0.080072, -0.0800124, -0.0799339,\
 -0.0798076, -0.0795698, -0.0793475, -0.0791238, -0.0788805, -0.0784407,\
 -0.077823, -0.0769722, -0.0751785, -0.0680777, -0.0568569, -0.0461522,\
 -0.0361661, -0.0274879, -0.0198417, -0.0128768, -0.00633792, 3.49925e-16,\
 0.00633792, 0.0128768, 0.0198417, 0.0274879, 0.0361661, 0.0461522, 0.0568569,\
 0.0680777, 0.0751785, 0.0769722, 0.077823, 0.0784407, 0.0788805, 0.0791238,\
 0.0793475, 0.0795698, 0.0798076, 0.0799339, 0.0800124, 0.080072, 0.0795206,\
 0.0741608, 0.0653322, 0.0574754, 0.0505061, 0.0449618, 0.0406938, 0.0376706,\
 0.0359045, 0.0353228, 0.0359045, 0.0376706, 0.0406938, 0.0449618, 0.0505061,\
 0.0574754, 0.0653322, 0.0741608, 0.0795206, 0.080072, 0.0800124, 0.0799339,\
 0.0798076, 0.0795698, 0.0793475, 0.0791238, 0.0788805, 0.0784407, 0.077823,\
 0.0769722, 0.0751785, 0.0680777, 0.0568569, 0.0461522, 0.0361661, 0.0274879,\
 0.0198417, 0.0128768, 0.00633792, -3.52543e-16, -0.00633792, -0.0128768,\
 -0.0198417, -0.0274879, -0.0361661, -0.0461522, -0.0568569, -0.0680777,\
 -0.0751785, -0.0769722, -0.077823, -0.0784407, -0.0788805, -0.0791238,\
 -0.0793475, -0.0795698, -0.0798076, -0.0799339, -0.0800124, -0.080072,\
 -0.0795206, -0.0741608, -0.0653322, -0.0574754, -0.0505061, -0.0449618,\
 -0.0406938, -0.0376706, -0.0359045, -0.0353228, -0.0359045, -0.0376706,\
 -0.0406938, -0.0449618, -0.0505061, -0.0574754, -0.0653322, -0.0741608,\
 -0.0795206, -0.080072, -0.0800124, -0.0799339, -0.0798076, -0.0795698,\
 -0.0793475, -0.0791238, -0.0788805, -0.0784407, -0.077823, -0.0769722,\
 -0.0751785, -0.0680777, -0.0568569, -0.0461522, -0.0361661, -0.0274879,\
 -0.0198417, -0.0128768, -0.00633792, 3.52543e-16, 0.00633792, 0.0128768,\
 0.0198417, 0.0274879, 0.0361661, 0.0461522, 0.0568569, 0.0680777, 0.0751785,\
 0.0769722, 0.077823, 0.0784407, 0.0788805, 0.0791238, 0.0793475) PERIODIC\
 NOSPLINE" );
}

}
