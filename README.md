# 🌌 K-Means Clustering on Astronomical Data using `astrodatR`

This project uses the **K-Means clustering algorithm** to explore and group astronomical observations from the [`astrodatR`](https://cran.r-project.org/web/packages/astrodatR/astrodatR.pdf) dataset. The goal is to uncover hidden structures in the data, demonstrate the use of unsupervised machine learning in astronomy, and reflect on its broader applications across industries.

---

## 📁 Dataset

The dataset used is sourced from the R package [`astrodatR`](https://cran.r-project.org/web/packages/astrodatR/astrodatR.pdf), which provides real-world astronomical datasets for learning and analysis. For this project, a numerical subset of the dataset (e.g., `galaxy`) was selected and prepared for clustering.

### Example of selected variables:
- `RA`: Right Ascension  
- `DEC`: Declination  
- `z`: Redshift (distance indicator)  

These variables were chosen for their numerical nature and relevance to spatial analysis.

---

## 🛠️ Tools & Libraries

``r
# Required R packages
library(astrodatR)   # Astronomical datasets
library(dplyr)       # Data manipulation
library(cluster)     # Clustering functions
library(factoextra)  # Visualization of clustering & elbow method
library(ggplot2)     # Plotting

### Example of selected variables:
- `RA`: Right Ascension  
- `DEC`: Declination  
- `z`: Redshift (distance indicator)  

These variables were chosen for their numerical nature and relevance to spatial analysis.

## 🔍 Methodology

### 1. Data Preprocessing

- Loaded the dataset using `astrodatR::galaxy`.
- Selected relevant numerical columns for clustering (e.g., `RA`, `DEC`, `z`).
- Scaled features using `scale()` to normalize units and ensure fair distance calculations.

### 2. Running K-Means

- Ran the `kmeans()` function with different values of `k` (e.g., 2 to 10).
- Calculated and compared metrics such as total within-cluster sum of squares (WSS).

### 3. Determining Optimal Clusters: Elbow Method

The **Elbow Method** helps determine the best number of clusters (`k`) by plotting the WSS for each value of `k`. The “elbow” point — where the WSS starts to diminish more slowly — indicates the optimal `k`.

---

## ✅ Advantages of K-Means

1. **Efficient:** Handles large datasets with high speed.
2. **Simple:** Easy to implement and interpret.
3. **Consistent:** Produces reproducible results with the same initialization.

---

## ⚠️ Disadvantages of K-Means

1. **Initialization Sensitivity:** Results depend on the initial placement of centroids.
2. **Outlier Sensitivity:** Outliers can distort the structure of the clusters.
3. **Predefined `k`:** You must specify the number of clusters beforehand, which may require additional analysis.

---

## 💡 Why Create Clusters?

Creating clusters helps to:

- Identify patterns in complex datasets.
- Segment data into meaningful groups.
- Simplify analysis and interpretation.
- Improve decision-making based on behavioral or spatial similarities.

In astronomy, this can support tasks such as identifying types of galaxies, grouping celestial objects, or optimizing observation strategies.

---

## 📊 Real-World Applications

### 🔭 Astronomy & Space

- Group celestial objects by physical or spatial similarity.
- Detect potential outliers or anomalies in telescope surveys.

### 🛍️ Business & Marketing

- Segment customers into groups for targeted campaigns.
- Analyze buying behavior across product categories.

### 🧬 Healthcare

- Group patients with similar symptoms or genetic profiles.
- Personalize treatment based on condition clusters.

### 💬 Media & Social Networks

- Group news articles by topic.
- Recommend content based on user cluster behavior.

---

## 🏢 Professional Applications

- **Process Optimization:** Detect patterns in industrial or manufacturing operations.
- **Financial Risk Analysis:** Group clients or portfolios based on risk profiles.
- **Market Segmentation:** Build consumer profiles to tailor products and services.

---

## 📌 Best Practices & Recommendations

1. **Compare Algorithms:** Consider DBSCAN, hierarchical clustering, or Gaussian Mixture Models depending on the problem and data shape.
2. **Preprocess Your Data:** Normalize, clean, and scale features to ensure fair clustering.
3. **Validate Clusters:** Use domain knowledge, silhouette scores, or Davies–Bouldin index to assess clustering quality.
4. **Run Multiple Times:** Use `nstart > 1` to avoid poor local minima in K-Means.
