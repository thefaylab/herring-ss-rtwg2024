#V3.30.10.02-safe;_2018_02_02;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_data_and_control_files: nocatch_dat.ss // nocatch_ctl.ss
#V3.30.10.02-safe;_2018_02_02;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
2  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity #AAG interaction parameter specification unclear
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
2 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 1 
 2 1 2 1
#
4 #_Cond 0 # N_movement_definitions goes here if Nareas > 1
3 #0.5 #1.5 #_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
# #_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
1 1 2 1 3 17
1 2 1 2 3 17
2 1 1 2 3 17
2 2 2 1 3 17
#
2 #2 #_Nblock_Patterns
2 1 #_blocks_per_pattern 
# begin and end years of blocks
1985 2008
2009 2017
1993 2017
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex #AAG 
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
# 
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0.75 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 0.21 0.86 0.93 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1
0 0.21 0.86 0.93 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 -15	15	0.3	-1	-1	-1	-1	0	0	0	0	0	0	0	#	NatM_p_1_Fem_GP_1
1	25	9.55062	-1	-1	-1	3	0	0	0	0	0	0	0	#	L_at_Amin_Fem_GP_1
#18	47	31.1163	-1	-1	-1	4	0	0	0	0	0	-2	0	#	L_at_Amax_Fem_GP_1
18	47	31.1163	-1	-1	-1	3	0	0	0	0	0	2	2	#	L_at_Amax_Fem_GP_1
0.01	2.3	0.53984	-1	-1	-1	4	0	0	0	0	0	0	0	#	VonBert_K_Fem_GP_1
0	5	3.16291	-1	-1	-1	5	0	0	0	0	0	0	0	#	CV_young_Fem_GP_1
0	4	0.910216	-1	-1	-1	5	0	0	0	0	0	0	0	#	CV_old_Fem_GP_1
-3	3	5.70E-06	-1	0.8	-1	-1	0	0	0	0	0	0	0	#	Wtlen_1_Fem
-3	4	3.27227	-1	1	-1	-1	0	0	0	0	0	0	0	#	Wtlen_2_Fem
2	60	15	55	0.8	-1	-4	0	0	0	0	0	0	0	#	Mat50%_Fem
-3	3	-0.25	-0.25	0.8	-1	-1	0	0	0	0	0	0	0	#	Mat_slope_Fem
-3	3	1	1	0.8	-1	-3	0	0	0	0	0	0	0	#	Eggs/kg_inter_Fem
-3	3	0	0	0.8	-1	-3	0	0	0	0	0	0	0	#	Eggs/kg_slope_wt_Fem
-15	15	0.3	-1	-1	-1	-1	0	0	0	0	0	0	0	#	NatM_p_1_Fem_GP_2
1	25	13.6344	-1	-1	-1	3	0	0	0	0	0	0	0	#	L_at_Amin_Fem_GP_2
#18	47	32.7838	-1	-1	-1	4	0	0	0	0	0	-2	0	#	L_at_Amax_Fem_GP_2
18	47	32.7838	-1	-1	-1	3	0	0	0	0	0	2	2	#	L_at_Amax_Fem_GP_2
0.01	2.3	0.411623	-1	-1	-1      4	0	0	0	0	0	0	0	#	VonBert_K_Fem_GP_2
0	5	1.97692	-1	-1	-1	5	0	0	0	0	0	0	0	#	CV_young_Fem_GP_2
0	4	1.20628	-1	-1	-1	5	0	0	0	0	0	0	0	#	CV_old_Fem_GP_2
-3	3	5.70E-06	-1	0.8	-1	-1	0	0	0	0	0	0	0	#	Wtlen_1_Fem
-3	4	3.27227	-1	1	-1	-1	0	0	0	0	0	0	0	#	Wtlen_2_Fem
2	60	15	55	0.8	-1	-4	0	0	0	0	0	0	0	#	Mat50%_Fem
-3	3	-0.25	-0.25	0.8	-1	-1	0	0	0	0	0	0	0	#	Mat_slope_Fem
-3	3	1	1	0.8	-1	-3	0	0	0	0	0	0	0	#	Eggs/kg_inter_Fem
-3	3	0	0	0.8	-1	-3	0	0	0	0	0	0	0	#	Eggs/kg_slope_wt_Fem
-4	4	0	0	99	-1	-4	0	0	0	0	0	0	0	#	RecrDist_GP_1
-4	4	0	0	99	-1	6	0	2	1965	2015	7	0	0	#	RecrDist_GP_2
#-4	4	0	0	99	-1	2	0	0   0   0   0	0	0	#	RecrDist_GP_2
-4	4	0	0	99	-1	-4	0	0	0	0	0	0	0	#	RecrDist_Area_1
-4	4	0	0	99	-1	-4	0	0	0	0	0	0	0	#	RecrDist_Area_2
-4	4	0	0	99	-1	-4	0	0	0	0	0	0	0	#	RecrDist_Seas_2
#-4	4	4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_Seas_2 #AAG not reading in 2 seasons?
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_1_seas_1_area_1
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_1_seas_1_area_2
#-4	4	3.15062	0	0	-1	6	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_1_seas_2_area_1
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_1_seas_2_area_2
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_2_seas_1_area_1
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_2_seas_1_area_2
#-4	4	-4	0	0	-1	-4	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_2_seas_2_area_1
#-4	4	3.14684	0	0	-1	-6	0	0	0	0	0	0	0	#	RecrDist_interaction_GP_2_seas_2_area_2
0.2	2	1	0	0	-1	-4	0	0	0	0	0	0	0	#	CohortGrowDev
-15	15	15	0	99	-1	-5	0	0	0	0	0	0	0	#	MoveParm_A_seas_1_GP_1from_2to_1
-15	15	15	0	99	-1	-6	0	0	0	0	0	0	0	#	MoveParm_B_seas_1_GP_1from_2to_1
-15	15	15	0	99	-1	-5	0	0	0	0	0	0	0	#	MoveParm_A_seas_1_GP_2from_1to_2
-15	15	15	0	99	-1	-7	0	0	0	0	0	0	0	#	MoveParm_B_seas_1_GP_2from_1to_2
-15	15	-0.192659	0	99	-1	3	0	0	0	0	0	0	0	#	MoveParm_A_seas_2_GP_1from_1to_2
#-15	15	-15	0	99	-1	-4	0	0	0	0	0	0	0	#	MoveParm_B_seas_2_GP_1from_1to_2
-15	15	-0.568062	0	99	-1	4	0	0	0	0	0	0	0	#	MoveParm_B_seas_2_GP_1from_1to_2
-15	15	0	0	99	-1	3	0	0	0	0	0	0	0	#	MoveParm_A_seas_2_GP_2from_2to_1
-15	15	0	0	99	-1	4	0	0	0	0	0	0	0	#	MoveParm_B_seas_2_GP_2from_2to_1
#-15	15	-15	0	99	-1	-4	0	0	0	0	0	0	0	#	MoveParm_B_seas_2_GP_2from_2to_1
0.001	0.999	0.5	0.5	-1	-1	-1	0	0	0	0	0	0	0	#	FracFemale_GP_1 #AAG guess
0.001	0.999	0.5	0.5	-1	-1	-1	0	0	0	0	0	0	0	#	FracFemale_GP_2 #AAG guess
#
#_no timevary MG parameters was #_MGtrend_&_cycle_parms #AAG unclear if this goes here
18 47 28.1651 -1 99 -1 3 # L_at_Amax_Fem_GP_1_TrendFinal_ #AAG; where should this be used?
#1981 2010 1991.92 -1 99 -1 5 # L_at_Amax_Fem_GP_1_TrendInfl_ #AAG  
#0.0001 20 1.59095 -1 99 -1 5 # L_at_Amax_Fem_GP_1_TrendWidth_ #AAG

