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

columns = ['Hit_Green', 'Hit_Fwy', 
				'Appr_Shot_Prox_to_the_Hole', 'Made_Putt_Distance', 'Putts', 'Par', 'Actual_Yard']

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


	query = '''select Hit_Green, Hit_Fwy,
				Appr_Shot_Prox_to_the_Hole, Made_Putt_Distance, Putts, Par, Actual_Yard, Score from golf.hole'''

 	ts = time.time()

	st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
	print 'start time: ', st

	df = pd.read_sql_query(query,con=engine) 
 
	st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
	print 'end time: ', st
 
 	print 'db read done!...'
	
	return df

def preProcess(df1):
 
	
	#handle nulls, set to NaN
	array = df1.apply(pd.to_numeric, errors='coerce').values
	
	#set NaN's to mean
	imputer = Imputer()
	transformed_values = imputer.fit_transform(array)
	
	from sklearn import preprocessing
	from sklearn import utils
	lab_enc = preprocessing.LabelEncoder()
	 
	X = transformed_values[:, 0:8]
	y = transformed_values[:, 7]
	
	y = lab_enc.fit_transform(y)
	
 
	return transformed_values, X, y


def calcMean(transformed_values):	
   	
	print "hit green mean(): ", transformed_values[:, 0].mean()
	print "hit fw .mean(): ", transformed_values[:, 1].mean()
	print "Appr_Shot_Prox_to_the_Hole .mean(): ", transformed_values[:, 2].mean()
	print "made Putts  .mean(): ", transformed_values[:, 3].mean()
	print "Putts  .mean(): ", transformed_values[:, 4].mean()
	print "Par .mean(): ", transformed_values[:, 5].mean() 
	print "Actual_Yard  .mean(): ", transformed_values[:, 6].mean()


def splitTestTraining(X, y):
	X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.70, random_state=5) # 70% training and 30% test
	return X_train, X_test, y_train, y_test


def runRandomForest(X_train, y_train, X_test, y_test):

	print 'in randomForest'
	
	clf=RandomForestClassifier(n_jobs=2)
	
	print 'in randomForest created classifier'
    
	model = clf.fit(X_train,y_train)
	
	print 'in randomForest created model'
    
	y_pred=clf.predict(X_test)
	
	print 'in randomForest created prediction'
    
	
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
    
    print 'dbread done, preprocssing'
    
    transformed_values, X, y = preProcess(df)
    
    
    print 'preprocess done, splitting test/training'
    
    calcMean(transformed_values)
    
    X_train, X_test, y_train, y_test = splitTestTraining(X, y)
    
    
    print 'splitting test/training done, running randomForest'
    
    runRandomForest(X_train, y_train, X_test, y_test)
    

main()	
	