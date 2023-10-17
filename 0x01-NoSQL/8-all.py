#!/usr/bin/env python3
""" a Python function that lists all documents in a collection """
from pymongo import MongoClient


if __name__ != "__main__":
    def list_all(mongo_collection):
        """ a Python function that lists all documents in a collection """
        cursor = mongo_collection.find()
        try:
            doc = next(cursor)
        except StopIteration:
            return []
        return mongo_collection.find()
