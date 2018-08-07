#!/usr/bin/python

""" 
    This is the code to accompany the Lesson 1 (Naive Bayes) mini-project. 

    Use a Naive Bayes Classifier to identify emails by their authors
    
    authors and labels:
    Sara has label 0
    Chris has label 1
"""
    
import sys
from time import time
sys.path.append("../tools/")
from email_preprocess import preprocess

print "-----------------------------------------"
print "- - - - - - - - RESULTS - - - - - - - - -"
print "-----------------------------------------"

### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

print "- - - - -"

#########################################################
### your code goes here ###

from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()

print "- - - - -"

# Training...
t0 = time()
clf.fit(features_train, labels_train)
print ">>> training time:", round(time()-t0, 3), "s"

print "- - - - -"

# Predicting...
t0 = time()
predict = clf.predict(features_test)
print ">>> predict values: ", predict
print ">>> predict time: ", round(time()-t0, 3), "s"

print "- - - - -"

# Accuracy classifier...
t0 = time()
accuracy = clf.score(features_test, labels_test)
print ">>> accuracy value: ", accuracy
print ">>> accuracy time: ", round(time()-t0, 3), "s"

#########################################################