18 47 29.248 -1 99 -1 3 # L_at_Amax_Fem_GP_2_TrendFinal_ #AAG
#1981 2010 1993 -1 99 -1 5 # L_at_Amax_Fem_GP_2_TrendInfl_ #AAG
#0.0001 20 1.14 -1 99 1  5 # L_at_Amax_Fem_GP_2_TrendWidth_ #AAG


0.01 2.0 0.5 0 99 -1 -7 #for time vary recruit apport se
0 1 0 0 99 -1 -7 #for time vary recruit apport autocorr
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
1  # 0/1 to use steepness in initial equ recruitment calculation #AAG?
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_LO   HI  INIT   PRIOR  PR_SD  PR_type  PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
10		25	18	    0	0	0	1	0	0	0	0	0	0	0	#	SR_LN(R0)
0.2		1	0.565047	0	0	0	-7	0	0	0	0	0	0	0	#	SR_SCAA_null
0.01	3	0.8	       0.65	3	0.2	-8	0	0	0	0	0	0	0	#	SR_sigmaR
-5		5	0	0	0	0	-1	0	0	0	0	0	0	0	#	SR_regime
-99		99	0	0	0	0	-1	0	0	0	0	0	0	0	#	SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1965 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase 
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
-4 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1000 #_lambda for Fcast_recr_like occurring before endyr+1
 1900 #_last_early_yr_nobias_adj_in_MPD
 1900 #_first_yr_fullbias_adj_in_MPD
