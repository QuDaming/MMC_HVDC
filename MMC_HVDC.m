syms Req Leq N Cs Larm Rarm;%系统参数
syms Tid Tiq Tusd Tusq ;%测量延时
syms Kp11 Ki11 Kp21 Ki21 Kp31 Ki31 Kp41 Ki41 KpPLL1 KiPLL1;%pq测控制器参数
syms Kp12 Ki12 Kp22 Ki22 Kp32 Ki32 Kp42 Ki42 KpPLL2 KiPLL2;%Udc，q侧控制器参数
syms Isd10 Isq10 uc10 Isdm10 Isqm10 usdm10 usqm10 ucd10 ucq10 udc10;%1侧平衡点
syms Isd20 Isq20 uc20 Isdm20 Isqm20 usdm20 usqm20 ucd20 ucq20 udc20;%2侧平衡点
syms Ld Rd;%直流线路参数
syms Isd1 Isq1 uc1 Isdm1 Isqm1 usdm1 usqm1 ucd1 ucq1 udc1 w1 x11 x21 x31 x41 x51 xpll1 Pref1 Qref1 usd1 usq1;
syms Isd2 Isq2 uc2 Isdm2 Isqm2 usdm2 usqm2 ucd2 ucq2 udc2 w2 x12 x22 x32 x42 x52 xpll2 udcref Qref2 usd2 usq2;
syms dIsd1 dIsq1 duc1 dIsdm1 dIsqm1 dusdm1 dusqm1 ducd1 ducq1 dudc1;
syms dIsd2 dIsq2 duc2 dIsdm2 dIsqm2 dusdm2 dusqm2 ducd2 ducq2 dudc2;
syms Idc;
yc=[ucd1;ucd2;w1;ucd2;ucq2;w2;udc1;udc2;];
xc=[Isd1;Isq1;uc1;Isdm1;Isqm1;usdm1;usqm1;x11;x21;x31;x41;Isd2;Isq2;uc2;Isdm2;Isqm2;usdm2;usqm2;x12;x22;x32;x42;Idc;];
uc=[usd1;usq1;udc1;ucd1;ucq1;Pref1;Qref1;usd2;usq2;udc2;ucd2;ucq2;udcref;Qref2;];
Leq=0.272;Larm=0.06;N=200;Cs=0.01;Req=1.38;Rarm=1;
Tid=0.0002;Tiq=0.0002;Tusd=0.002;Tusq=0.002;
Kp11=0.0002;Ki11=1;Kp21=0.0002;Ki21=1;Kp31=50;Ki31=2000;Kp41=50;Ki41=2000;
Kp12=1;Ki12=2;Kp22=4;Ki22=20;Kp32=1.5;Ki32=0.1;Kp42=50;Ki42=2000;
Isd10=1.071; Isq10=-0.03; uc10=3.2; Isdm10=1.071; Isqm10=-0.03; usdm10=185.87; usqm10=0; ucd10=186; ucq10=32.23; udc10=640;
Isd20=-0.99; Isq20=-0.032; uc20=3.2; Isdm20=-0.99; Isqm20=-0.032; usdm20=197.96; usqm20=0; ucd20=200; ucq20=-31; udc20=639.93;
Ld=0.01;Rd=1;

