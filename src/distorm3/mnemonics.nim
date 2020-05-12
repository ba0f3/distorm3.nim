type
  InstructionType* = enum
    I_UNDEFINED = 0, I_ADD = 11, I_PUSH = 16, I_POP = 22, I_OR = 27, I_ADC = 31, I_SBB = 36,
    I_AND = 41, I_DAA = 46, I_SUB = 51, I_DAS = 56, I_XOR = 61, I_AAA = 66, I_CMP = 71, I_AAS = 76,
    I_INC = 81, I_DEC = 86, I_PUSHA = 91, I_POPA = 98, I_BOUND = 104, I_ARPL = 111, I_IMUL = 117,
    I_INS = 123, I_OUTS = 128, I_JO = 134, I_JNO = 138, I_JB = 143, I_JAE = 147, I_JZ = 152,
    I_JNZ = 156, I_JBE = 161, I_JA = 166, I_JS = 170, I_JNS = 174, I_JP = 179, I_JNP = 183,
    I_JL = 188, I_JGE = 192, I_JLE = 197, I_JG = 202, I_TEST = 206, I_XCHG = 212, I_MOV = 218,
    I_LEA = 223, I_CBW = 228, I_CWDE = 233, I_CDQE = 239, I_CWD = 245, I_CDQ = 250, I_CQO = 255,
    I_CALL_FAR = 260, I_PUSHF = 270, I_POPF = 277, I_SAHF = 283, I_LAHF = 289, I_MOVS = 295,
    I_CMPS = 301, I_STOS = 307, I_LODS = 313, I_SCAS = 319, I_RET = 325, I_LES = 330, I_LDS = 335,
    I_ENTER = 340, I_LEAVE = 347, I_RETF = 354, I_INT_3 = 360, I_INT = 367, I_INTO = 372,
    I_IRET = 378, I_AAM = 384, I_AAD = 389, I_SALC = 394, I_XLAT = 400, I_LOOPNZ = 406,
    I_LOOPZ = 414, I_LOOP = 421, I_JCXZ = 427, I_JECXZ = 433, I_JRCXZ = 440, I_IN = 447,
    I_OUT = 451, I_CALL = 456, I_JMP = 462, I_JMP_FAR = 467, I_INT1 = 476, I_HLT = 482,
    I_CMC = 487, I_CLC = 492, I_STC = 497, I_CLI = 502, I_STI = 507, I_CLD = 512, I_STD = 517,
    I_LAR = 522, I_LSL = 527, I_SYSCALL = 532, I_CLTS = 541, I_SYSRET = 547, I_INVD = 555,
    I_WBINVD = 561, I_UD2 = 569, I_FEMMS = 574, I_NOP = 581, I_WRMSR = 586, I_RDTSC = 593,
    I_RDMSR = 600, I_RDPMC = 607, I_SYSENTER = 614, I_SYSEXIT = 624, I_GETSEC = 633,
    I_CMOVO = 641, I_CMOVNO = 648, I_CMOVB = 656, I_CMOVAE = 663, I_CMOVZ = 671,
    I_CMOVNZ = 678, I_CMOVBE = 686, I_CMOVA = 694, I_CMOVS = 701, I_CMOVNS = 708,
    I_CMOVP = 716, I_CMOVNP = 723, I_CMOVL = 731, I_CMOVGE = 738, I_CMOVLE = 746,
    I_CMOVG = 754, I_SETO = 761, I_SETNO = 767, I_SETB = 774, I_SETAE = 780, I_SETZ = 787,
    I_SETNZ = 793, I_SETBE = 800, I_SETA = 807, I_SETS = 813, I_SETNS = 819, I_SETP = 826,
    I_SETNP = 832, I_SETL = 839, I_SETGE = 845, I_SETLE = 852, I_SETG = 859, I_CPUID = 865,
    I_BT = 872, I_SHLD = 876, I_RSM = 882, I_BTS = 887, I_SHRD = 892, I_CMPXCHG = 898,
    I_LSS = 907, I_BTR = 912, I_LFS = 917, I_LGS = 922, I_MOVZX = 927, I_BTC = 934, I_MOVSX = 939,
    I_XADD = 946, I_MOVNTI = 952, I_BSWAP = 960, I_ROL = 967, I_ROR = 972, I_RCL = 977,
    I_RCR = 982, I_SHL = 987, I_SHR = 992, I_SAL = 997, I_SAR = 1002, I_XABORT = 1007,
    I_XBEGIN = 1015, I_FADD = 1023, I_FMUL = 1029, I_FCOM = 1035, I_FCOMP = 1041,
    I_FSUB = 1048, I_FSUBR = 1054, I_FDIV = 1061, I_FDIVR = 1067, I_FLD = 1074, I_FST = 1079,
    I_FSTP = 1084, I_FLDENV = 1090, I_FLDCW = 1098, I_FXCH = 1105, I_FNOP = 1111,
    I_FCHS = 1117, I_FABS = 1123, I_FTST = 1129, I_FXAM = 1135, I_FLD1 = 1141, I_FLDL2T = 1147,
    I_FLDL2E = 1155, I_FLDPI = 1163, I_FLDLG2 = 1170, I_FLDLN2 = 1178, I_FLDZ = 1186,
    I_F2XM1 = 1192, I_FYL2X = 1199, I_FPTAN = 1206, I_FPATAN = 1213, I_FXTRACT = 1221,
    I_FPREM1 = 1230, I_FDECSTP = 1238, I_FINCSTP = 1247, I_FPREM = 1256, I_FYL2XP1 = 1263,
    I_FSQRT = 1272, I_FSINCOS = 1279, I_FRNDINT = 1288, I_FSCALE = 1297, I_FSIN = 1305,
    I_FCOS = 1311, I_FIADD = 1317, I_FIMUL = 1324, I_FICOM = 1331, I_FICOMP = 1338,
    I_FISUB = 1346, I_FISUBR = 1353, I_FIDIV = 1361, I_FIDIVR = 1368, I_FCMOVB = 1376,
    I_FCMOVE = 1384, I_FCMOVBE = 1392, I_FCMOVU = 1401, I_FUCOMPP = 1409, I_FILD = 1418,
    I_FISTTP = 1424, I_FIST = 1432, I_FISTP = 1438, I_FCMOVNB = 1445, I_FCMOVNE = 1454,
    I_FCMOVNBE = 1463, I_FCMOVNU = 1473, I_FENI = 1482, I_FEDISI = 1488, I_FSETPM = 1496,
    I_FUCOMI = 1504, I_FCOMI = 1512, I_FRSTOR = 1519, I_FFREE = 1527, I_FUCOM = 1534,
    I_FUCOMP = 1541, I_FADDP = 1549, I_FMULP = 1556, I_FCOMPP = 1563, I_FSUBRP = 1571,
    I_FSUBP = 1579, I_FDIVRP = 1586, I_FDIVP = 1594, I_FBLD = 1601, I_FBSTP = 1607,
    I_FUCOMIP = 1614, I_FCOMIP = 1623, I_NOT = 1631, I_NEG = 1636, I_MUL = 1641, I_DIV = 1646,
    I_IDIV = 1651, I_SLDT = 1657, I_STR = 1663, I_LLDT = 1668, I_LTR = 1674, I_VERR = 1679,
    I_VERW = 1685, I_SGDT = 1691, I_SIDT = 1697, I_LGDT = 1703, I_LIDT = 1709, I_SMSW = 1715,
    I_LMSW = 1721, I_INVLPG = 1727, I_VMCALL = 1735, I_VMLAUNCH = 1743, I_VMRESUME = 1753,
    I_VMXOFF = 1763, I_MONITOR = 1771, I_MWAIT = 1780, I_XGETBV = 1787, I_XSETBV = 1795,
    I_VMFUNC = 1803, I_XEND = 1811, I_VMRUN = 1817, I_VMMCALL = 1824, I_VMLOAD = 1833,
    I_VMSAVE = 1841, I_STGI = 1849, I_CLGI = 1855, I_SKINIT = 1861, I_INVLPGA = 1869,
    I_SWAPGS = 1878, I_RDTSCP = 1886, I_PREFETCH = 1894, I_PREFETCHW = 1904, I_PI2FW = 1915,
    I_PI2FD = 1922, I_PF2IW = 1929, I_PF2ID = 1936, I_PFNACC = 1943, I_PFPNACC = 1951,
    I_PFCMPGE = 1960, I_PFMIN = 1969, I_PFRCP = 1976, I_PFRSQRT = 1983, I_PFSUB = 1992,
    I_PFADD = 1999, I_PFCMPGT = 2006, I_PFMAX = 2015, I_PFRCPIT1 = 2022, I_PFRSQIT1 = 2032,
    I_PFSUBR = 2042, I_PFACC = 2050, I_PFCMPEQ = 2057, I_PFMUL = 2066, I_PFRCPIT2 = 2073,
    I_PMULHRW = 2083, I_PSWAPD = 2092, I_PAVGUSB = 2100, I_MOVUPS = 2109, I_MOVUPD = 2117,
    I_MOVSS = 2125, I_MOVSD = 2132, I_VMOVUPS = 2139, I_VMOVUPD = 2148, I_VMOVSS = 2157,
    I_VMOVSD = 2165, I_MOVHLPS = 2173, I_MOVLPS = 2182, I_MOVLPD = 2190, I_MOVSLDUP = 2198,
    I_MOVDDUP = 2208, I_VMOVHLPS = 2217, I_VMOVLPS = 2227, I_VMOVLPD = 2236,
    I_VMOVSLDUP = 2245, I_VMOVDDUP = 2256, I_UNPCKLPS = 2266, I_UNPCKLPD = 2276,
    I_VUNPCKLPS = 2286, I_VUNPCKLPD = 2297, I_UNPCKHPS = 2308, I_UNPCKHPD = 2318,
    I_VUNPCKHPS = 2328, I_VUNPCKHPD = 2339, I_MOVLHPS = 2350, I_MOVHPS = 2359,
    I_MOVHPD = 2367, I_MOVSHDUP = 2375, I_VMOVLHPS = 2385, I_VMOVHPS = 2395,
    I_VMOVHPD = 2404, I_VMOVSHDUP = 2413, I_PREFETCHNTA = 2424, I_PREFETCHT0 = 2437,
    I_PREFETCHT1 = 2449, I_PREFETCHT2 = 2461, I_MOVAPS = 2473, I_MOVAPD = 2481,
    I_VMOVAPS = 2489, I_VMOVAPD = 2498, I_CVTPI2PS = 2507, I_CVTPI2PD = 2517,
    I_CVTSI2SS = 2527, I_CVTSI2SD = 2537, I_VCVTSI2SS = 2547, I_VCVTSI2SD = 2558,
    I_MOVNTPS = 2569, I_MOVNTPD = 2578, I_MOVNTSS = 2587, I_MOVNTSD = 2596,
    I_VMOVNTPS = 2605, I_VMOVNTPD = 2615, I_CVTTPS2PI = 2625, I_CVTTPD2PI = 2636,
    I_CVTTSS2SI = 2647, I_CVTTSD2SI = 2658, I_VCVTTSS2SI = 2669, I_VCVTTSD2SI = 2681,
    I_CVTPS2PI = 2693, I_CVTPD2PI = 2703, I_CVTSS2SI = 2713, I_CVTSD2SI = 2723,
    I_VCVTSS2SI = 2733, I_VCVTSD2SI = 2744, I_UCOMISS = 2755, I_UCOMISD = 2764,
    I_VUCOMISS = 2773, I_VUCOMISD = 2783, I_COMISS = 2793, I_COMISD = 2801,
    I_VCOMISS = 2809, I_VCOMISD = 2818, I_MOVMSKPS = 2827, I_MOVMSKPD = 2837,
    I_VMOVMSKPS = 2847, I_VMOVMSKPD = 2858, I_SQRTPS = 2869, I_SQRTPD = 2877,
    I_SQRTSS = 2885, I_SQRTSD = 2893, I_VSQRTPS = 2901, I_VSQRTPD = 2910, I_VSQRTSS = 2919,
    I_VSQRTSD = 2928, I_RSQRTPS = 2937, I_RSQRTSS = 2946, I_VRSQRTPS = 2955,
    I_VRSQRTSS = 2965, I_RCPPS = 2975, I_RCPSS = 2982, I_VRCPPS = 2989, I_VRCPSS = 2997,
    I_ANDPS = 3005, I_ANDPD = 3012, I_VANDPS = 3019, I_VANDPD = 3027, I_ANDNPS = 3035,
    I_ANDNPD = 3043, I_VANDNPS = 3051, I_VANDNPD = 3060, I_ORPS = 3069, I_ORPD = 3075,
    I_VORPS = 3081, I_VORPD = 3088, I_XORPS = 3095, I_XORPD = 3102, I_VXORPS = 3109,
    I_VXORPD = 3117, I_ADDPS = 3125, I_ADDPD = 3132, I_ADDSS = 3139, I_ADDSD = 3146,
    I_VADDPS = 3153, I_VADDPD = 3161, I_VADDSS = 3169, I_VADDSD = 3177, I_MULPS = 3185,
    I_MULPD = 3192, I_MULSS = 3199, I_MULSD = 3206, I_VMULPS = 3213, I_VMULPD = 3221,
    I_VMULSS = 3229, I_VMULSD = 3237, I_CVTPS2PD = 3245, I_CVTPD2PS = 3255,
    I_CVTSS2SD = 3265, I_CVTSD2SS = 3275, I_VCVTPS2PD = 3285, I_VCVTPD2PS = 3296,
    I_VCVTSS2SD = 3307, I_VCVTSD2SS = 3318, I_CVTDQ2PS = 3329, I_CVTPS2DQ = 3339,
    I_CVTTPS2DQ = 3349, I_VCVTDQ2PS = 3360, I_VCVTPS2DQ = 3371, I_VCVTTPS2DQ = 3382,
    I_SUBPS = 3394, I_SUBPD = 3401, I_SUBSS = 3408, I_SUBSD = 3415, I_VSUBPS = 3422,
    I_VSUBPD = 3430, I_VSUBSS = 3438, I_VSUBSD = 3446, I_MINPS = 3454, I_MINPD = 3461,
    I_MINSS = 3468, I_MINSD = 3475, I_VMINPS = 3482, I_VMINPD = 3490, I_VMINSS = 3498,
    I_VMINSD = 3506, I_DIVPS = 3514, I_DIVPD = 3521, I_DIVSS = 3528, I_DIVSD = 3535,
    I_VDIVPS = 3542, I_VDIVPD = 3550, I_VDIVSS = 3558, I_VDIVSD = 3566, I_MAXPS = 3574,
    I_MAXPD = 3581, I_MAXSS = 3588, I_MAXSD = 3595, I_VMAXPS = 3602, I_VMAXPD = 3610,
    I_VMAXSS = 3618, I_VMAXSD = 3626, I_PUNPCKLBW = 3634, I_VPUNPCKLBW = 3645,
    I_PUNPCKLWD = 3657, I_VPUNPCKLWD = 3668, I_PUNPCKLDQ = 3680, I_VPUNPCKLDQ = 3691,
    I_PACKSSWB = 3703, I_VPACKSSWB = 3713, I_PCMPGTB = 3724, I_VPCMPGTB = 3733,
    I_PCMPGTW = 3743, I_VPCMPGTW = 3752, I_PCMPGTD = 3762, I_VPCMPGTD = 3771,
    I_PACKUSWB = 3781, I_VPACKUSWB = 3791, I_PUNPCKHBW = 3802, I_VPUNPCKHBW = 3813,
    I_PUNPCKHWD = 3825, I_VPUNPCKHWD = 3836, I_PUNPCKHDQ = 3848, I_VPUNPCKHDQ = 3859,
    I_PACKSSDW = 3871, I_VPACKSSDW = 3881, I_PUNPCKLQDQ = 3892, I_VPUNPCKLQDQ = 3904,
    I_PUNPCKHQDQ = 3917, I_VPUNPCKHQDQ = 3929, I_MOVD = 3942, I_MOVQ = 3948, I_VMOVD = 3954,
    I_VMOVQ = 3961, I_MOVDQA = 3968, I_MOVDQU = 3976, I_VMOVDQA = 3984, I_VMOVDQU = 3993,
    I_PSHUFW = 4002, I_PSHUFD = 4010, I_PSHUFHW = 4018, I_PSHUFLW = 4027, I_VPSHUFD = 4036,
    I_VPSHUFHW = 4045, I_VPSHUFLW = 4055, I_PCMPEQB = 4065, I_VPCMPEQB = 4074,
    I_PCMPEQW = 4084, I_VPCMPEQW = 4093, I_PCMPEQD = 4103, I_VPCMPEQD = 4112, I_EMMS = 4122,
    I_VZEROUPPER = 4128, I_VZEROALL = 4140, I_VMREAD = 4150, I_EXTRQ = 4158,
    I_INSERTQ = 4165, I_VMWRITE = 4174, I_CVTPH2PS = 4183, I_CVTPS2PH = 4193,
    I_HADDPD = 4203, I_HADDPS = 4211, I_VHADDPD = 4219, I_VHADDPS = 4228, I_HSUBPD = 4237,
    I_HSUBPS = 4245, I_VHSUBPD = 4253, I_VHSUBPS = 4262, I_XSAVE = 4271, I_XSAVE64 = 4278,
    I_LFENCE = 4287, I_XRSTOR = 4295, I_XRSTOR64 = 4303, I_MFENCE = 4313, I_XSAVEOPT = 4321,
    I_XSAVEOPT64 = 4331, I_SFENCE = 4343, I_CLFLUSH = 4351, I_POPCNT = 4360, I_BSF = 4368,
    I_TZCNT = 4373, I_BSR = 4380, I_LZCNT = 4385, I_CMPEQPS = 4392, I_CMPLTPS = 4401,
    I_CMPLEPS = 4410, I_CMPUNORDPS = 4419, I_CMPNEQPS = 4431, I_CMPNLTPS = 4441,
    I_CMPNLEPS = 4451, I_CMPORDPS = 4461, I_CMPEQPD = 4471, I_CMPLTPD = 4480,
    I_CMPLEPD = 4489, I_CMPUNORDPD = 4498, I_CMPNEQPD = 4510, I_CMPNLTPD = 4520,
    I_CMPNLEPD = 4530, I_CMPORDPD = 4540, I_CMPEQSS = 4550, I_CMPLTSS = 4559,
    I_CMPLESS = 4568, I_CMPUNORDSS = 4577, I_CMPNEQSS = 4589, I_CMPNLTSS = 4599,
    I_CMPNLESS = 4609, I_CMPORDSS = 4619, I_CMPEQSD = 4629, I_CMPLTSD = 4638,
    I_CMPLESD = 4647, I_CMPUNORDSD = 4656, I_CMPNEQSD = 4668, I_CMPNLTSD = 4678,
    I_CMPNLESD = 4688, I_CMPORDSD = 4698, I_VCMPEQPS = 4708, I_VCMPLTPS = 4718,
    I_VCMPLEPS = 4728, I_VCMPUNORDPS = 4738, I_VCMPNEQPS = 4751, I_VCMPNLTPS = 4762,
    I_VCMPNLEPS = 4773, I_VCMPORDPS = 4784, I_VCMPEQ_UQPS = 4795, I_VCMPNGEPS = 4808,
    I_VCMPNGTPS = 4819, I_VCMPFALSEPS = 4830, I_VCMPNEQ_OQPS = 4843, I_VCMPGEPS = 4857,
    I_VCMPGTPS = 4867, I_VCMPTRUEPS = 4877, I_VCMPEQ_OSPS = 4889, I_VCMPLT_OQPS = 4902,
    I_VCMPLE_OQPS = 4915, I_VCMPUNORD_SPS = 4928, I_VCMPNEQ_USPS = 4943,
    I_VCMPNLT_UQPS = 4957, I_VCMPNLE_UQPS = 4971, I_VCMPORD_SPS = 4985,
    I_VCMPEQ_USPS = 4998, I_VCMPNGE_UQPS = 5011, I_VCMPNGT_UQPS = 5025,
    I_VCMPFALSE_OSPS = 5039, I_VCMPNEQ_OSPS = 5055, I_VCMPGE_OQPS = 5069,
    I_VCMPGT_OQPS = 5082, I_VCMPTRUE_USPS = 5095, I_VCMPEQPD = 5110, I_VCMPLTPD = 5120,
    I_VCMPLEPD = 5130, I_VCMPUNORDPD = 5140, I_VCMPNEQPD = 5153, I_VCMPNLTPD = 5164,
    I_VCMPNLEPD = 5175, I_VCMPORDPD = 5186, I_VCMPEQ_UQPD = 5197, I_VCMPNGEPD = 5210,
    I_VCMPNGTPD = 5221, I_VCMPFALSEPD = 5232, I_VCMPNEQ_OQPD = 5245, I_VCMPGEPD = 5259,
    I_VCMPGTPD = 5269, I_VCMPTRUEPD = 5279, I_VCMPEQ_OSPD = 5291, I_VCMPLT_OQPD = 5304,
    I_VCMPLE_OQPD = 5317, I_VCMPUNORD_SPD = 5330, I_VCMPNEQ_USPD = 5345,
    I_VCMPNLT_UQPD = 5359, I_VCMPNLE_UQPD = 5373, I_VCMPORD_SPD = 5387,
    I_VCMPEQ_USPD = 5400, I_VCMPNGE_UQPD = 5413, I_VCMPNGT_UQPD = 5427,
    I_VCMPFALSE_OSPD = 5441, I_VCMPNEQ_OSPD = 5457, I_VCMPGE_OQPD = 5471,
    I_VCMPGT_OQPD = 5484, I_VCMPTRUE_USPD = 5497, I_VCMPEQSS = 5512, I_VCMPLTSS = 5522,
    I_VCMPLESS = 5532, I_VCMPUNORDSS = 5542, I_VCMPNEQSS = 5555, I_VCMPNLTSS = 5566,
    I_VCMPNLESS = 5577, I_VCMPORDSS = 5588, I_VCMPEQ_UQSS = 5599, I_VCMPNGESS = 5612,
    I_VCMPNGTSS = 5623, I_VCMPFALSESS = 5634, I_VCMPNEQ_OQSS = 5647, I_VCMPGESS = 5661,
    I_VCMPGTSS = 5671, I_VCMPTRUESS = 5681, I_VCMPEQ_OSSS = 5693, I_VCMPLT_OQSS = 5706,
    I_VCMPLE_OQSS = 5719, I_VCMPUNORD_SSS = 5732, I_VCMPNEQ_USSS = 5747,
    I_VCMPNLT_UQSS = 5761, I_VCMPNLE_UQSS = 5775, I_VCMPORD_SSS = 5789,
    I_VCMPEQ_USSS = 5802, I_VCMPNGE_UQSS = 5815, I_VCMPNGT_UQSS = 5829,
    I_VCMPFALSE_OSSS = 5843, I_VCMPNEQ_OSSS = 5859, I_VCMPGE_OQSS = 5873,
    I_VCMPGT_OQSS = 5886, I_VCMPTRUE_USSS = 5899, I_VCMPEQSD = 5914, I_VCMPLTSD = 5924,
    I_VCMPLESD = 5934, I_VCMPUNORDSD = 5944, I_VCMPNEQSD = 5957, I_VCMPNLTSD = 5968,
    I_VCMPNLESD = 5979, I_VCMPORDSD = 5990, I_VCMPEQ_UQSD = 6001, I_VCMPNGESD = 6014,
    I_VCMPNGTSD = 6025, I_VCMPFALSESD = 6036, I_VCMPNEQ_OQSD = 6049, I_VCMPGESD = 6063,
    I_VCMPGTSD = 6073, I_VCMPTRUESD = 6083, I_VCMPEQ_OSSD = 6095, I_VCMPLT_OQSD = 6108,
    I_VCMPLE_OQSD = 6121, I_VCMPUNORD_SSD = 6134, I_VCMPNEQ_USSD = 6149,
    I_VCMPNLT_UQSD = 6163, I_VCMPNLE_UQSD = 6177, I_VCMPORD_SSD = 6191,
    I_VCMPEQ_USSD = 6204, I_VCMPNGE_UQSD = 6217, I_VCMPNGT_UQSD = 6231,
    I_VCMPFALSE_OSSD = 6245, I_VCMPNEQ_OSSD = 6261, I_VCMPGE_OQSD = 6275,
    I_VCMPGT_OQSD = 6288, I_VCMPTRUE_USSD = 6301, I_PINSRW = 6316, I_VPINSRW = 6324,
    I_PEXTRW = 6333, I_VPEXTRW = 6341, I_SHUFPS = 6350, I_SHUFPD = 6358, I_VSHUFPS = 6366,
    I_VSHUFPD = 6375, I_CMPXCHG8B = 6384, I_CMPXCHG16B = 6395, I_VMPTRST = 6407,
    I_ADDSUBPD = 6416, I_ADDSUBPS = 6426, I_VADDSUBPD = 6436, I_VADDSUBPS = 6447,
    I_PSRLW = 6458, I_VPSRLW = 6465, I_PSRLD = 6473, I_VPSRLD = 6480, I_PSRLQ = 6488,
    I_VPSRLQ = 6495, I_PADDQ = 6503, I_VPADDQ = 6510, I_PMULLW = 6518, I_VPMULLW = 6526,
    I_MOVQ2DQ = 6535, I_MOVDQ2Q = 6544, I_PMOVMSKB = 6553, I_VPMOVMSKB = 6563,
    I_PSUBUSB = 6574, I_VPSUBUSB = 6583, I_PSUBUSW = 6593, I_VPSUBUSW = 6602,
    I_PMINUB = 6612, I_VPMINUB = 6620, I_PAND = 6629, I_VPAND = 6635, I_PADDUSB = 6642,
    I_VPADDUSW = 6651, I_PADDUSW = 6661, I_PMAXUB = 6670, I_VPMAXUB = 6678, I_PANDN = 6687,
    I_VPANDN = 6694, I_PAVGB = 6702, I_VPAVGB = 6709, I_PSRAW = 6717, I_VPSRAW = 6724,
    I_PSRAD = 6732, I_VPSRAD = 6739, I_PAVGW = 6747, I_VPAVGW = 6754, I_PMULHUW = 6762,
    I_VPMULHUW = 6771, I_PMULHW = 6781, I_VPMULHW = 6789, I_CVTTPD2DQ = 6798,
    I_CVTDQ2PD = 6809, I_CVTPD2DQ = 6819, I_VCVTTPD2DQ = 6829, I_VCVTDQ2PD = 6841,
    I_VCVTPD2DQ = 6852, I_MOVNTQ = 6863, I_MOVNTDQ = 6871, I_VMOVNTDQ = 6880,
    I_PSUBSB = 6890, I_VPSUBSB = 6898, I_PSUBSW = 6907, I_VPSUBSW = 6915, I_PMINSW = 6924,
    I_VPMINSW = 6932, I_POR = 6941, I_VPOR = 6946, I_PADDSB = 6952, I_VPADDSB = 6960,
    I_PADDSW = 6969, I_VPADDSW = 6977, I_PMAXSW = 6986, I_VPMAXSW = 6994, I_PXOR = 7003,
    I_VPXOR = 7009, I_LDDQU = 7016, I_VLDDQU = 7023, I_PSLLW = 7031, I_VPSLLW = 7038,
    I_PSLLD = 7046, I_VPSLLD = 7053, I_PSLLQ = 7061, I_VPSLLQ = 7068, I_PMULUDQ = 7076,
    I_VPMULUDQ = 7085, I_PMADDWD = 7095, I_VPMADDWD = 7104, I_PSADBW = 7114,
    I_VPSADBW = 7122, I_MASKMOVQ = 7131, I_MASKMOVDQU = 7141, I_VMASKMOVDQU = 7153,
    I_PSUBB = 7166, I_VPSUBB = 7173, I_PSUBW = 7181, I_VPSUBW = 7188, I_PSUBD = 7196,
    I_VPSUBD = 7203, I_PSUBQ = 7211, I_VPSUBQ = 7218, I_PADDB = 7226, I_VPADDB = 7233,
    I_PADDW = 7241, I_VPADDW = 7248, I_PADDD = 7256, I_VPADDD = 7263, I_FNSTENV = 7271,
    I_FSTENV = 7280, I_FNSTCW = 7288, I_FSTCW = 7296, I_FNCLEX = 7303, I_FCLEX = 7311,
    I_FNINIT = 7318, I_FINIT = 7326, I_FNSAVE = 7333, I_FSAVE = 7341, I_FNSTSW = 7348,
    I_FSTSW = 7356, I_PSHUFB = 7363, I_VPSHUFB = 7371, I_PHADDW = 7380, I_VPHADDW = 7388,
    I_PHADDD = 7397, I_VPHADDD = 7405, I_PHADDSW = 7414, I_VPHADDSW = 7423,
    I_PMADDUBSW = 7433, I_VPMADDUBSW = 7444, I_PHSUBW = 7456, I_VPHSUBW = 7464,
    I_PHSUBD = 7473, I_VPHSUBD = 7481, I_PHSUBSW = 7490, I_VPHSUBSW = 7499, I_PSIGNB = 7509,
    I_VPSIGNB = 7517, I_PSIGNW = 7526, I_VPSIGNW = 7534, I_PSIGND = 7543, I_VPSIGND = 7551,
    I_PMULHRSW = 7560, I_VPMULHRSW = 7570, I_VPERMILPS = 7581, I_VPERMILPD = 7592,
    I_VTESTPS = 7603, I_VTESTPD = 7612, I_PBLENDVB = 7621, I_BLENDVPS = 7631,
    I_BLENDVPD = 7641, I_PTEST = 7651, I_VPTEST = 7658, I_VBROADCASTSS = 7666,
    I_VBROADCASTSD = 7680, I_VBROADCASTF128 = 7694, I_PABSB = 7710, I_VPABSB = 7717,
    I_PABSW = 7725, I_VPABSW = 7732, I_PABSD = 7740, I_VPABSD = 7747, I_PMOVSXBW = 7755,
    I_VPMOVSXBW = 7765, I_PMOVSXBD = 7776, I_VPMOVSXBD = 7786, I_PMOVSXBQ = 7797,
    I_VPMOVSXBQ = 7807, I_PMOVSXWD = 7818, I_VPMOVSXWD = 7828, I_PMOVSXWQ = 7839,
    I_VPMOVSXWQ = 7849, I_PMOVSXDQ = 7860, I_VPMOVSXDQ = 7870, I_PMULDQ = 7881,
    I_VPMULDQ = 7889, I_PCMPEQQ = 7898, I_VPCMPEQQ = 7907, I_MOVNTDQA = 7917,
    I_VMOVNTDQA = 7927, I_PACKUSDW = 7938, I_VPACKUSDW = 7948, I_VMASKMOVPS = 7959,
    I_VMASKMOVPD = 7971, I_PMOVZXBW = 7983, I_VPMOVZXBW = 7993, I_PMOVZXBD = 8004,
    I_VPMOVZXBD = 8014, I_PMOVZXBQ = 8025, I_VPMOVZXBQ = 8035, I_PMOVZXWD = 8046,
    I_VPMOVZXWD = 8056, I_PMOVZXWQ = 8067, I_VPMOVZXWQ = 8077, I_PMOVZXDQ = 8088,
    I_VPMOVZXDQ = 8098, I_PCMPGTQ = 8109, I_VPCMPGTQ = 8118, I_PMINSB = 8128,
    I_VPMINSB = 8136, I_PMINSD = 8145, I_VPMINSD = 8153, I_PMINUW = 8162, I_VPMINUW = 8170,
    I_PMINUD = 8179, I_VPMINUD = 8187, I_PMAXSB = 8196, I_VPMAXSB = 8204, I_PMAXSD = 8213,
    I_VPMAXSD = 8221, I_PMAXUW = 8230, I_VPMAXUW = 8238, I_PMAXUD = 8247, I_VPMAXUD = 8255,
    I_PMULLD = 8264, I_VPMULLD = 8272, I_PHMINPOSUW = 8281, I_VPHMINPOSUW = 8293,
    I_INVEPT = 8306, I_INVVPID = 8314, I_INVPCID = 8323, I_VFMADDSUB132PS = 8332,
    I_VFMADDSUB132PD = 8348, I_VFMSUBADD132PS = 8364, I_VFMSUBADD132PD = 8380,
    I_VFMADD132PS = 8396, I_VFMADD132PD = 8409, I_VFMADD132SS = 8422,
    I_VFMADD132SD = 8435, I_VFMSUB132PS = 8448, I_VFMSUB132PD = 8461,
    I_VFMSUB132SS = 8474, I_VFMSUB132SD = 8487, I_VFNMADD132PS = 8500,
    I_VFNMADD132PD = 8514, I_VFNMADD132SS = 8528, I_VFNMADD132SD = 8542,
    I_VFNMSUB132PS = 8556, I_VFNMSUB132PD = 8570, I_VFNMSUB132SS = 8584,
    I_VFNMSUB132SD = 8598, I_VFMADDSUB213PS = 8612, I_VFMADDSUB213PD = 8628,
    I_VFMSUBADD213PS = 8644, I_VFMSUBADD213PD = 8660, I_VFMADD213PS = 8676,
    I_VFMADD213PD = 8689, I_VFMADD213SS = 8702, I_VFMADD213SD = 8715,
    I_VFMSUB213PS = 8728, I_VFMSUB213PD = 8741, I_VFMSUB213SS = 8754,
    I_VFMSUB213SD = 8767, I_VFNMADD213PS = 8780, I_VFNMADD213PD = 8794,
    I_VFNMADD213SS = 8808, I_VFNMADD213SD = 8822, I_VFNMSUB213PS = 8836,
    I_VFNMSUB213PD = 8850, I_VFNMSUB213SS = 8864, I_VFNMSUB213SD = 8878,
    I_VFMADDSUB231PS = 8892, I_VFMADDSUB231PD = 8908, I_VFMSUBADD231PS = 8924,
    I_VFMSUBADD231PD = 8940, I_VFMADD231PS = 8956, I_VFMADD231PD = 8969,
    I_VFMADD231SS = 8982, I_VFMADD231SD = 8995, I_VFMSUB231PS = 9008,
    I_VFMSUB231PD = 9021, I_VFMSUB231SS = 9034, I_VFMSUB231SD = 9047,
    I_VFNMADD231PS = 9060, I_VFNMADD231PD = 9074, I_VFNMADD231SS = 9088,
    I_VFNMADD231SD = 9102, I_VFNMSUB231PS = 9116, I_VFNMSUB231PD = 9130,
    I_VFNMSUB231SS = 9144, I_VFNMSUB231SD = 9158, I_AESIMC = 9172, I_VAESIMC = 9180,
    I_AESENC = 9189, I_VAESENC = 9197, I_AESENCLAST = 9206, I_VAESENCLAST = 9218,
    I_AESDEC = 9231, I_VAESDEC = 9239, I_AESDECLAST = 9248, I_VAESDECLAST = 9260,
    I_MOVBE = 9273, I_CRC32 = 9280, I_VPERM2F128 = 9287, I_ROUNDPS = 9299,
    I_VROUNDPS = 9308, I_ROUNDPD = 9318, I_VROUNDPD = 9327, I_ROUNDSS = 9337,
    I_VROUNDSS = 9346, I_ROUNDSD = 9356, I_VROUNDSD = 9365, I_BLENDPS = 9375,
    I_VBLENDPS = 9384, I_BLENDPD = 9394, I_VBLENDPD = 9403, I_PBLENDW = 9413,
    I_VPBLENDW = 9422, I_PALIGNR = 9432, I_VPALIGNR = 9441, I_PEXTRB = 9451,
    I_VPEXTRB = 9459, I_PEXTRD = 9468, I_PEXTRQ = 9476, I_VPEXTRD = 9484, I_VPEXTRQ = 9493,
    I_EXTRACTPS = 9502, I_VEXTRACTPS = 9513, I_VINSERTF128 = 9525, I_VEXTRACTF128 = 9538,
    I_PINSRB = 9552, I_VPINSRB = 9560, I_INSERTPS = 9569, I_VINSERTPS = 9579,
    I_PINSRD = 9590, I_PINSRQ = 9598, I_VPINSRD = 9606, I_VPINSRQ = 9615, I_DPPS = 9624,
    I_VDPPS = 9630, I_DPPD = 9637, I_VDPPD = 9643, I_MPSADBW = 9650, I_VMPSADBW = 9659,
    I_PCLMULQDQ = 9669, I_VPCLMULQDQ = 9680, I_VBLENDVPS = 9692, I_VBLENDVPD = 9703,
    I_VPBLENDVB = 9714, I_PCMPESTRM = 9725, I_VPCMPESTRM = 9736, I_PCMPESTRI = 9748,
    I_VPCMPESTRI = 9759, I_PCMPISTRM = 9771, I_VPCMPISTRM = 9782, I_PCMPISTRI = 9794,
    I_VPCMPISTRI = 9805, I_AESKEYGENASSIST = 9817, I_VAESKEYGENASSIST = 9834,
    I_PSRLDQ = 9852, I_VPSRLDQ = 9860, I_PSLLDQ = 9869, I_VPSLLDQ = 9877, I_FXSAVE = 9886,
    I_FXSAVE64 = 9894, I_RDFSBASE = 9904, I_FXRSTOR = 9914, I_FXRSTOR64 = 9923,
    I_RDGSBASE = 9934, I_LDMXCSR = 9944, I_WRFSBASE = 9953, I_VLDMXCSR = 9963,
    I_STMXCSR = 9973, I_WRGSBASE = 9982, I_VSTMXCSR = 9992, I_VMPTRLD = 10002,
    I_VMCLEAR = 10011, I_VMXON = 10020, I_MOVSXD = 10027, I_PAUSE = 10035, I_WAIT = 10042,
    I_RDRAND = 10048, I_3DNOW = 10056

  RegisterType* = enum
    R_RAX, R_RCX, R_RDX, R_RBX, R_RSP, R_RBP, R_RSI, R_RDI, R_R8, R_R9, R_R10, R_R11, R_R12,
    R_R13, R_R14, R_R15, R_EAX, R_ECX, R_EDX, R_EBX, R_ESP, R_EBP, R_ESI, R_EDI, R_R8D,
    R_R9D, R_R10D, R_R11D, R_R12D, R_R13D, R_R14D, R_R15D, R_AX, R_CX, R_DX, R_BX, R_SP,
    R_BP, R_SI, R_DI, R_R8W, R_R9W, R_R10W, R_R11W, R_R12W, R_R13W, R_R14W, R_R15W, R_AL,
    R_CL, R_DL, R_BL, R_AH, R_CH, R_DH, R_BH, R_R8B, R_R9B, R_R10B, R_R11B, R_R12B, R_R13B,
    R_R14B, R_R15B, R_SPL, R_BPL, R_SIL, R_DIL, R_ES, R_CS, R_SS, R_DS, R_FS, R_GS, R_RIP,
    R_ST0, R_ST1, R_ST2, R_ST3, R_ST4, R_ST5, R_ST6, R_ST7, R_MM0, R_MM1, R_MM2, R_MM3,
    R_MM4, R_MM5, R_MM6, R_MM7, R_XMM0, R_XMM1, R_XMM2, R_XMM3, R_XMM4, R_XMM5, R_XMM6,
    R_XMM7, R_XMM8, R_XMM9, R_XMM10, R_XMM11, R_XMM12, R_XMM13, R_XMM14, R_XMM15, R_YMM0,
    R_YMM1, R_YMM2, R_YMM3, R_YMM4, R_YMM5, R_YMM6, R_YMM7, R_YMM8, R_YMM9, R_YMM10,
    R_YMM11, R_YMM12, R_YMM13, R_YMM14, R_YMM15, R_CR0, R_UNUSED0, R_CR2, R_CR3, R_CR4,
    R_UNUSED1, R_UNUSED2, R_UNUSED3, R_CR8, R_DR0, R_DR1, R_DR2, R_DR3, R_UNUSED4,
    R_UNUSED5, R_DR6, R_DR7


