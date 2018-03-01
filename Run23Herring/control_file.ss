#V3.24Y
#_data_and_control_files: data_file.ss // control_file.ss
#_SS-V3.24Y-safe;_08/27/2015;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.1x64
2  #_N_Growth_Patterns
1 #_N_Morphs_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 #  number of recruitment assignments (overrides GP*area*seas parameter values) 
1 # recruitment interaction requested
#GP seas area for each recruitment assignment
 1 2 1
 2 2 2
#

4 #_N_movement_definitions
1.5 # first age that moves (real age at begin of season, not integer)
# seas,GP,source_area,dest_area,minage,maxage
 1 1 2 1 2 15
 1 2 1 2 2 15
 2 1 1 2 2 15
 2 2 2 1 2 15
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
0.5 #_fracfemale 
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented
1.5 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
2 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity by GP; 4=read age-fecundity by GP; 5=read fec and wt from wtatage.ss; 6=read length-maturity by GP
#_Age_Maturity by growth pattern for females
 0 0.21 0.86 0.93 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1
 0 0.21 0.86 0.93 0.98 1 1 1 1 1 1 1 1 1 1 1 1 1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
1 #_env/block/dev_adjust_method (1=standard; 2=logistic transform keeps in base parm bounds; 3=standard w/ no bound check)
#
#_growth_parms
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 -15 15 0.3 -1 -1 -1 -1 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
 1 25 9.55062 -1 -1 -1 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 18 47 31.1163 -1 -1 -1 7 0 0 0 0 0 -2 0 # L_at_Amax_Fem_GP_1
 0.01 2.3 0.53984 -1 -1 -1 5 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0 5 3.16291 -1 -1 -1 7 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.5 4 0.910216 -1 -1 -1 8 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 -15 15 0.3 -1 -1 -1 -1 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_2
 1 25 13.6344 -1 -1 -1 3 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_2
 18 47 32.7838 -1 -1 -1 7 0 0 0 0 0 -2 0 # L_at_Amax_Fem_GP_2
 0.01 2.3 0.411623 -1 -1 -1 5 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_2
 0 5 1.97692 -1 -1 -1 7 0 0 0 0 0 0 0 # CV_young_Fem_GP_2
 0.5 4 1.20628 -1 -1 -1 8 0 0 0 0 0 0 0 # CV_old_Fem_GP_2
 -3 3 5.7e-006 -1 -1 0.8 -1 0 0 0 0 0 0 0 # Wtlen_1_Fem
 -3 4 3.27227 -1 -1 1 -1 0 0 0 0 0 0 0 # Wtlen_2_Fem
 2 60 15 55 -1 0.8 -4 0 0 0 0 0 0 0 # Mat50%_Fem
 -3 3 -0.25 -0.25 -1 0.8 -1 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 1 1 -1 0.8 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
 -3 3 0 0 -1 0.8 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
 -4 4 -4 0 -1 99 -4 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 -4 0 -1 99 -4 0 0 0 0 0 0 0 # RecrDist_GP_2
 -4 4 -4 0 -1 99 -4 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 -4 0 -1 99 -4 0 0 0 0 0 0 0 # RecrDist_Area_2
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_1
 -4 4 4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_Seas_2
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_1_seas_1_area_1
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_1_seas_1_area_2
 -4 4 3.15062 0 -1 0 6 0 0 0 0 0 0 0 # RecrDist_interaction_GP_1_seas_2_area_1
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_1_seas_2_area_2
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_2_seas_1_area_1
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_2_seas_1_area_2
 -4 4 -4 0 -1 0 -4 0 0 0 0 0 0 0 # RecrDist_interaction_GP_2_seas_2_area_1
 -4 4 3.14684 0 -1 0 -6 0 0 0 0 0 0 0 # RecrDist_interaction_GP_2_seas_2_area_2
 -2 2 1 0 -1 0 -4 0 0 0 0 0 0 0 # CohortGrowDev
 -15 15 15 0 -1 99 -5 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_1from_2to_1
 -15 15 15 0 -1 99 -6 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_1from_2to_1
 -15 15 15 0 -1 99 -5 0 0 0 0 0 0 0 # MoveParm_A_seas_1_GP_2from_1to_2
 -15 15 15 0 -1 99 -7 0 0 0 0 0 0 0 # MoveParm_B_seas_1_GP_2from_1to_2
 -15 15 -0.192659 0 -1 99 4 0 0 0 0 0 0 0 # MoveParm_A_seas_2_GP_1from_1to_2
 -15 15 -0.568062 0 -1 99 4 0 0 0 0 0 0 0 # MoveParm_B_seas_2_GP_1from_1to_2
 -15 15 3.02622 0 -1 99 4 0 0 0 0 0 0 0 # MoveParm_A_seas_2_GP_2from_2to_1
 -15 15 15 0 -1 99 -4 0 0 0 0 0 0 0 # MoveParm_B_seas_2_GP_2from_2to_1
