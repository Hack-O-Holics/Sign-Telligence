## Inspiration
Sign language is a set of predefined actions and movements used to convey a message. These languages are the only way for the over 70 million deaf and severely verbally challenged people worldwide to communicate. Sadly, few non-deaf people know sign language and over 80% of deaf people are from developing nations, meaning that they usually don't have the resources or support to learn sign language. Fortunately, with [the drastically decreasing prices for smartphone and internet usage](https://qz.com/india/1483368/indias-smartphone-internet-usage-will-surge-by-2022-cisco-says/), technology could be used to break this barrier of communication, especially in these poorer nations.

## What It Does
Our app, Sign Telligence, has features allowing users to learn sign language using VR and interactive quizzes, as well as a way to translate sign language to audio and audio to text for two-way communication between a deaf and normal person. Look at our video demo below for more detail.

## How We Built It
We used PyTorch/FastAI and [this dataset from Kaggle](https://www.kaggle.com/ayuraj/american-sign-language-dataset) in order to train a deep neural network to accurately predict over 35 signs from the American Sign Language (ASL). We then created an iOS app using Swift and XCode and deployed the model so that it would convert a sign language gesture made by a person into text, which would then be articulated by a virtual assistant, in real-time. This allows for both deaf and non-deaf users to easily and interactively learn the different hand movements needed for different signs. In order to achieve this process in real-time, we passed every frame of a live video as an image into our neural network. We created the quizzes and speech recognition features of the app using Swift and XCode as well. We used echoAR to create the VR tools in XCode.

## Challenges We Ran Into
Importing the PyTorch model into the format XCode requires was the most difficult and time-consuming part of the project, due to the poor documentation and lack of online resources. 

## Accomplishments That We're Proud Of
We're proud of finishing a complex project in such a short amount of time and hopefully making an impact on the verbally-challenged community. 

## What We Learned
We learned how to export PyTorch models to XCode and implement VR tools in iOS apps. 

## What's Next For Sign Telligence
Hopefully, larger datasets will be created in the future, so that we can retrain our model and classify a wider variety of signs. We also plan on improving the user interface of our app to make it more aesthetically pleasing for our users.

## Video Demo
[![](http://img.youtube.com/vi/9iuHfg67M94/0.jpg)](http://www.youtube.com/watch?v=9iuHfg67M94 "=")
