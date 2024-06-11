import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Import medical exam data using read_csv
df = pd.read_csv('medical_examination.csv')
# Create a new 'overweight' column, defined as BMI > 25
df['overweight'] = (df['weight']/(df['height']/100)**2 > 25).astype('int')
# Convert 'cholesterol' and 'gluc' to binary, with 0
# as normal and 1 as above normal
df['cholesterol'] = (df['cholesterol'] > 1).astype('int')
df['gluc'] = (df['gluc'] > 1).astype('int')

# Function to draw the catplot using Seaborn
def draw_cat_plot():
    # Use melt to restructure the data such that 'cardio'
    # is the index and all others are listed as 'variable'
    # followed by 'value'
    df_cat = pd.melt(df,id_vars=['cardio'],
        value_vars=['active','alco','cholesterol','gluc','overweight','smoke'])
    # Group by 'cardio', 'variable', and 'value', then
    # get the size of each group
    # Use reset_index so that 'cardio' is no longer index
    df_cat = df_cat.groupby(['cardio','variable','value']).size().reset_index()
    df_cat = df_cat.rename(columns = {0: 'total'})
    # Create the catplot using Seaborn
    # define x and y variables using x and y args
    # make it a bar graph using kind arg
    # make 0's one color and 1's another by using hue
    # and facet the grid such that 'cardio' = 0 is one column
    # and 'cardio' = 1 is another in the plot grid
    catplot = sns.catplot(df_cat, x='variable', kind='bar',
        y='total', hue='value', col='cardio')
    # Convert the catplot into a figure and 
    fig = catplot.figure
    # Save the figure and return it
    fig.savefig('catplot.png')
    return fig


# Function to create a heat map based on correlations between
# variables
def draw_heat_map():
    # Clean the data to remove 'outliers'
    df_heat = df[(df['ap_lo'] <= df['ap_hi']) &
        (df['height'] >= df['height'].quantile(0.025)) &
        (df['height'] <= df['height'].quantile(0.975)) &
        (df['weight'] >= df['weight'].quantile(0.025)) &
        (df['weight'] <= df['weight'].quantile(0.975))]
    # Calculate the correlation matrix using df.corr()
    corr = df_heat.corr()
    # Create a 'mask' that will be passed into the heatmap
    # function to hide values above the diagonal
    mask = np.zeros(corr.shape)
    mask[np.triu_indices(corr.shape[0])] = 1
    # 14
    fig, ax = plt.subplots(figsize=(9,9))
    # 15
    ax = sns.heatmap(corr,mask=mask,square=True,annot=True,
        fmt='0.1f',linewidths=0.1)
    # 16
    fig.savefig('heatmap.png')
    return fig