#
#_Cond 0  #custom_MG-env_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-environ parameters
#
#_Cond 0  #custom_MG-block_setup (0/1)
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no MG-block parameters
#_MGtrend_&_cycle_parms 
 18 47 28.1651 -1 -1 -1 5 # L_at_Amax_Fem_GP_1_TrendFinal_
 1981 2010 1991.92 -1 -1 -1 5 # L_at_Amax_Fem_GP_1_TrendInfl_
 0.0001 20 1.59095 -1 -1 -1 8 # L_at_Amax_Fem_GP_1_TrendWidth_
 18 47 29.248 -1 -1 -1 5 # L_at_Amax_Fem_GP_2_TrendFinal_
 1981 2010 1993 -1 -1 -1 5 # L_at_Amax_Fem_GP_2_TrendInfl_
 0.0001 20 1.14 -1 -1 1 -8 # L_at_Amax_Fem_GP_2_TrendWidth_
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Cond -4 #_MGparm_Dev_Phase
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
#_LO HI INIT PRIOR PR_type SD PHASE
 10 20 15.5969 -1 -1 -1 1 # SR_LN(R0)
 0.2 1 0.565047 -1 -1 -1 7 # SR_BH_steep
 0.01 3 0.8 0.65 3 0.2 -8 # SR_sigmaR
 0 0 0 -1 -1 -1 -1 # SR_envlink
 -5 5 0 -1 -1 -1 -2 # SR_R1_offset
 0 1 0.0001 -1 -1 -1 -2 # SR_autocorr
