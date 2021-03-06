#!/usr/bin/env python
""" DAO Object for PhysicsGroups table """ 

__revision__ = "$Revision: 1.7 $"
__version__  = "$Id: Insert.py,v 1.7 2010/08/09 18:22:07 yuyi Exp $ "

from WMCore.Database.DBFormatter import DBFormatter
from dbs.utils.dbsExceptionHandler import dbsExceptionHandler

class Insert(DBFormatter):

    def __init__(self, logger, dbi, owner):
            DBFormatter.__init__(self, logger, dbi)
	    self.owner = "%s." % owner if not owner in ("", "__MYSQL__") else ""
	    
            self.sql = """INSERT INTO %sPHYSICS_GROUPS ( PHYSICS_GROUP_ID, PHYSICS_GROUP_NAME) 
                          VALUES (:physics_group_id, :physics_group_name)""" % (self.owner)

    def execute( self, conn, physics_groupsObj, transaction=False):
        self.dbi.processData(self.sql, physics_groupsObj, conn, transaction)
	return