% xc=[Isd1;Isq1;uc1;Isdm1;Isqm1;usdm1;usqm1;x11;x21;x31;x41;x51;xpll1;Isd2;Isq2;uc2;Isdm2;Isqm2;usdm2;usqm2;x12;x22;x32;x42;x52;xpll2;Idc;]; 
A=[-Req/Leq,-100*pi,(N*uc10*ucd10*(N + (3*Ld)/(2*Larm)))/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2)) - (N*ucd10)/(Leq*udc10),-(N*ucd10*(Kp31 + (3*Kp11*Kp31*usdm10)/2))/(Leq*udc10),(N*ucd10*(100*pi*Leq - (3*Kp11*Kp31*usqm10)/2))/(Leq*udc10),-(N*ucd10*((3*Isdm10*Kp11*Kp31)/2 + 1))/(Leq*udc10),-(3*Isqm10*Kp11*Kp31*N*ucd10)/(2*Leq*udc10),(Ki31*N*ucd10)/(Leq*udc10),0,(Ki11*Kp31*N*ucd10)/(Leq*udc10),0,0,0,(N^2*uc10*ucd10)/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2)),0,0,0,0,0,0,0,0,-(N*uc10*ucd10*(Rd - (Ld*Rarm)/Larm))/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2));
    100*pi,-Req/Leq,(N*uc10*ucq10*(N + (3*Ld)/(2*Larm)))/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2)) - (N*ucq10)/(Leq*udc10),-(N*uc10*(100*pi*Leq - (3*Kp21*Kp41*usqm10)/2))/(Leq*udc10),-(N*uc10*(Kp41 + (3*Kp21*Kp41*usdm10)/2))/(Leq*udc10),-(3*Isqm10*Kp21*Kp41*N*uc10)/(2*Leq*udc10),(N*uc10*((3*Isdm10*Kp21*Kp41)/2 - 1))/(Leq*udc10),0,(Ki41*N*uc10)/(Leq*udc10),0,(Ki11*Kp41*N*uc10)/(Leq*udc10),0,0,(N^2*uc10*ucq10)/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2)),0,0,0,0,0,0,0,0,-(N*uc10*ucq10*(Rd - (Ld*Rarm)/Larm))/(2*Leq*udc10^2*((3*Ld)/(2*Larm) + 2));
    ucd10/(4*Cs*udc10),ucq10/(4*Cs*udc10),-((N + (3*Ld)/(2*Larm))*((Isd10*ucd10)/(8*Cs*udc10^2) + (Isq10*ucq10)/(8*Cs*udc10^2)))/((3*Ld)/(2*Larm) + 2),(Isd10*(Kp31 + (3*Kp11*Kp31*usdm10)/2))/(4*Cs*udc10) + (Isq10*(100*pi*Leq - (3*Kp21*Kp41*usqm10)/2))/(4*Cs*udc10),(Isq10*(Kp41 + (3*Kp21*Kp41*usdm10)/2))/(4*Cs*udc10) - (Isd10*(100*pi*Leq - (3*Kp11*Kp31*usqm10)/2))/(4*Cs*udc10),(Isd10*((3*Isdm10*Kp11*Kp31)/2 + 1))/(4*Cs*udc10) + (3*Isq10*Isqm10*Kp21*Kp41)/(8*Cs*udc10),(3*Isd10*Isqm10*Kp11*Kp31)/(8*Cs*udc10) - (Isq10*((3*Isdm10*Kp21*Kp41)/2 - 1))/(4*Cs*udc10),-(Isd10*Ki31)/(4*Cs*udc10),-(Isq10*Ki41)/(4*Cs*udc10),-(Isd10*Ki11*Kp31)/(4*Cs*udc10),-(Isq10*Ki11*Kp41)/(4*Cs*udc10),0,0,-(N*((Isd10*ucd10)/(8*Cs*udc10^2) + (Isq10*ucq10)/(8*Cs*udc10^2)))/((3*Ld)/(2*Larm) + 2),0,0,0,0,0,0,0,0,1/(6*Cs) + ((Rd - (Ld*Rarm)/Larm)*((Isd10*ucd10)/(8*Cs*udc10^2) + (Isq10*ucq10)/(8*Cs*udc10^2)))/((3*Ld)/(2*Larm) + 2);
    1/Tid,0,0,-1/Tid,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,1/Tiq,0,0,-1/Tiq,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,-1/Tusd,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,-1/Tusq,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,- (3*Kp11*usdm10)/2 - 1,-(3*Kp11*usqm10)/2,-(3*Isdm10*Kp11)/2,-(3*Isqm10*Kp11)/2,0,0,Ki11,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,(3*Kp21*usqm10)/2,- (3*Kp21*usdm10)/2 - 1,-(3*Isqm10*Kp21)/2,(3*Isdm10*Kp21)/2,0,0,0,Ki11,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,-(3*usdm10)/2,-(3*usqm10)/2,-(3*Isdm10)/2,-(3*Isqm10)/2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,(3*usqm10)/2,-(3*usdm10)/2,-(3*Isqm10)/2,(3*Isdm10)/2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    0,0,(uc20*ucd20*(N - (N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2)))/(2*Leq*udc20^2),0,0,0,0,0,0,0,0,-Req/Leq,-100*pi,(uc20*ucd20*(N - N/((3*Ld)/(2*Larm) + 2)))/(2*Leq*udc20^2) - (N*ucd20)/(Leq*udc20),-(Kp32*N*uc20)/(Leq*udc20),(100*pi*N*uc20)/udc20,-(N*uc20)/(Leq*udc20),0,(Ki32*N*uc20)/(Leq*udc20),0,(Ki12*Kp32*N*uc20)/(Leq*udc20),0,(uc20*ucd20*(Rd - (Ld*Rarm)/Larm))/(2*Leq*udc20^2*((3*Ld)/(2*Larm) + 2));
    0,0,(uc20*ucq20*(N - (N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2)))/(2*Leq*udc20^2),0,0,0,0,0,0,0,0,100*pi,-Req/Leq,-(N*ucq20)/(Leq*udc20),-(N*uc20*(100*pi*Leq - (3*Kp22*Kp42*usqm20)/2))/(Leq*udc20),-(N*uc20*(Kp42 + (3*Kp22*Kp42*usdm20)/2))/(Leq*udc20),-(3*Isqm20*Kp22*Kp42*N*uc20)/(2*Leq*udc20),(N*uc20*((3*Isdm20*Kp22*Kp42)/2 - 1))/(Leq*udc20),0,(Ki42*N*uc20)/(Leq*udc20),0,(Ki12*Kp42*N*uc20)/(Leq*udc20),(uc20*ucq20*(Rd - (Ld*Rarm)/Larm))/(2*Leq*udc20^2*((3*Ld)/(2*Larm) + 2));
    0,0,-(N - (N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2))*((Isd20*ucd20)/(8*Cs*udc20^2) + (Isq20*ucq20)/(8*Cs*udc20^2)),0,0,0,0,0,0,0,0,ucd20/(4*Cs*udc20),ucq20/(4*Cs*udc20),-(N - N/((3*Ld)/(2*Larm) + 2))*((Isd20*ucd20)/(8*Cs*udc20^2) + (Isq20*ucq20)/(8*Cs*udc20^2)),(Isd20*Kp32)/(4*Cs*udc20) + (Isq20*(100*pi*Leq - (3*Kp22*Kp42*usqm20)/2))/(4*Cs*udc20),(Isq20*(Kp42 + (3*Kp22*Kp42*usdm20)/2))/(4*Cs*udc20) - (25*pi*Isd20*Leq)/(Cs*udc20),Isd20/(4*Cs*udc20) + (3*Isq20*Isqm20*Kp22*Kp42)/(8*Cs*udc20),-(Isq20*((3*Isdm20*Kp22*Kp42)/2 - 1))/(4*Cs*udc20),-(Isd20*Ki32)/(4*Cs*udc20),-(Isq20*Ki42)/(4*Cs*udc20),-(Isd20*Ki12*Kp32)/(4*Cs*udc20),-(Isq20*Ki12*Kp42)/(4*Cs*udc20),- 1/(6*Cs) - ((Rd - (Ld*Rarm)/Larm)*((Isd20*ucd20)/(8*Cs*udc20^2) + (Isq20*ucq20)/(8*Cs*udc20^2)))/((3*Ld)/(2*Larm) + 2);
    0,0,0,0,0,0,0,0,0,0,0,1/Tid,0,0,-1/Tid,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,1/Tiq,0,0,-1/Tiq,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1/Tusd,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1/Tusq,0,0,0,0,0;
    0,0,-Kp12*(N - (N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2)),0,0,0,0,0,0,0,0,0,0,-Kp12*(N - N/((3*Ld)/(2*Larm) + 2)),-1,0,0,0,0,0,Ki12,0,-(Kp12*(Rd - (Ld*Rarm)/Larm))/((3*Ld)/(2*Larm) + 2);
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,(3*Kp22*usqm20)/2,- (3*Kp22*usdm20)/2 - 1,-(3*Isqm20*Kp22)/2,(3*Isdm20*Kp22)/2,0,0,0,Ki12,0;
    0,0,(N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2) - N,0,0,0,0,0,0,0,0,0,0,N/((3*Ld)/(2*Larm) + 2) - N,0,0,0,0,0,0,0,0,-(Rd - (Ld*Rarm)/Larm)/((3*Ld)/(2*Larm) + 2);
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,(3*usqm20)/2,-(3*usdm20)/2,-(3*Isqm20)/2,(3*Isdm20)/2,0,0,0,0,0;
    0,0,-(3*(N - (N + (3*Ld)/(2*Larm))/((3*Ld)/(2*Larm) + 2)))/(2*Larm),0,0,0,0,0,0,0,0,0,0,(3*N)/(2*Larm) - (3*(N - N/((3*Ld)/(2*Larm) + 2)))/(2*Larm),0,0,0,0,0,0,0,0,- Rarm/Larm - (3*(Rd - (Ld*Rarm)/Larm))/(2*Larm*((3*Ld)/(2*Larm) + 2));]; 
% c=[Isd1;Isq1;uc1;Isdm1;Isqm1;usdm1;usqm1;x11;x21;x31;x41;Isd2;Isq2;uc2;Isdm2;Isqm2;usdm2;usqm2;x12;x22;x32;x42;Idc;]; 




