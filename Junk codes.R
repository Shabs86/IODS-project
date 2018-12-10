# Continued from chapter 6.Rmd

#### As we want to compare the fit to the original data, we should use fitted. The fitted function returns the y-hat values associated with the data used to fit the model. 

### Add fitted values as column in BPRSL
# Create a vector of the fitted values
Fitted <- fitted(interaction.bprs)

# Create a new column fitted to RATSL
BPRSL <- BPRSL %>%
  mutate(Fitted)

# Fitted 
ggplot(BPRSL, aes(x = week, y = Fitted, linetype = subject)) +
  geom_line(aes(col=treatment)) +
  scale_linetype_manual(values = rep(1:10, times=4)) +
  theme(legend.position = "none") +
  scale_y_continuous(limits = c(min(BPRSL$Fitted), max(BPRSL$bprs))) +
  ggtitle("Fitted with interaction model")

# Observed 
ggplot(BPRSL, aes(x = week, y = bprs, linetype = subject)) +
  geom_line(aes(col=treatment)) +
  scale_linetype_manual(values = rep(1:10, times=4)) +
  theme(legend.position = "none") +
  scale_y_continuous(limits = c(min(BPRSL$Fitted), max(BPRSL$bprs))) +
  ggtitle("Observed with initial values")


#### We see that interaction models dont explain the data much as fitted plots differ much from the observed plot. 