2018 # 2001 #_last_yr_fullbias_adj_in_MPD
2019 # 2002 #_first_recent_yr_nobias_adj_in_MPD
 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.8 # F ballpark
-1 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
8 # N iterations for tuning F in hybrid method (recommend 3 to 7) # AAG changed to 8
#_initial_F_parms; count = 0
# GF Initial F's are by fleet but by season, i.e. all season 1, then all season 2
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE

1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom

#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom

#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
##1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.0001 0.05 0.5 0 -1 # InitF_1MobS1mixgom
#1e-005 3 0.05 0.05 0.5 0 1 # InitF_1MobS1mixgom


# F rates by fleet
# Yr:  1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# FISHERY 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#_Q_setup for fleets with cpue or survey data
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
#1	1	0	0	0	0	#	fleet	#AAG link and names? #No random walk option so commented out 211/212
#2	1	0	0	0	0	#	fleet	
#3	1	0	0	0	0	#	fleet	
#4	1	0	0	0	0	#	fleet	
#5	1	0	0	0	0	#	fleet	
#6	1	0	0	0	0	#	fleet	
#7	1	0	0	0	0	#	fleet	
#8	1	0	0	0	0	#	fleet	
9	1	0	0	0	0	#	survey	
10	1	0	0	0	0	#	survey	
11	1	0	0	0	0	#	survey	
12	1	0	0	0	0	#	survey	
13	1	0	0	0	0	#	survey	
14	1	0	0	0	0	#	survey	
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
-17    5      0     0    1    0    1     0     0     0     0    0     1    2  #  LnQ_base_SURVEY1(2)
-17    5      0     0    1    0    1     0     0     0     0    0     1    2  #  LnQ_base_SURVEY1(2)
-17    5      0     0    1    0    1     0     0     0     0    0     1    2  #  LnQ_base_SURVEY1(2)
-17    5      0     0    1    0    1     0     0     0     0    0     1    2  #  LnQ_base_SURVEY1(2)
-17    5      0     0    1    0    1     0     0     0     0    0     0    0  #  LnQ_base_SURVEY1(2)
-17    5      0     0    1    0    1     0     0     0     0    0     0    0  #  LnQ_base_SURVEY1(2)

#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
24 0 0 0
24 0 0 0
#24 0 0 0
#24 0 0 0
#9 0 0 0
#5 0 0 1
1 0 0 0
#1 0 0 0
5 0 0 3
5 0 0 1
5 0 0 2
#24 0 0 0
#24 0 0 0
#1 0 0 0
1 0 0 0
5 0 0 7

24 0 0 0
24 0 0 0
#24 0 0 0
#24 0 0 0
1 0 0 0
1 0 0 0
#24 0 0 0
1 0 0 0
1 0 0 0

#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 10 0 0 0 # 1 MobS1mixgom
 10 0 0 0 # 2 MobS1mixgb
 10 0 0 0 # 3 FixedS1mixgom
 10 0 0 0 # 4 MobS2gom
 10 0 0 0 # 5 MobS2gb
 10 0 0 0 # 6 FixedS2gom
 10 0 0 0 # placeholder # AAG
 10 0 0 0 # placeholder # AAG
 10 0 0 0 # 7 SprAllmixgom
 10 0 0 0 # 8 SprAllmixgb
 10 0 0 0 # 9 FallAllgom
 10 0 0 0 # 10 FallAllgb
 10 0 0 0 # 11 Shrimpmix
 10 0 0 0 # 11 Shrimpmix

#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
 
# Fleets

#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name

5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   

5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   


#           -10            35             5            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMFIXED1(1)
#            -9             15       3.96883            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMFIXED1(1)
#           -10            35            15            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMFIXED1(1)
#            -9             15       3.96883            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMFIXED1(1)
#           -10            35             2            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMFIXED1(1)
#            -9             15             0            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMFIXED1(1)

