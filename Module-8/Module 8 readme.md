# Module 8: Anomaly Detection in Seismic Data

## Overview

Module 8 focuses on generating synthetic seismic waveforms with various anomalies, using normal seismic data as a base. The module incorporates different types of anomalies, including spikes, dropouts, noise bursts, and frequency shifts. After generating these synthetic waveforms, the module uses anomaly detection techniques to identify the presence of these anomalies in seismic data.

## Tech Stack

| Technology       | Purpose                     | Where & Why Used                              |
| ---------------- | --------------------------- | --------------------------------------------- |
| **Python**       | General-purpose programming | Entire module                                 |
| **Numpy**        | Numerical computations      | - Manipulating seismic waveform data          |
|                  |                             | - Manipulating signal data arrays             |
| **ObsPy**        | Seismic data processing     | - Reading and writing MSEED files             |
| **Scikit-learn** | Machine learning            | - Anomaly detection and evaluation techniques |
| **Matplotlib**   | Data Visualization          | - Visualizing waveforms and anomalies         |
| **Random**       | Randomization               | - Generating synthetic anomalies              |

## Problem Statement and Approach

### Problem Statement:

Seismic waveform data often contains anomalies that can hinder accurate analysis. This module generates synthetic seismic waveforms by adding various types of anomalies to normal seismic data. The challenge is to detect these anomalies effectively for better data quality and more accurate seismic analysis.

### Approach to Solve the Problem:

1. **Synthetic Data Generation**: Generate seismic waveforms by introducing anomalies such as spikes, dropouts, noise bursts, and frequency shifts to normal seismic data.
2. **Anomaly Detection**: Detect and label these anomalies within the synthetic seismic waveforms using classification and thresholding techniques.
3. **Data Storage**: Save the generated synthetic seismic waveforms as MSEED files along with labels for each anomaly type.
4. **Feature Extraction**: Extract features from the synthetic data and evaluate the performance of the anomaly detection model using metrics like F1 score.

## Functionality and Workflow

### Step 1: Generating Synthetic Data with Anomalies

**Function**: generate_synthetic_data_with_anomalies()
**Process**:

- Read normal seismic waveforms from existing MSEED files.
- Introduce anomalies into the waveform with a set probability (e.g., 40% chance for spikes).
- Save the generated synthetic waveforms with anomalies as new MSEED files.
- Log the anomalies added to each waveform (e.g., spike, dropout, noise burst, frequency shift).

### Step 2: Model Training for Anomaly Detection

**Function**: train_anomaly_detector()
**Process**:

- Use the synthetic seismic data and labels to train an anomaly detection model.
- Extract features from the synthetic data, including temporal and frequency characteristics.
- Train the model using Scikit-learn algorithms and evaluate performance using F1 score and other classification metrics.

### Step 3: Anomaly Detection and Evaluation

**Function**: evaluate_anomaly_detection()
**Process**:

- Apply the trained anomaly detection model to new seismic waveforms.
- Detect anomalies within the waveforms and output predictions.
- Tune the detection thresholds to optimize detection accuracy.
- Print the optimal thresholds and F1 scores for each anomaly type.

## Code Flow Summary

| **Step**           | **Description**                                     | **Function Used**                          |
| ------------------ | --------------------------------------------------- | ------------------------------------------ |
| Data Generation    | Generate synthetic seismic waveforms with anomalies | `generate_synthetic_data_with_anomalies()` |
| Feature Extraction | Extract features for anomaly detection              | `extract_features_with_labels()`           |
| Anomaly Detection  | Train and evaluate the anomaly detection model      | `train_anomaly_detector()`                 |
| Evaluation         | Detect anomalies and evaluate performance           | `evaluate_anomaly_detection()`             |

## Future Enhancements

- Improved Anomaly Detection: Integrate deep learning models (e.g., LSTM networks) for better anomaly detection, especially for more complex anomaly patterns.
- Real-Time Anomaly Detection: Extend the functionality to support real-time seismic data streaming for immediate anomaly detection.
- Anomaly Visualization: Enhance visualization of anomalies within the waveform using advanced plotting techniques for better user understanding.

This module helps generate synthetic seismic data with various anomalies and provides a framework for detecting and evaluating these anomalies. The generated data can be further used for training and testing seismic anomaly detection models.