0 #_SR_env_link
0 #_SR_env_target_0=none;1=devs;_2=R0;_3=steepness
2 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1960 # first year of main recr_devs; early devs can preceed this era
2014 # last year of main recr_devs; forecast devs start in following year
7 #_recdev phase 
0 # (0/1) to read 13 advanced options
#_Cond 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
#_Cond -4 #_recdev_early_phase
#_Cond 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
#_Cond 1 #_lambda for Fcast_recr_like occurring before endyr+1
#_Cond 965 #_last_early_yr_nobias_adj_in_MPD
#_Cond 1948 #_first_yr_fullbias_adj_in_MPD
#_Cond 2014 #_last_yr_fullbias_adj_in_MPD
#_Cond 2015 #_first_recent_yr_nobias_adj_in_MPD
#_Cond 1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
#_Cond 0 #_period of cycles in recruitment (N parms read below)
#_Cond -5 #min rec_dev
#_Cond 5 #max rec_dev
#_Cond 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#DisplayOnly 0.317299 # Main_RecrDev_1965
#DisplayOnly 0.537902 # Main_RecrDev_1966
#DisplayOnly -0.57059 # Main_RecrDev_1967
#DisplayOnly -0.19634 # Main_RecrDev_1968
#DisplayOnly -0.913386 # Main_RecrDev_1969
#DisplayOnly 1.07081 # Main_RecrDev_1970
#DisplayOnly -0.768052 # Main_RecrDev_1971
#DisplayOnly -0.916446 # Main_RecrDev_1972
#DisplayOnly -0.473326 # Main_RecrDev_1973
#DisplayOnly -0.762403 # Main_RecrDev_1974
#DisplayOnly -0.0259025 # Main_RecrDev_1975
#DisplayOnly 0.441011 # Main_RecrDev_1976
#DisplayOnly 0.883808 # Main_RecrDev_1977
#DisplayOnly -1.12919 # Main_RecrDev_1978
#DisplayOnly -0.0393374 # Main_RecrDev_1979
#DisplayOnly -0.55368 # Main_RecrDev_1980
#DisplayOnly -0.602945 # Main_RecrDev_1981
#DisplayOnly -1.02515 # Main_RecrDev_1982
#DisplayOnly -0.207682 # Main_RecrDev_1983
#DisplayOnly -0.647535 # Main_RecrDev_1984
#DisplayOnly -0.434509 # Main_RecrDev_1985
#DisplayOnly -0.0319734 # Main_RecrDev_1986
#DisplayOnly 0.389524 # Main_RecrDev_1987
#DisplayOnly 0.661714 # Main_RecrDev_1988
#DisplayOnly 0.813104 # Main_RecrDev_1989
#DisplayOnly 0.60634 # Main_RecrDev_1990
#DisplayOnly -0.0368381 # Main_RecrDev_1991
#DisplayOnly 0.0469549 # Main_RecrDev_1992
#DisplayOnly 0.052064 # Main_RecrDev_1993
#DisplayOnly 1.06348 # Main_RecrDev_1994
#DisplayOnly 0.179798 # Main_RecrDev_1995
#DisplayOnly 0.253038 # Main_RecrDev_1996
#DisplayOnly -0.407584 # Main_RecrDev_1997
#DisplayOnly 0.552759 # Main_RecrDev_1998
#DisplayOnly -0.584573 # Main_RecrDev_1999
#DisplayOnly -0.623416 # Main_RecrDev_2000
#DisplayOnly 0.416879 # Main_RecrDev_2001
#DisplayOnly 0.479103 # Main_RecrDev_2002
#DisplayOnly -0.182751 # Main_RecrDev_2003
#DisplayOnly -0.514447 # Main_RecrDev_2004
#DisplayOnly 0.0809339 # Main_RecrDev_2005
#DisplayOnly -0.58979 # Main_RecrDev_2006
#DisplayOnly 0.238617 # Main_RecrDev_2007
#DisplayOnly 1.56436 # Main_RecrDev_2008
#DisplayOnly 0.0258162 # Main_RecrDev_2009
#DisplayOnly 0.216772 # Main_RecrDev_2010
#DisplayOnly 1.22775 # Main_RecrDev_2011
#DisplayOnly 0.0814421 # Main_RecrDev_2012
#DisplayOnly 0.643836 # Main_RecrDev_2013
#DisplayOnly 6.61916e-005 # Main_RecrDev_2014
#
#Fishing Mortality info 
0.8 # F ballpark for annual F (=Z-M) for specified year
-1 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
6  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms
#_LO HI INIT PRIOR PR_type SD PHASE
 1e-005 3 0.0113867 -1 -1 -1 3 # InitF_1MobS1mixgom
 1e-005 5 2.11025 -1 -1 -1 4 # InitF_2MobS1mixgb
 1e-005 3 0.0824383 -1 -1 -1 3 # InitF_3FixedS1mixgom
 1e-005 3 0.0308252 -1 -1 -1 3 # InitF_4MobS2gom
 1e-005 8 1 -1 -1 -1 8 # InitF_5MobS2gb
 1e-005 3 0.146238 -1 -1 -1 4 # InitF_6FixedS2gom
#
#_Q_setup
 # Q_type options:  <0=mirror, 0=float_nobiasadj, 1=float_biasadj, 2=parm_nobiasadj, 3=parm_w_random_dev, 4=parm_w_randwalk, 5=mean_unbiased_float_assign_to_parm
