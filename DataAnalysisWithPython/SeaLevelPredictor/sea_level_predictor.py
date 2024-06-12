import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv')
    # Create scatter plot using Year on the x-axis and Adjusted Sea Level
    # on the y-axis; adjust marker size to be a little smaller
    fig, ax = plt.subplots(figsize=(16,9))
    plt.scatter(df['Year'],df['CSIRO Adjusted Sea Level'],s=10)
    # Use code below to add error bars
    '''
    plt.errorbar(df['Year'],df['CSIRO Adjusted Sea Level'],
        yerr=[df['CSIRO Adjusted Sea Level'] - df['Lower Error Bound'],
            df['Upper Error Bound'] - df['CSIRO Adjusted Sea Level']],
            ecolor='black',capsize=3)
    '''
    # Use code below to fill in the area between error bars
    plt.fill_between(df['Year'],df['Lower Error Bound'],df['Upper Error Bound'],
                    alpha=0.2,color='mediumorchid')
    # Perform linear regression on full dataset
    fullregress = linregress(df['Year'],df['CSIRO Adjusted Sea Level'])
    # Plot the line of best fit over the existing figure
    # In reality, I would use linspace to generate only a few points on this line
    # - however, FCC seems to require all of them (2051 is because endpoint is
    # excluded by arange)
    xfullregress = np.arange(1880,2051,1)
    yfullregress = xfullregress*fullregress[0] + fullregress[1]
    plt.plot(xfullregress,yfullregress,color='turquoise')
    # Perform linear regression on most recent dataset (from 2000)
    recregress = linregress(df['Year'][df['Year'] >= 2000],
                            df['CSIRO Adjusted Sea Level'][df['Year'] >= 2000])
    xrecregress = np.arange(2000,2051,1)
    yrecregress = xrecregress*recregress[0] + recregress[1]
    plt.plot(xrecregress,yrecregress,color='crimson')
    # Add labels and title, resize all of them to look nicer
    ax.set(xlabel='Year',ylabel='Sea Level (inches)',title='Rise in Sea Level')
    ax.xaxis.label.set_size(15)
    ax.yaxis.label.set_size(15)
    ax.title.set_size(20)
    # Add dashed line and text to show the expected sea level in 2050
    plt.plot([1880,2050],[yrecregress[-1],yrecregress[-1]],'--',color='crimson')
    plt.text(1883,yrecregress[-1]-1,'Expected sea level in 2050',
        fontsize='xx-large')
    # Call tight_layout, which will use black magic to fix formatting
    plt.tight_layout()
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()

draw_plot()