#           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMFIXED2(2)
#            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMFIXED2(2)


           -10            35       19.8575            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMMOBILE1(3)
             0             15       5.49468            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMMOBILE1(3)
#           -10            35       19.8575            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMMOBILE1(3)
#             0             15       5.49468            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMMOBILE1(3)
           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMMOBILE2(4)
            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMMOBILE2(4)

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   
            
           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_OTHERFIXED2(6)
            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_OTHERFIXED2(6)
           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_OTHERFIXED2(6)
            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_OTHERFIXED2(6)
            
#           -10            35       19.9999            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_OTHERMOBILE1(7)
#             0             15       3.16861            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_OTHERMOBILE1(7)
           -10            35       19.9999            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_OTHERMOBILE1(7)
             0             15       3.16861            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_OTHERMOBILE1(7)
#           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_OTHERMOBILE2(8)
#            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_OTHERMOBILE2(8)

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -9    -1 -1 -1      3      0  0  0  0  0  0  0   

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -9    -1 -1 -1      3      0  0  0  0  0  0  0   
           -10            35           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P1_GOFMFIXED2(2)
            -9             15           -99            -1            -1            -1         -2          0          0          0          0          0          0          0  #  SizeSel_P2_GOFMFIXED2(2)



5      35     15      -1 -1 -1      2   0  0  0  0  0  1  2    #74
-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  1  2  
0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  1  2  
0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  1  2  
-10 10     -9    -1 -1 -1     3      0  0  0  0  0  1  2 
-10     10     -9    -1 -1 -1      3      0  0  0  0  0  1  2   

5      35     15      -1 -1 -1      2   0  0  0  0  0  1  2    #74
-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  1  2  
0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  1  2  
0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  1  2  
-10 10     -9    -1 -1 -1     3      0  0  0  0  0  1  2 
-10     10     -9    -1 -1 -1      3      0  0  0  0  0  1  2   

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   


            
#           -10            35        14.822            -1            -1            -1          2          0          0          0          0          0          0          0 #  SizeSel_P1_SpringGOM(9)
#             0             15    0.00154879            -1            -1            -1          2          0          0          0          0          0          0          0 #  SizeSel_P2_SpringGOM(9)
#           -10            35       6.85177            -1            -1            -1          2          0          0          0          0          0          0          0 #  SizeSel_P1_SpringGB(10)
#             0             15    0.00881627            -1            -1            -1          2          0          0          0          0          0          0          0 #  SizeSel_P2_SpringGB(10)
           -10            35          19.5            -1            -1            -1          2          0          0          0          0          0  1 2 #  SizeSel_P1_FallGOM(11)
             0             15    2.3935e-06            -1            -1            -1          2          0          0          0          0          0          1          2 #  SizeSel_P2_FallGOM(11)
           -10            35       17.9357            -1            -1            -1          2          0          0          0          0          0          1          2 #  SizeSel_P1_FAllGB(12)
             0             15    0.00276881            -1            -1            -1          2          0          0          0          0          0          1          2 #  SizeSel_P2_FAllGB(12)
           -10            35       19.9996            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_Shrimp(GOM)(13)
             0             15         0.008            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_Shrimp(GOM)(13)

#5      35     15      -1 -1 -1      2   0  0  0  0  0  0  0    #74
#-10     4.0     -2.0    -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.1     -1 -1 -1      2   0  0  0  0  0  0  0  
#0.01    9       5.9     -1 -1 -1     2   0  0  0  0  0  0  0  
#-10 10     -999    -1 -1 -1     -2      0  0  0  0  0  0  0 
#-10     10     -999    -1 -1 -1      -3      0  0  0  0  0  0  0   


           -10            35       19.9996            -1            -1            -1          4          0          0          0          0          0          0          0  #  SizeSel_P1_Shrimp(GOM)(13)
            0             15         0.008            -1            -1            -1          4          0          0          0          0          0          0          0  #  SizeSel_P2_Shrimp(GOM)(13)