#_for_env-var:_enter_index_of_the_env-var_to_be_linked
#_Den-dep  env-var  extra_se  Q_type
 0 0 0 0 # 1 MobS1mixgom
 0 0 0 0 # 2 MobS1mixgb
 0 0 0 0 # 3 FixedS1mixgom
 0 0 0 0 # 4 MobS2gom
 0 0 0 0 # 5 MobS2gb
 0 0 0 0 # 6 FixedS2gom
 0 0 0 4 # 7 SprAllmixgom
 0 0 0 4 # 8 SprAllmixgb
 0 0 0 4 # 9 FallAllgom
 0 0 0 4 # 10 FallAllgb
 0 0 0 0 # 11 Shrimpmix
#
1 #_0=read one parm for each fleet with random q; 1=read a parm for each year of index
#_Q_parms(if_any);Qunits_are_ln(q)
# LO HI INIT PRIOR PR_type SD PHASE
 -20 5 -15.1877 -1 -1 -1 1 # LnQ_base_7_SprAllmixgom
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1969_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1970_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1971_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1972_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1973_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1974_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1975_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1976_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1977_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1978_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1979_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1980_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1981_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1982_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1983_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1984_s_1
 -20 5 1.86054 -1 -1 5 2 # Q_walk_7y_1985_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1986_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1987_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1988_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1989_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1990_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1991_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1992_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1993_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1994_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1995_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1996_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1997_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1998_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_1999_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2000_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2001_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2002_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2003_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2004_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2005_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2006_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2007_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2008_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2009_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2010_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2011_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2012_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2013_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_7y_2014_s_1
 -20 5 -11.1294 -1 -1 -1 1 # LnQ_base_8_SprAllmixgb
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1969_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1970_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1971_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1972_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1973_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1974_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1975_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1976_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1977_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1978_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1979_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1980_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1981_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1982_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1983_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1984_s_1
 -20 5 1.94586 -1 -1 5 2 # Q_walk_8y_1985_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1986_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1987_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1988_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1989_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1990_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1991_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1992_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1993_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1994_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1995_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1996_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1997_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1998_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_1999_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2000_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2001_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2002_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2003_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2004_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2005_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2006_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2007_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2008_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2009_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2010_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2011_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2012_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2013_s_1
 -2 2 0 0 1 0.001 -4 # Q_walk_8y_2014_s_1
 -20 3 -13.9141 -1 -1 -1 1 # LnQ_base_9_FallAllgom
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1966_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1967_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1968_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1969_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1970_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1971_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1972_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1973_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1974_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1975_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1976_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1977_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1978_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1979_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1980_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1981_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1982_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1983_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1984_s_2
 -20 5 4.29636 -1 -1 5 2 # Q_walk_9y_1985_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1986_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1987_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1988_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1989_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1990_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1991_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1992_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1993_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1994_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1995_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1996_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1997_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1998_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_1999_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2000_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2001_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2002_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2003_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2004_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2005_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2006_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2007_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2008_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2009_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2010_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2011_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2012_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2013_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_9y_2014_s_2
 -20 3 -14.2755 -1 -1 -1 1 # LnQ_base_10_FallAllgb
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1966_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1967_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1968_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1969_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1970_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1971_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1972_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1973_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1974_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1975_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1976_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1977_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1978_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1979_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1981_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1982_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1983_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1984_s_2
 -20 5 3.39766 -1 -1 5 2 # Q_walk_10y_1985_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1986_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1987_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1988_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1989_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1990_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1991_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1992_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1993_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1994_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1995_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1996_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1997_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1998_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_1999_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2000_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2001_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2002_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2003_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2004_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2005_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2006_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2007_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2008_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2009_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2010_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2011_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2012_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2013_s_2
 -2 2 0 0 1 0.001 -4 # Q_walk_10y_2014_s_2
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 24 0 0 0 # 1 MobS1mixgom
 24 0 0 0 # 2 MobS1mixgb
 24 0 0 0 # 3 FixedS1mixgom
 24 0 0 0 # 4 MobS2gom
 24 0 0 0 # 5 MobS2gb
 24 0 0 0 # 6 FixedS2gom
 24 0 0 0 # 7 SprAllmixgom
 24 0 0 0 # 8 SprAllmixgb
 24 0 0 0 # 9 FallAllgom
 24 0 0 0 # 10 FallAllgb
 24 0 0 0 # 11 Shrimpmix
