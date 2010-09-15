#listFile(PATH)
SELECT F.LOGICAL_FILE_NAME,B.BLOCK_NAME, FT.FILE_TYPE, F.CHECK_SUM, F.EVENT_COUNT , F.FILE_SIZE , 
F.ADLER32, MD5, F.AUTO_CROSS_SECTION, F.CREATION_DATE, F.CREATE_BY, F.LASTMODIFICATIONDATE, 
F.LAST_MODIFIED_BY 
FROM CMS_DBS3_OWNER.FILES F
JOIN CMS_DBS3_OWNER.PATHS P on P.PATH_ID=F.PATH_ID
JOIN CMS_DBS3_OWNER.BLOCKS B on B.BLOCK_ID=F.BLOCk_ID
JOIN CMS_DBS3_OWNER.FILE_TYPES FT on FT.FILE_TYPE_ID=F.FILE_TYPE_ID
WHERE F.IS_FILE_VALID=1 and P.IS_PATH_VALID=1 and P.PATH_NAME='%';

#listFile(BLOCK)
SELECT F.LOGICAL_FILE_NAME, FT.FILE_TYPE, F.CHECK_SUM, F.EVENT_COUNT,
F.FILE_SIZE, 
F.ADLER32, MD5, F.AUTO_CROSS_SECTION, F.CREATION_DATE, F.CREATE_BY,
F.LASTMODIFICATIONDATE, 
F.LAST_MODIFIED_BY 
FROM CMS_DBS3_OWNER.FILES F
JOIN CMS_DBS3_OWNER.BLOCKS B on B.BLOCK_ID=F.BLOCk_ID
JOIN CMS_DBS3_OWNER.FILE_TYPES FT on FT.FILE_TYPE_ID=F.FILE_TYPE_ID
WHERE F.IS_FILE_VALID=1 and B.BLOCK_NAME='%';

#listLFNs(BLOCK)
SELECT F.LOGICAL_FILE_NAME as LFN 
FROM CMS_DBS3_OWNER.FILES F
JOIN CMS_DBS3_OWNER.BLOCKS B on B.BLOCK_ID=F.BLOCk_ID
WHERE F.IS_FILE_VALID=1 and B.BLOCK_NAME='%';

#listFiles(RUN) 
SELECT F.LOGICAL_FILE_NAME, FT.FILE_TYPE,  P.PATH_NAME, B.BLOCK_NAME, F.CHECK_SUM, F.EVENT_COUNT,
F.FILE_SIZE, 
F.ADLER32, MD5, F.AUTO_CROSS_SECTION, F.CREATION_DATE, F.CREATE_BY, F.LASTMODIFICATIONDATE, 
F.LAST_MODIFIED_BY 
FROM CMS_DBS3_OWNER.FILES F
JOIN CMS_DBS3_OWNER.FILE_TYPES FT on FT.FILE_TYPE_ID=F.FILE_TYPE_ID
JOIN CMS_DBS3_OWNER.PATHS P on P.PATH_ID=F.PATH_ID
JOIN CMS_DBS3_OWNER.BLOCKS B on B.BLOCK_ID=F.BLOCk_ID
JOIN CMS_DBS3_OWNER.FILE_LUMIS FL on FL.FILE_ID=F.FILE_ID
WHERE P.IS_PATH_VALID=1 and F.IS_FILE_VALID=1 and FL.RUN_NUM=%;

