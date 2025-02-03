# Module 6: Seismic Signal Processing using ML

## Overview

Module 6 is focused on processing synthetic seismic waveform data, applying various feature extraction techniques, and detecting seismic wave characteristics, such as P-wave and S-wave arrivals. The module generates synthetic seismic waveforms, extracts key time and frequency domain features, and classifies seismic events into shadow and non-shadow zones for further analysis, particularly in the context of seismic event classification.

## Tech Stack

| Technology     | Purpose                     | Where & Why Used                                |
| -------------- | --------------------------- | ----------------------------------------------- |
| **Python**     | General-purpose programming | Entire module                                   |
| **Numpy**      | Numerical computations      | - Handling large waveform datasets              |
|                |                             | - Applying mathematical operations to signals   |
| **ObsPy**      | Seismic data handling       | - Reading and writing seismic waveform data     |
|                |                             | - Managing time-series formats                  |
| **Scipy**      | Signal processing           | - Applying filtering techniques                 |
| **Matplotlib** | Data visualization          | - Plotting waveform signals for analysis        |
| **Pandas**     | Data organization           | - Structuring and manipulating time-series data |
| **PyWavelets** | Wavelet Denoising           | - Removing noise from seismic signals           |
| **Random**     | Data augmentation           | - Generating synthetic seismic waveforms        |

## Problem Statement and Approach

### Problem Statement:

The module focuses on generating synthetic seismic waveforms, processing them to detect key seismic events, and extracting features that can be used for seismic classification. The challenge is to accurately create and classify synthetic seismic data, including distinguishing between shadow zones and non-shadow zones.

### Approach to Solve the Problem:

1. **Synthetic Waveform Generation**: Generate synthetic seismic waveforms by simulating P-wave and S-wave arrivals, including noise.
2. **Wavelet Denoising**: Apply wavelet denoising using soft thresholding to clean up the signals.
3. **Feature Extraction**: Extract features from both time and frequency domains, as well as using the wavelet transform, to describe the waveform.
4. **Shadow Zone Detection**: Classify waveforms into shadow and non-shadow zones, using the characteristics of wave arrivals.
5. **Data Organization**: Organize the extracted features into a structured dataset for analysis.

## Functionality and Workflow

### Step 1: Synthetic Waveform Generation

**Function**: `generate_synthetic_waveforms(signal, sampling_rate, p_wavelet, s_wavelet, num_samples)`
**Process**:

- Simulate the creation of synthetic seismic waveforms by placing randomly shifted P-waves and S-waves into the signal.
- Add Gaussian noise to the waveforms for realism.
- Label the waveforms as either shadow or non-shadow, based on whether the S-wave is detected.

### Step 2: Wavelet Denoising

**Function**: `wavelet_denoising(signal, wavelet, threshold, level)`
**Process**:

- Apply wavelet denoising using soft thresholding to clean up the signal and remove unwanted noise.
- Perform a wavelet decomposition of the signal, apply thresholding to each coefficient, and then reconstruct the signal.

### Step 3: Feature Extraction

**Function**: `extract_features(waveform, sampling_rate)`
**Process**:

- Extract both time-domain and frequency-domain features such as:
- Statistical features: Mean, standard deviation, skewness, and kurtosis.
- Frequency-domain features: Dominant frequencies using Fast Fourier Transform (FFT).
- Wavelet features: Using the wavelet transform to detect the frequency components at different scales.
- Envelope features: Envelope analysis for further classification.

### Step 4: Shadow Zone Detection

**Function**: `create_feature_dataframe(mseed_folder)`
**Process**:

- Loop through synthetic waveform files, extract features, and label them as shadow or non-shadow based on the presence or absence of S-waves.
- Generate a DataFrame with the features for further analysis.
- Print statistics on the dataset, such as the number of shadow and non-shadow zones.

## Code Flow Summary

| **Step**              | **Description**                                             | **Function Used**                |
| --------------------- | ----------------------------------------------------------- | -------------------------------- |
| Generate Waveforms    | Create synthetic seismic waveforms                          | `generate_synthetic_waveforms()` |
| Denoising             | Remove noise from the signal using wavelet transform        | `wavelet_denoising()`            |
| Feature extraction    | Extract statistical, frequency-domain, and wavelet features | `extract_features()`             |
| Shadow zone detection | Classify waveforms as shadow or non-shadow zones            | `create_feature_dataframe()`     |

## Future Enhancements

- Automate Classification with Machine Learning: Integrate machine learning algorithms to automatically classify seismic events based on extracted features.
- Enhance Noise Handling: Explore more advanced noise reduction techniques beyond wavelet denoising.
- Real-time Seismic Monitoring: Extend the module for real-time monitoring and detection of seismic events.

This module effectively processes seismic waveform data, generating synthetic waveforms, extracting meaningful features, and detecting shadow zones in seismic signals. It serves as a strong foundation for future seismic data classification tasks.
