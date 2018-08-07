#!/usr/bin/python

""" 
    This is the code to accompany the Lesson 2 (SVM) mini-project.

    Use a SVM to identify emails from the Enron corpus by their authors:    
    Sara has label 0
    Chris has label 1
"""
    
import sys
from time import time
sys.path.append("../tools/")
from email_preprocess import preprocess


### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

print "- - - - -"

#########################################################
### your code goes here ###

print "-----------------------------------------"
print "- - - - - - - - RESULTS - - - - - - - - -"
print "-----------------------------------------"

from sklearn.svm import SVC
# clf = SVC(kernel='linear') # ---> Accuracy: 88% (1% data training, no C value)
# clf = SVC(kernel='rbf') # ---> Accuracy 68% (1% data training, no C value)
clf = SVC(kernel='rbf', C=10000) # ---> Accuracy: 89% (1% data training) / 99% (full data training)

# One way to speed up an algorithm is to train it on a smaller training dataset.
# The tradeoff is that the accuracy almost always goes down when you do this.
# These lines effectively slice the training dataset down to 1% of its original size, tossing out 99% of the training data.
# You can leave all other code unchanged.
# features_train = features_train[:len(features_train)/100]
# labels_train = labels_train[:len(labels_train)/100]

# Training...
t0 = time()
clf.fit(features_train, labels_train)
print ">>> Training time:", round(time()-t0, 3), "s"
print " "

# Predicting...
t0 = time()
predict = clf.predict(features_test)
print ">>> predict values (array test): ", predict
print ">>> predict time: ", round(time()-t0, 3), "s"

print "- - - - -"
print ">>> predicted values at position 10th, 26th and 50th: ", predict[10], ", ", predict[26], ", ", predict[50]
import numpy as np
print ">>> predicted values in Chris (1) class: ", np.count_nonzero(predict)
print "- - - - -"

# Accuracy classifier...
t0 = time()
accuracy = clf.score(features_test, labels_test)
print ">>> accuracy value: ", (accuracy*100), "%"
print ">>> accuracy time: ", round(time()-t0, 3), "s"

#########################################################


