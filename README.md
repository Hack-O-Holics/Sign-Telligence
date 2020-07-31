# Sign Telegence

## Demo
[![](http://img.youtube.com/vi/9iuHfg67M94/0.jpg)](http://www.youtube.com/watch?v=9iuHfg67M94 '')

## Inspiration
Sign language is a set of predefined actions and movements used to convey a message. These languages are the only way for the over 70 million deaf and severely verbally challenged people worldwide to communicate. Sadly, few non-deaf people know sign language and over 80% of deaf people are from developing nations, meaning that they usually don't have the resources or support to learn sign language. Fortunately, with [the drastically decreasing prices for smartphone and internet usage](https://qz.com/india/1483368/indias-smartphone-internet-usage-will-surge-by-2022-cisco-says/), technology could be used to break this barrier of communication, especially in these poorer nations.

## What It Does
Our app, Sign Telegence, has features allowing users to learn sign language using VR and interactive quizzes, as well as a way to translate sign language to audio and audio to text for two-way communication between a deaf and normal person. Look at our video demo above for more details.

## How We Built It
We used PyTorch and [this dataset from Kaggle](https://www.kaggle.com/ayuraj/american-sign-language-dataset) in order to train a neural network to accurately predict over 35 signs. We then created an iOS app using Swift and XCode and deployed the model so that it translates a hand gesture into text, which is articulated by a virtual assistant, all in real-time. This allows both deaf and non-deaf users to communicate with each other and even self-learn these complicated gestures easily and interactively with instant feedback. This was achieved in real-time by passing every frame of a live video as an image into our neural network. We created the quiz and speech recognition features of the app using Swift and XCode as well. We used echoAR to build the VR portion of our app, which provides yet another hands-on way to learn different gestures.

## Challenges We Ran Into
Importing the PyTorch model into the format XCode requires was the most difficult and time-consuming part of the project, due to the poor documentation and lack of online resources.  

## Accomplishments That We're Proud Of
We're proud of finishing a complex project in such a short amount of time and hopefully making an impact on the verbally-challenged community.

## What We Learned
We learned how to export PyTorch models to XCode and implement VR tools in iOS apps. 

## What's Next For Sign Telegence
Hopefully larger sign language datasets will be created, so we can retrain our model and classify a wider variety of gestures. We also plan on improving the user interface to make it more aesthetically pleasing for our users.
