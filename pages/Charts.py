import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.set_page_config(page_title="Energy Consumption", layout="wide")

Energy = pd.DataFrame()

@st.cache
def getData():
    print("Getting Data")
    df = pd.read_html('https://en.wikipedia.org/wiki/Energy_in_the_United_States')[7][:-1] # remove last row
    return df

st.title('Charts Sample')
Energy = getData()
st.table(Energy)

# fig, ax = plt.subplots()
fig, (ax1, ax2) = plt.subplots(ncols=2)
st.header('Energy consumption by source')
ax1.title.set_text('US')
ax2.title.set_text('World')
ax1.pie(Energy["United States[21]"], labels = Energy["Fuel type"])
ax2.pie(Energy["World[22]"], labels = Energy["Fuel type"])

st.pyplot(fig)