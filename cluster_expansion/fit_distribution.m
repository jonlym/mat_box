function distOut = fit_distribution(distIn, pdfIdeal, range, plotPDFs, plotDiff)
% FIT_DISTRIBUTION Tries to match the absolute probability distribution of 
% dist_in to the relative probability distribution, PDF_in. 
%
% The stopping condition is dictated by the moving average. Range can be 
% used to specify the window for this moving average. Note that this means 
% averages will only be computed after 2*range + 1 iterations. Ensure the 
% data set is large enough to accomodate this. If range is unspecified, assumes 
% a value of 5.
%
% Optional parameters:
% plotPDFs can be set to true to plot the PDFs of the distOut and pdfIdeal.
% plotDiff can be set to true to see how the difference varies with 
% iteration and prints the number of points removed from each bin.

%Set default parameters
switch nargin
    case 2
        range = 5;
        plotPDFs = false;
        plotDiff = false;
    case 3
        plotPDFs = false;
        plotDiff = false;
    case 4
        plotDiff = false;
end

j = 1;
diff_avg_now = 0;
diff_avg_prev = 1;
distOut = distIn;
while diff_avg_now < diff_avg_prev
    pdfOut = distOut/sum(distOut);

    %Determine which bin should be reduced
    diff = pdfOut - pdfIdeal;
    i = find(diff == max(diff), 1);
    distOut(i) = distOut(i) - 1;
    diffHist(j) = i;

    diffPlot(j) = max(diff);
    
    %Calculate moving averages
    if j > (2*range + 1)
        diff_avg_now = mean(diffPlot((end-range):end));
        diff_avg_prev = mean(diffPlot((end-2*range-1):(end-range-1)));
    end
    j = j+1;
end

%Revert changes until you've reached the minimum in the moving average
i = length(diffPlot) - range + find(min(diffPlot((end-range):end)) == diffPlot((end-range):end), 1) - 1;
for j = i:length(diffPlot)
    k = diffHist(j);
    distOut(k) = distOut(k) + 1;
end


%Optional Plots
if plotPDFs
    figure;
    hold on;
    bar([distOut/sum(distOut), pdfIdeal]);
    ylabel('Relative Frequency');
    xticks(1:length(pdfIdeal));
    legend('PDF Out', 'PDF Ideal');
    hold off
end

if plotDiff
    figure;
    hold on;
    plot(diffPlot, 'b-');
    plot((length(diffPlot)-range):length(diffPlot), diffPlot(end-range:end), 'r-');
    plot(i, diffPlot(i), 'ro');
    xlabel('Iteration');
    ylabel('Maximum difference between pdfIdeal and pdfOut');
    hold off
    
    distDiff = distIn - distOut;
    fprintf('Summary of # data points used.\n');
    for i = 1:length(distDiff)
        fprintf('Bin %d: %d/%d\n', i, distOut(i), distIn(i));
    end
end