#listFiles(StartRun, EndRun) 
SELECT F.LOGICAL_FILE_NAME, FT.FILE_TYPE,  P.PATH_NAME, B.BLOCK_NAME, F.CHECK_SUM, F.EVENT_COUNT,
F.FILE_SIZE,
F.ADLER32, MD5, F.AUTO_CROSS_SECTION, F.CREATION_DATE, F.CREATE_BY, F.LASTMODIFICATIONDATE,
F.LAST_MODIFIED_BY
FROM CMS_DBS3_OWNER.FILES F
JOIN CMS_DBS3_OWNER.FILE_TYPES FT on FT.FILE_TYPE_ID=F.FILE_TYPE_ID
JOIN CMS_DBS3_OWNER.PATHS P on P.PATH_ID=F.PATH_ID
JOIN CMS_DBS3_OWNER.BLOCKS B on B.BLOCK_ID=F.BLOCk_ID
JOIN CMS_DBS3_OWNER.FILE_LUMIS FL on FL.FILE_ID=F.FILE_ID
WHERE P.IS_PATH_VALID=1 and F.IS_FILE_VALID=1 and (FL.RUN_NUM BETWEEN % and %);

#listFileLumiSections( LFN ) 
SELECT RUN_NUM, LUMI_SECTION_NUM
FROM CMS_DBS3_OWNER.FILE_LUMIS FL
JOIN CMS_DBS3_OWNER.FILES F on F.FILE_ID=FL.FILE_LUMI_ID
WHERE F.IS_FILE_VALID=1 and F.LOGICAL_FILE_NAME='%';

#listPATHS() 
SELECT P.PATH_NAME, PT.PATH_TYPE, 
A.ACQUISITION_ERA_NAME, PE.PROCESSING_ERA_NAME, PG.PHYSICS_GROUP_NAME, P.XTCROSSSECTION, P.GLOBAL_TAG, 
P.CREATIONDATE, P.CREATEBY, P.LASTMODIFICATIONDATE, P.LASTMODIFIEDBY 
FROM CMS_DBS3_OWNER.PATHS P
JOIN CMS_DBS3_OWNER.PATH_TYPES PT on PT.PATH_TYPE_ID=P.PATH_TYPE_ID
JOIN CMS_DBS3_OWNER.ACQUISITION_ERAS A on A.ACQUISITION_ERA_ID=P.ACQUISITION_ERA_ID
JOIN CMS_DBS3_OWNER.PROCESSING_ERAS PE on PE.PROCESSING_ERA_ID=P.PROCESSING_ERA_ID
JOIN CMS_DBS3_OWNER.PHYSICS_GROUPS PG on PG.PHYSICS_GROUP_ID=P.PHYSICS_GROUP_ID 
WHERE P.IS_PATH_VALID=1
;

#listPATHPARENTS(Path) 
#listBLOCKPARENTS(PATH) 


#listBlocks(PATH)
SELECT B.BLOCK_NAME, B.OPEN_FOR_WRITING, B.ORIGIN_SITE, B.BLOCK_SIZE, B.FILE_COUNT, 
B.CREATION_DATE, B.CREATE_BY, B.LAST_MODIFICATION_DATE, B.LAST_MODIFIED_BY
FROM CMS_DBS3_OWNER.BLOCKS B
JOIN CMS_DBS3_OWNER.PATHS P on P.PATH_ID=B.PATH_ID
WHERE P.PATH_NAME='%'
;

#listBlockContents(Block) 
SELECT B.BLOCK_NAME, P.PATH_NAME, B.OPEN_FOR_WRITING, B.ORIGIN_SITE, B.BLOCK_SIZE, B.FILE_COUNT, 
B.CREATION_DATE, B.CREATE_BY, B.LAST_MODIFICATION_DATE, B.LAST_MODIFIED_BY
FROM CMS_DBS3_OWNER.BLOCKS B
JOIN CMS_DBS3_OWNER.PATHS P on P.PATH_ID=B.PATH_ID
WHERE B.BLOCK_NAME='%'
;

#listPrimaryDatasets() 
SELECT P.PRIMARY_DS_NAME, PT.PRIMARY_DS_TYPE, P.CREATION_DATE, P.CREATE_BY
FROM CMS_DBS3_OWNER.PRIMARY_DATASETS P 
JOIN CMS_DBS3_OWNER.PRIMARY_DS_TYPES PT ON PT.PRIMARY_DS_TYPE_ID=P.PRIMARY_DS_TYPE_ID
;
