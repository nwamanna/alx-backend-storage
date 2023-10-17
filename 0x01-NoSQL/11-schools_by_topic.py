#!/usr/bin/env python3
""" a Python function that returns the list of
school having a specific topic """
from pymongo import MongoClient


if __name__ != "__main__":
    def schools_by_topic(mongo_collection, topic):
        """ a Python function that returns the
        list of school having a specific topic """
        result = mongo_collection.find({"topics":
                                       {"$elemMatch": {"$eq": topic}}})
        return list(result)
