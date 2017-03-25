
#set working dictionary & import data
setwd("//naunsw044/usr_hme_04_sy$/qianro/data/I Drive/Roger Summary/Examples - R/Save Model as R Object")
dev <- read.csv('Train.csv')


#glm model
glm.model <- glm(survived ~ pclass + sex + age + sibsp + parch + fare + embarked, 
                 data = dev, family=binomial)
summary(glm.model)


###########################
## save this model
###########################
saveRDS(glm.model, file = "glm model.rda")



###########################
## load the model
###########################
my.model <- readRDS("glm model.rda")

#derive fitted value & coef from loaded model
val <- read.csv('Test.csv')
fit_value <- predict(my.model, val, type='response')
coef_value <- summary(my.model)$coef



#test if saved and loaded models are same
identical(glm.model, my.model, ignore.environment = TRUE)


