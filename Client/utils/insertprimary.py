#!/usr/bin/env python
#DBS-3 imports
from dbs.apis.dbsClient import *
#url="http://cmssrv48.fnal.gov:8989/DBSServlet"
url="http://cmssrv48.fnal.gov:8989/dbs3"
#url="http://vocms09.cern.ch:8989/DBSServlet"
#url="http://vocms09.cern.ch:8585/dbs3"
# API Object    
dbs3api = DbsApi(url=url)
#print dbs3api.listPrimaryDatasets()
print dbs3api.insertPrimaryDataset({"primary_ds_type": "test", "primary_ds_name": "TkCosmics38T_ANZAR00r65"})
# Is service Alive
"""
print dbs3api.ping()
print dbs3api.listPrimaryDataset("Wmunu_Wplus-powheg")
print dbs3api.listPrimaryDataset("ANZAR003")
print dbs3api.listPrimaryDataset("ANZAR004")
"""
