## Inspiration
Sign language is a set of predefined actions and movements used to convey a message. These languages are the only way for the 70 million deaf and other verbally challenged people worldwide to communicate. Sadly, few non-deaf people know sign language and over 80% of deaf people are from developing nations, meaning that they usually don't have the resources or support to learn sign language. Fortunately, with [the drastically decreasing prices for smartphone and internet usage](https://qz.com/india/1483368/indias-smartphone-internet-usage-will-surge-by-2022-cisco-says/), technology could be used to break this barrier of communication, especially in these poorer nations.

## What It Does
Our app, SignTelligence, has features allowing users to learn sign language using VR and interactive quizzes, as well as a way to translate sign language to audio and audio to text using computer vision and speech recognition. Look at our video demo below for more detail.

## How We Built It
We used PyTorch and [this dataset from Kaggle](https://www.kaggle.com/ayuraj/american-sign-language-dataset) in order to train a neural network to accurately predict over 35 signs. We then created an iOS app using Swift and XCode that uses real-time image detection by passing every frame of a live video as an image into our neural network. We created the VR tools, quizzes, and speech recognition features of the app using Swift and XCode as well.

## Challenges We Ran Into
Importing the PyTorch model into the format XCode requires was the most difficult and time-consuming part of the project, due to the poor documentation and lack of online resources.

## Accomplishments That We're Proud Of
We're proud of finishing a complex project in such a short amount of time and hopefully making an impact on the verbally-challenged community.

## What We Learned
We learned how to export PyTorch models to XCode and implement VR tools in iOS apps.

## What's Next For SignTelligence
Hopefully larger datasets will be created, so we can classify more types of signs. We also plan on improving the user interface to make it more aesthetically pleasing for our users.

## Video Demo
https://www.youtube.com/redirect?v=gcGmQDt3tgY&redir_token=QUFFLUhqbGdpZEZTN1cwdG9hUDNHTWFYUGpMcnlfUEc1QXxBQ3Jtc0tseFM0NTExTDNVNndZd3BRY2I4SFZOZjdmRTUxczFXd044VUE5Nm4zR2dlLUttR2VlSm1xRGFQUkVwS1E0U3o1NEhvbURzS055c0xGams2b1l6VTJTZzJhRjYtdVB0Q29EOGxZNEtNUmZEMlZGWHEwSQ%3D%3D&event=video_description&q=https%3A%2F%2F1drv.ms%2Fv%2Fs%21AhgwwDStSlSYwWwvG2naShv36TpK%3Fe%3DmmSP7o
