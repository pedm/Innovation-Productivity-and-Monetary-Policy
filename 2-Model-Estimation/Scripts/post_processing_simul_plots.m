
%% Plot simulated data

figure()
subplot(3,1,1)
plot(R_simul(:,1:TT))
title('R&D')

subplot(3,1,2)
plot(A_simul(:,1:TT))
title('TFP')

subplot(3,1,3)
plot(Y_simul(:,1:TT))
title('GDP')
suptitle('Simulated Data')

%% Plot IRFs
names={'GDP','TFP','R&D'};

fig = figure();
for i = 1:3
    
    subplot(1,3,i);
    plot( ir_rd(i,:), 'linewidth', 2.5, 'color', 'k');  hold off;
    title(names(i)); axis tight;
end
axesfig  = get(fig, 'CurrentAxes');
childfig = get(axesfig, 'Children');
suptitle('VAR on Model Simulated Data')