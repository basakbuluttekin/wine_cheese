import streamlit as st
import pandas as pd
from PIL import Image

wine_list_read_data = pd.read_csv('/Users/basakbuluttekin/Desktop/Final_Project/archive-2/clean_dataset.csv')
wine_cheese_neigbors = pd.read_csv('/Users/basakbuluttekin/Desktop/Final_Project/archive-2/wine_cheese_neigbors.csv')

st.title("Cheese & Wine Pairing Recommender")

image = Image.open('/Users/basakbuluttekin/Desktop/Screenshot 2023-06-07 at 12.34.03.png')
st.image(image)

inpt = st.subheader("Pick your cheese from below list then reach the magic 😆!")

recommendation_counter = 1
while True:
   
    option = st.selectbox(
     'Select your cheese',
     ['--select--','raclette', 'zamorano', 'havarti', 'smoked gouda', 'munster', 'brie', 'manchego', 'bûcheron', 
      'edam', 'mild cheddar', 'chèvre', 'gruyère', 'asiago', 'roncal', 'fiore sardo', 'gouda', 'emmental', 'requesón', 
      'camambert', 'ricotta', 'parmigiano-reggiano', 'cheshire', 'abbaye de belloc', 'roquefort', 'comté', 'aged cheddar', 
      'florette', 'tomme', 'idiazabal'])


    available_cheeses_lower = wine_cheese_neigbors["cheese"].str.lower()
    if option in available_cheeses_lower.values:
        filtered_df = wine_cheese_neigbors[available_cheeses_lower == option]
        neighbors_list = filtered_df[['neighbor_1', 'neighbor_2', 'neighbor_3', 'neighbor_4', 'neighbor_5', 'neighbor_6']].values.flatten()
        selected_rows = wine_list_read_data[wine_list_read_data.index.isin(neighbors_list)]
        selected_rows = selected_rows.drop(columns=['province', 'winery'])

        for _, row in selected_rows.iterrows():
            st.write(f"Recommendation-{recommendation_counter}")
            st.write("Country:", row['country'])
            st.write("Description:", row['description'])
            st.write("Wine_Name:", row['wine_name'])
            st.write("Variety:", row['variety'])
            st.write("Year:", row['year'])
            st.write("Points:", row['points'])
            st.write("Price: ", row['price_USD'])
            st.write()
            recommendation_counter += 1
        break