#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
#
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#1 12 1.4
#4 1 0.41
#4 2 0.2
#4 3 0.6
#4 4 0.36
#4 5 5
#4 7 0.85
#4 8 1.2
#4 9 0.2
#4 10 0.16
#4 11 0.16
#4 12 0.06
#4 13 0.56
#4 14 0.2
#5 1 0.05
#5 2 0.02
#5 3 0.05
#5 4 0.02
#5 5 1.8
#5 7 0.0002
#5 8 0.002
#5 9 0.02
#5 10 0.0002
#5 11 0.004
#5 12 0.002
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
3 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
#0 # read 3 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
#9 1 1 0 1
#9 2 1 0 1
#9 3 1 0 1
#9 4 1 0 1
#9 5 1 0 1
#9 6 1 0 1
#9 7 1 0 1
#9 8 1 0 1
1 14 1 1 1
4 14 1 1 1
4 1 1 1 1
4 2 1 1 1
4 3 1 1 1
4 4 1 1 1
4 5 1 1 1
4 6 1 1 1
4 7 1 1 1
4 8 1 1 1
4 9 1 1 1
4 10 1 1 1
4 11 1 1 1
4 12 1 1 1
4 13 1 1 1
#4 1 1 0.1 1
#4 2 1 0.1 1
#4 3 1 0.1 1
#4 4 1 0.1 1
#4 5 1 0.1 1
#4 6 1 0.1 1
#4 7 1 0.1 1
#4 8 1 0.1 1
#4 9 1 0.1 1
#4 10 1 0.1 1
#4 11 1 0.1 1
#4 12 1 0.1 1
#4 13 1 0.1 1
#5 1 1 0.1 1
#5 2 1 0.1 1
#5 3 1 0.1 1
#5 4 1 0.1 1
#5 5 1 0.1 1
#5 6 1 0.1 1
#5 7 1 0.1 1
#5 8 1 0.1 1
#5 9 1 0.1 1
#5 10 1 0.1 1
#5 11 1 0.1 1
#5 12 1 0.1 1
#5 13 1 0.1 1
5 1 1 0.01 1
5 2 1 0.01 1
5 3 1 0.01 1
5 4 1 0.01 1
5 5 1 0.01 1
5 6 1 0.01 1
5 7 1 0.01 1
5 8 1 0.01 1
5 9 1 0.01 1
5 10 1 0.01 1
5 11 1 0.01 1
5 12 1 0.01 1
5 13 1 0.01 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  1 1 1 1 #_CPUE/survey:_2
#  0 0 0 0 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  0 0 0 0 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_size-age:_1
#  1 1 1 1 #_size-age:_2
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999



# old variance adjustment values. GF 3/14/2018
1	1	0	#surveyCV1
1	2	0	#surveyCV2
1	3	0	#surveyCV3
1	4	0	#surveyCV4
1	5	0	#surveyCV5
1	6	0	#surveyCV6
1	7	0	#surveyCV7
1	8	0	#surveyCV8
1	9	0	#surveyCV9
1	10	0	#surveyCV10
1	11	0	#surveyCV11
1	12	0	#surveyCV12
1	13	0	#surveyCV13
2	1	0	#discardstd_dev1
2	2	0	#discardstd_dev2
2	3	0	#discardstd_dev3
2	4	0	#discardstd_dev4
2	5	0	#discardstd_dev5
2	6	0	#discardstd_dev6
2	7	0	#discardstd_dev7
2	8	0	#discardstd_dev8
2	9	0	#discardstd_dev9
2	10	0	#discardstd_dev10
2	11	0	#discardstd_dev11
2	12	0	#discardstd_dev12
2	13	0	#discardstd_dev13
3	1	0	#add_to_bodywt_CV1
3	2	0	#add_to_bodywt_CV2
3	3	0	#add_to_bodywt_CV3
3	4	0	#add_to_bodywt_CV4
3	5	0	#add_to_bodywt_CV5
3	6	0	#add_to_bodywt_CV6
3	7	0	#add_to_bodywt_CV7
3	8	0	#add_to_bodywt_CV8
3	9	0	#add_to_bodywt_CV9
3	10	0	#add_to_bodywt_CV10
3	11	0	#add_to_bodywt_CV11
3	12	0	#add_to_bodywt_CV12
3	13	0	#add_to_bodywt_CV13
4	1	0.57	#mult_bylencomp1
4	2	0.74	#mult_bylencomp2
4	3	0.56	#mult_bylencomp3
4	4	0.42	#mult_bylencomp4
4	5	0.67	#mult_bylencomp5
4	6	0.33	#mult_bylencomp6
4	7	0	#mult_bylencomp7#AAG
4	8	0	#mult_bylencomp8
4	9	0.15	#mult_bylencomp9
4	10	0.14	#mult_bylencomp10
4	11	0.16	#mult_bylencomp11
4	12	0.05	#mult_bylencomp12
4	13	0.58	#mult_bylencomp13
5	1	0.07	#mult_byagecomp1
5	2	0.03	#mult_byagecomp2
5	3	0.04	#mult_byagecomp3
5	4	0.02	#mult_byagecomp4
5	5	0.02	#mult_byagecomp5
5	6	0.02	#mult_byagecomp6
5	7	0	#mult_byagecomp7#AAG
5	8	0	#mult_byagecomp8
5	9	0.04	#mult_byagecomp9
5	10	0.03	#mult_byagecomp10
5	11	0.02	#mult_byagecomp11
5	12	0.02	#mult_byagecomp12
5	13	0	#mult_byagecomp13
6	1	1	#mult_by_sizeatage1
6	2	1	#mult_by_sizeatage2
6	3	1	#mult_by_sizeatage3
6	4	1	#mult_by_sizeatage4
6	5	1	#mult_by_sizeatage5
6	6	1	#mult_by_sizeatage6
6	7	1	#mult_by_sizeatage7#AAG
6	8	1	#mult_by_sizeatage8
6	9	1	#mult_by_sizeatage9
6	10	1	#mult_by_sizeatage10
6	11	1	#mult_by_sizeatage11
6	12	1	#mult_by_sizeatage12
6	13	1	#mult_by_sizeatage13

