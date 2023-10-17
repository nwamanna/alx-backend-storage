#!/usr/bin/env python3
""" a Python function that inserts a new document
in a collection based on kwargs """
from pymongo import MongoClient


if __name__ != "__main__":
    def insert_school(mongo_collection, **kwargs):
        """ a Python function that inserts a new document
        in a collection based on kwargs """
        insert = mongo_collection.insert_one(kwargs)
        return insert.inserted_id
