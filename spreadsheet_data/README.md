# 📊 Regression Analysis - Spreadsheet Data

This folder contains CSV files extracted from the Wafeka Regression Analysis dashboard. These files can be directly imported into Excel, Google Sheets, or any spreadsheet application to create charts.

## Files

| File | Description | Chart Type |
|------|-------------|------------|
| `1_model_overview.csv` | Model KPIs (R², F-stat, RMSE) | KPI Cards / Table |
| `2_coefficient_statistics.csv` | Regression coefficients with stats | Table |
| `3_standardized_coefficients.csv` | Beta weights for comparison | Horizontal Bar Chart |
| `4_prediction_scenarios.csv` | What-if scenarios | Comparison Cards |
| `5_roi_analysis.csv` | Business impact analysis | Table / Bar Chart |
| `6_actual_vs_predicted.csv` | Model accuracy data | Scatter Plot |
| `7_residuals_analysis.csv` | Prediction errors over time | Bar Chart |
| `8_model_diagnostics.csv` | Statistical test results | Table |
| `9_coefficient_interpretation.csv` | Practical meaning of coefficients | Reference Table |

## How to Create Charts in Excel/Google Sheets

### 1. Standardized Coefficients (Horizontal Bar Chart)
- Import `3_standardized_coefficients.csv`
- Select Variable and Standardized Beta columns
- Insert → Chart → Bar Chart
- Add data labels for beta values

### 2. Actual vs Predicted (Scatter Plot)
- Import `6_actual_vs_predicted.csv`
- X-axis: Predicted CSAT
- Y-axis: Actual CSAT
- Add trendline for perfect fit (y=x)

### 3. ROI Analysis (Bar Chart)
- Import `5_roi_analysis.csv`
- Create clustered bar chart with Investment and Revenue Impact
- Add ROI % as data labels

### 4. Residuals Over Time (Bar Chart)
- Import `7_residuals_analysis.csv`
- Create vertical bar chart with Period on X-axis
- Color bars by Category (Negative=Red, Warning=Yellow, Good=Green)

## Regression Formula

```
CSAT = 3.12 - 0.18(UI/UX) - 0.02(Hosting) + 0.015(OnTime%) - 0.004(PMS) - 0.02(Lag%)
```

## Key Insights

- **R² = 0.89** - Model explains 89% of variance in CSAT
- **Strongest Positive Factor**: On-Time Delivery (β = +0.42)
- **Strongest Negative Factor**: UI/UX Revisions (β = -0.38)
- **Best ROI**: Improve On-Time Delivery (450% ROI)