### dbl normal selex5.5 34.5 27.1402 -1 -1 -1 3 0 0 0 0 0 0 0 # SizeSel_1P_1_MobS1mixgom
 -10 20 3 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_1P_2_MobS1mixgom
 -9 9 4.46395 -1 -1 -1 3 0 0 0 0 0 0 0 # SizeSel_1P_3_MobS1mixgom
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_1P_4_MobS1mixgom
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_1P_5_MobS1mixgom
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_1P_6_MobS1mixgom
 5.5 34.5 24.837 -1 -1 -1 7 0 0 0 0 0 0 0 # SizeSel_2P_1_MobS1mixgb
 -10 20 3 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_2P_2_MobS1mixgb
 -9 9 3.28169 -1 -1 -1 7 0 0 0 0 0 0 0 # SizeSel_2P_3_MobS1mixgb
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_2P_4_MobS1mixgb
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_2P_5_MobS1mixgb
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_2P_6_MobS1mixgb
 5.5 34.5 15.1048 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_3P_1_FixedS1mixgom
 -15 5 -11.6 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_3P_2_FixedS1mixgom
 -9 9 3.31757 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_3P_3_FixedS1mixgom
 -9 15 1.6427 -1 -1 -1 7 0 0 0 0 0 0 0 # SizeSel_3P_4_FixedS1mixgom
 -9 9 -999 -1 -1 -1 -5 0 0 0 0 0 0 0 # SizeSel_3P_5_FixedS1mixgom
 -9 9 -3.03118 -1 -1 -1 7 0 0 0 0 0 0 0 # SizeSel_3P_6_FixedS1mixgom
 5.5 37.5 24.5434 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_4P_1_MobS2gom
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_4P_2_MobS2gom
 -9 9 3.5687 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_4P_3_MobS2gom
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_4P_4_MobS2gom
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_4P_5_MobS2gom
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_4P_6_MobS2gom
 5.5 37.5 23.7689 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_5P_1_MobS2gb
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_5P_2_MobS2gb
 -9 9 2.50423 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_5P_3_MobS2gb
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_5P_4_MobS2gb
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_5P_5_MobS2gb
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_5P_6_MobS2gb
 5.5 34.5 17.2639 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_1_FixedS2gom
 -15 5 -11.6 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_6P_2_FixedS2gom
 -9 9 3.11605 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_3_FixedS2gom
 -9 15 2.19691 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_4_FixedS2gom
 -9 9 -999 -1 -1 -1 -5 0 0 0 0 0 0 0 # SizeSel_6P_5_FixedS2gom
 -9 9 -1.65133 -1 -1 -1 5 0 0 0 0 0 0 0 # SizeSel_6P_6_FixedS2gom
 5.5 34.5 17.2639 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_1_placeholder #AAG
 -15 5 -11.6 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_6P_2_placeholder
 -9 9 3.11605 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_3_placeholder
 -9 15 2.19691 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_4_placeholder
 -9 9 -999 -1 -1 -1 -5 0 0 0 0 0 0 0 # SizeSel_6P_5_placeholder
 -9 9 -1.65133 -1 -1 -1 5 0 0 0 0 0 0 0 # SizeSel_6P_6_placeholder
 5.5 34.5 17.2639 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_1_placeholder2
 -15 5 -11.6 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_6P_2_placeholder2
 -9 9 3.11605 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_3_placeholder2
 -9 15 2.19691 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_6P_4_placeholder2
 -9 9 -999 -1 -1 -1 -5 0 0 0 0 0 0 0 # SizeSel_6P_5_placeholder2
 -9 9 -1.65133 -1 -1 -1 5 0 0 0 0 0 0 0 # SizeSel_6P_6_placeholder2
 5.5 34.5 8.9795 -1 -1 -1 3 0 0 0 0 0 0 0 # SizeSel_7P_1_SprAllmixgom
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_7P_2_SprAllmixgom
 -9 9 -8.99688 -1 -1 -1 3 0 0 0 0 0 0 0 # SizeSel_7P_3_SprAllmixgom
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_7P_4_SprAllmixgom
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_7P_5_SprAllmixgom
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_7P_6_SprAllmixgom
 5.5 34.5 26.1977 -1 -1 -1 7 0 0 0 0 0 0 0 # SizeSel_8P_1_SprAllmixgb
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_8P_2_SprAllmixgb
 -9 9 4.21016 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_8P_3_SprAllmixgb
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_8P_4_SprAllmixgb
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_8P_5_SprAllmixgb
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_8P_6_SprAllmixgb
 5.5 38.5 38.2213 -1 -1 -1 -8 0 0 0 0 0 0 0 # SizeSel_9P_1_FallAllgom
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_9P_2_FallAllgom
 -9 9 4.99108 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_9P_3_FallAllgom
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_9P_4_FallAllgom
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_9P_5_FallAllgom
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_9P_6_FallAllgom
 5.5 38.5 38.4961 -1 -1 -1 -8 0 0 0 0 0 0 0 # SizeSel_10P_1_FallAllgb
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_10P_2_FallAllgb
 -9 9 5.33655 -1 -1 -1 8 0 0 0 0 0 0 0 # SizeSel_10P_3_FallAllgb
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_10P_4_FallAllgb
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_10P_5_FallAllgb
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_10P_6_FallAllgb
 5.5 34.5 32.2596 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_11P_1_Shrimpmix
 -10 20 0 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_11P_2_Shrimpmix
 -9 9 4.00116 -1 -1 -1 6 0 0 0 0 0 0 0 # SizeSel_11P_3_Shrimpmix
 -9 20 15 -1 -1 -1 -4 0 0 0 0 0 0 0 # SizeSel_11P_4_Shrimpmix
 -9 9 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_11P_5_Shrimpmix
 -9 30 -999 -1 -1 -1 -7 0 0 0 0 0 0 0 # SizeSel_11P_6_Shrimpmix


 24 0 0 0 # 1 MobS1mixgom
 24 0 0 0 # 2 MobS1mixgb
 24 0 0 0 # 3 FixedS1mixgom
 24 0 0 0 # 4 MobS2gom
 24 0 0 0 # 5 MobS2gb
 24 0 0 0 # 6 FixedS2gom
 24 0 0 0 # placeholder #AAG
 24 0 0 0 # placeholder #AAG
 24 0 0 0 # 7 SprAllmixgom
 24 0 0 0 # 8 SprAllmixgb
 24 0 0 0 # 9 FallAllgom
 24 0 0 0 # 10 FallAllgb
 24 0 0 0 # 11 Shrimpmix



           -10            35        14.822            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P1_SpringGOM(9)
             0             15    0.00154879            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P2_SpringGOM(9)
           -10            35       6.85177            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P1_SpringGB(10)
             0             15    0.00881627            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P2_SpringGB(10)
           -10            35          19.5            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P1_FallGOM(11)
             0             15    2.3935e-06            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P2_FallGOM(11)
           -10            35       17.9357            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P1_FAllGB(12)
             0             15    0.00276881            -1            -1            -1          2          0          0          0          0          0          1          2  #  SizeSel_P2_FAllGB(12)
           -10            35       19.9996            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P1_Shrimp(GOM)(13)
             0             15         0.008            -1            -1            -1          2          0          0          0          0          0          0          0  #  SizeSel_P2_Shrimp(GOM)(13)
