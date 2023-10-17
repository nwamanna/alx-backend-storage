#!/usr/bin/env python3
""" a Python function that changes all
topics of a school document based on the name """
from pymongo import MongoClient


if __name__ != "__main__":
    def update_topics(mongo_collection, name, topics):
        """ a Python function that changes all topics of a
        school document based on the name """
        query = {"name": name}
        value = {"$set": {"topics": topics}}
        mongo_collection.update_many(query, value)
