# Shiny Technical Test
## June 10, 2020

## Intro

Hello Shiny developer! Welcome to the Shiny dojo. Here, you will be completing a series of tasks to demonstrate your Shiny skills. Upon completion of these tasks, you will have completed your very own Shiny application - a mark of a true Shiny ninja!

In this technical test, you will be developing a Shiny app that generates data visualizations for an ad clicks dataset. This Shiny app UI will consist of 1) a control panel for user input, and 2) a plotting area. The goal of this app is to allow your team members to see the web traffic on various ads on your platform.

It is imperative that you read the instructions carefully, as completion of each stage is required for fully unlocking the next stage. Without further ado, let's begin...


## Stage 1

In this first stage, you will first set up your Git and development environment. 

### Required software

Make sure that you have the following software installed (try to match the described versions, but if they don't match perfectly, you should still be able to complete the test as long as your versions are recent enough):

1. [RStudio](https://rstudio.com/products/rstudio/download/)
2. [R 3.6.x](https://www.r-project.org/)
3. R packages: dplyr, ggplot2, shiny, here, and any necessary dependencies


### GitHub

Once your local development environment is set up, fork this repository (https://github.com/LKS-CHART/shiny_technical_test) to your own GitHub account. To fork the repository, click the "Fork" button shown here:

![](fork_screenshot.png)

After forking the repo, clone the forked repo to your local environment. 

Before you start developing your Shiny app, let's review the files in the directory.


There are a few provided files that you may find helpful for this test:

- **ad_clicks.csv**: this is the sample dataset that you will be using for the Shiny app. You must use this dataset.
- **ggplot.R**: this is a starter plotting function that you may use. Feel free to edit this or create your own plotting function
- **app/**: this directory contains a server.R and a ui.R which comprises of the skeleton of your Shiny app. You may use this as a starter to create the rest of your application.

**To make sure that your environment is set up properly, run the following test:**


```
# 1. Launch RStudio
# 2. Select File -> Open Project -> Select shiny_technical_test.Rproj in the cloned repo
# 3. In the R Console, run `shiny::runApp("app/")`
```

If an application launches in your browser without error, then congratulations! It should look something like this:

![](screenshot.png)

You may now proceed to Stage 2. In the next stages, you will iteratively improve upon this application. Note that required tasks will be labeled by **[REQ|#]** where # indicates the points awarded for the task, but if you have extra time, feel free to express your creativity by making additional enhancements! 

## Stage 2 - Implementing server-side functionality of the plot type picker

Upon launching the app, you noticed a radio button picker that allowed the user to select the plot type to visualize: line, scatter, or both. However, you also noticed that this feature was not functional, as clicking the various buttons did not update the plot.

To complete this stage, please add the necessary server-side functionality to allow the user to use the plot type picker to update the type of plot that is visualized. Reviewing the provided **ggplot.R** start plotting function may be helpful. **Hint:** the value of the radio button picker can be accessed from Shiny via Shiny's `input` object, in association with the specific input UI element's `inputId`.

Here is the desired functionality:

1. **[REQ|5]** Upon clicking a radio button, the plot will re-render and display the appropriate plot as selected by the user.
2. **[REQ|2]** The default selected radio button on app launch should be "both".

**[REQ|2] Upon completion of this stage, commit your changes to Git, with the commit message "Add plot picker server"**

## Stage 3 - Adding date range input widget

The current application only contains one user input widget in the control panel: a radio button selector the plot type. To better serve your team's needs, you decide to add a date range input widget to allow the user to select the range of data they would like to visualize.  

To complete this stage, please create a date range input widget in the app UI (note: you do not need to implement the server-side functionality yet; simply add the UI element). You may find the `shiny::dateRangeInput` function helpful for this task.

Here is the desired functionality:

1. **[REQ|5]** Add an additional UI element to the user input widget (left-side of the application) that allows the user to select a date range (minimum and maximum date). Do not implement the server-side functionality yet!

**[REQ|2] Upon completion of this stage, commit your changes to Git, with the commit message "Add date range UI".**

## Stage 4 - Implementing server-side functionality of the date range widget

Fantastic! Now you have an app that allows the user to select the type of plot they wish to visualize, as well as an UI element that allows the user to select the date range for the visualization. You just need to implement the server-side functionality of the date range widget so that the plot updates upon user input of a new date range. **Hint:** you may need to edit the code within the `renderPlot({...})` function call within `server.R`.

Here is the desired functionality:

1. **[REQ|2]** The user can enter select any date between May 1st 2019 and June 10 2020.
2. **[REQ|8]** Upon entering a valid date range, the plot re-renders to show only data from the selected range.
3. **[BONUS|5]** As an error check, the upper range of the date range widget must be greater than the lower range (eg. May 15, 2019 to May 10, 2019 is not a valid date range). Implement a mechanism that gracefully handles these types of input errors by providing some form of feedback to the user.

**[REQ|2] Upon completion of this stage, commit your changes to Git, with the commit message "Add date range server".**

At this point, **please push all commits to your own forked repository**. This marks the end of the required portion of the technical test.

## Stage 5 - Optional enhancements!

If you have reached this point with time to spare, great job! With the remaining time, feel free to express your inner design guru and make this application stand out. This is completely optional, but will be an opportunity to showcase your skills.

Some things you can consider:

1. Improving the plot visualization
2. Adding more plot types
3. Creating a "Submit" button that triggers plot rendering

## Submission

If you have successfully gotten to this point, congratulations! You are indeed a Shiny ninja. Please follow these steps to submit your test:

1. Commit and push your code to your forked repository
2. Send an email to Jennifer.Deevy@unityhealth.to and David.Dai@unityhealth.to with a link to your forked repository. Please make sure that the repository is public :)

Please send this email prior to the end of your allotted time.

... and you have defeated the Shiny dojo!