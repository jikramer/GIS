import datetime
import time
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#https://towardsdatascience.com/random-forest-in-python-24d0893d51c0
from sklearn.preprocessing import Imputer
from sklearn.ensemble import RandomForestClassifier
from sklearn import preprocessing
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.cross_validation import train_test_split
from sklearn import metrics
from sklearn.naive_bayes import GaussianNB
from numpy import array        
 
from sklearn.ensemble import RandomForestRegressor
from sqlalchemy import create_engine

from tabulate import tabulate

import warnings
warnings.filterwarnings("ignore")

columns = ['Birdies', 'Bogies', 'Pars', 'Total_Greens_in_Regulation', '_Scrambling_10-20_Yardsattempts', 'Scrambling_10-20_Yardssuccesses',
			'Sand_Save_%#_Saves', 'Course_Par',  'Driving_DistanceTotal_Drives', 
			'Course_Yardage', "Putting_20'-25'putts_made", "Putting___10'-15'putts_made"]



def lookupRoundInfoFromDB():
   
	print 'reading from db...'
   

	DB_URI = "mysql+mysqlconnector://{user}:{password}@{host}:{port}/{db}"

	engine = create_engine(DB_URI.format(	
  		user ='root',
  		password = 'password',
  		host = 'localhost',
  		port='3306',
  		db = 'golf'),
  		
  		connect_args = {'time_zone': '+00:00'}
	)

 	query = '''select Birdies, Bogeys, Pars, Total_Greens_in_Regulation, `_Scrambling_10-20_Yardsattempts`, `Scrambling_10-20_Yardssuccesses`, 
			`Sand_Save_%#_Saves`, Course_Par,  `Driving_Dist._-_All_DrivesTot._Dist.`, 
			Course_Yardage, `Putting_20'-25'putts_made`, `Putting___10'-15'putts_made`, 
			Round_Score from golf.round'''

# 	query = '''select Birdies, Bogeys, Pars, Total_Greens_in_Regulation, `Scrambling_10-20_Yardssuccesses`, 
# 			Round_Score from golf.round'''


	ts = time.time()

	st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
	print 'start time: ', st

	df = pd.read_sql_query(query,con=engine) 


	st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
	print 'end time: ', st
	
#	print 'df: ', df
	
	print 'db read done!...'
	
	return df

def preProcess(df1):

	X=df1
	y=df1['Round_Score']
	
	#handle nulls, set to NaN
	array = df1.apply(pd.to_numeric, errors='coerce').values
	
	#set NaN's to mean
	imputer = Imputer()
	transformed_values = imputer.fit_transform(array)
	
	X = transformed_values[:, 0:13]
	Y = transformed_values[:, 12]
 
	return transformed_values, X, y


def calcMean(transformed_values):	
   	
	print "birds.mean(): ", transformed_values[:, 0].mean()
	print "boges.mean(): ", transformed_values[:, 1].mean()
	print "pars.mean(): ", transformed_values[:, 2].mean()
	print "greens in reg.mean(): ", transformed_values[:, 3].mean()
 	print "scrambling 10-20y attempt.mean(): ", transformed_values[:, 4].mean()

 	print "scrambling 10-20y success.mean(): ", transformed_values[:, 5].mean()

	print "sand save success.mean(): ", transformed_values[:, 6].mean()
	print "coursepar.mean(): ", transformed_values[:, 7].mean()
	print "driving_distance_total_drives.mean(): ", transformed_values[:, 8].mean()
	print "course_yardage.mean(): ", transformed_values[:, 9].mean() 
	print "Putting_20'_-_25'_putts_made.mean(): ", transformed_values[:, 10].mean()
	print "Putting_10'_-_15'_putts_made.mean(): ", transformed_values[:, 11].mean()
	


def splitTestTraining(X, y):
	X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.70, random_state=5) # 70% training and 30% test
	return X_train, X_test, y_train, y_test


def runRandomForest(X_train, y_train, X_test, y_test):
	    
    clf=RandomForestClassifier(n_jobs=2)

    #Train the model using the training sets
    model = clf.fit(X_train,y_train)

    # prediction on test set
    y_pred=clf.predict(X_test)
     
     
    print 'y_pred', y_pred
 
    print '-----------------------'
    print 'Random Forest results: '
    print '-----------------------'

    print("Random Forest Accuracy: ",metrics.accuracy_score(y_test, y_pred))
    print ("Random Forest confusion matrix: ",  metrics.confusion_matrix(y_test, y_pred))
    print 'Random Forest classification_report ', metrics.classification_report(y_test, y_pred) 
    
    headers = ["name", "score"]
    values = sorted(zip(columns, model.feature_importances_), key=lambda x: x[1] * -1)
    print(tabulate(values, headers, tablefmt="plain"))

def main():
 
    pd.set_option('display.max_columns',500)
    pd.set_option('display.width',1000)
    
    df = lookupRoundInfoFromDB();
    
    transformed_values, X, y = preProcess(df)
    
    calcMean(transformed_values)
    
    X_train, X_test, y_train, y_test = splitTestTraining(X, y)
    
    runRandomForest(X_train, y_train, X_test, y_test)
    

main()	
	