#
#_age_selex_types
#_Pattern ___ Male Special
 10 0 0 0 # 1 MobS1mixgom
 10 0 0 0 # 2 MobS1mixgb
 10 0 0 0 # 3 FixedS1mixgom
 10 0 0 0 # 4 MobS2gom
 10 0 0 0 # 5 MobS2gb
 10 0 0 0 # 6 FixedS2gom
 10 0 0 0 # 7 SprAllmixgom
 10 0 0 0 # 8 SprAllmixgb
 10 0 0 0 # 9 FallAllgom
 10 0 0 0 # 10 FallAllgb
 10 0 0 0 # 11 Shrimpmix
#_LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
 5.5 34.5 27.1402 -1 -1 -1 3 0 0 0 0 0 0 0 # SizeSel_1P_1_MobS1mixgom
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
#_Cond 0 #_custom_sel-env_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no enviro fxns
#_Cond 0 #_custom_sel-blk_setup (0/1) 
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no block usage
#_Cond No selex parm trends 
#_Cond -4 # placeholder for selparm_Dev_Phase
#_Cond 0 #_env/block/dev_adjust_method (1=standard; 2=logistic trans to keep in base parm bounds; 3=standard w/ no bound check)
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
1 #_Variance_adjustments_to_input_values
#_fleet: 1 2 3 4 5 6 7 8 9 10 11 
  0 0 0 0 0 0 0 0 0 0 0 #_add_to_survey_CV
  0 0 0 0 0 0 0 0 0 0 0 #_add_to_discard_stddev
  0 0 0 0 0 0 0 0 0 0 0 #_add_to_bodywt_CV
  0.57 0.74 0.56 0.42 0.67 0.33 0.15 0.14 0.16 0.05 0.58 #_mult_by_lencomp_N
  0.07 0.03 0.04 0.02 0.02 0.02 0.04 0.03 0.02 0.02 0 #_mult_by_agecomp_N
  1 1 1 1 1 1 1 1 1 1 1 #_mult_by_size-at-age_N
#
3 #_maxlambdaphase
1 #_sd_offset
#
0 # number of changes to make to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet/survey  phase  value  sizefreq_method
#

# lambdas (for info only; columns are phases)
#  0 0 0 #_CPUE/survey:_1
#  0 0 0 #_CPUE/survey:_2
#  0 0 0 #_CPUE/survey:_3
#  0 0 0 #_CPUE/survey:_4
#  0 0 0 #_CPUE/survey:_5
#  0 0 0 #_CPUE/survey:_6
#  1 1 1 #_CPUE/survey:_7
#  1 1 1 #_CPUE/survey:_8
#  1 1 1 #_CPUE/survey:_9
#  1 1 1 #_CPUE/survey:_10
#  1 1 1 #_CPUE/survey:_11
#  1 1 1 #_lencomp:_1
#  1 1 1 #_lencomp:_2
#  1 1 1 #_lencomp:_3
#  1 1 1 #_lencomp:_4
#  1 1 1 #_lencomp:_5
#  1 1 1 #_lencomp:_6
#  1 1 1 #_lencomp:_7
#  1 1 1 #_lencomp:_8
#  1 1 1 #_lencomp:_9
#  1 1 1 #_lencomp:_10
#  1 1 1 #_lencomp:_11
#  1 1 1 #_agecomp:_1
#  1 1 1 #_agecomp:_2
#  1 1 1 #_agecomp:_3
#  1 1 1 #_agecomp:_4
#  1 1 1 #_agecomp:_5
#  1 1 1 #_agecomp:_6
#  1 1 1 #_agecomp:_7
#  1 1 1 #_agecomp:_8
#  1 1 1 #_agecomp:_9
#  1 1 1 #_agecomp:_10
#  0 0 0 #_agecomp:_11
#  1 1 1 #_init_equ_catch
#  1 1 1 #_recruitments
#  1 1 1 #_parameter-priors
#  1 1 1 #_parameter-dev-vectors
#  1 1 1 #_crashPenLambda
#  0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

