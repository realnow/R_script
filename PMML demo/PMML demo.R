
# Load the required R libraries
library(pmml)

#set working dictionary & import data
setwd("//naunsw044/usr_hme_04_sy$/qianro/data/I Drive/Roger Summary/Examples - R/Save Model as PMML")
dev <- read.csv('Train.csv')
val <- read.csv('Test.csv')

#glm model
glm.model <- glm(survived ~ pclass + sex + age + sibsp + parch + fare + embarked, 
         data = dev, family=binomial)
summary(glm.model)


# Describe the model in PMML and save it in an XML file
glm.pmml <- pmml(glm.model,name="glm model",data=dev)
xmlFile <- file.path(getwd(),"glm model.xml")
saveXML(glm.pmml,xmlFile)



