function [customBands, bands] = setFreqBands()
fprintf(['Choose how to define frequency bands:\n  default = Delta (2-4), Theta (4-6),' ...
    ' LowAlpha (6-9), HighAlpha (9-12), Beta (13-30), Gamma (30-45)\n  ' ...
    'custom = Create custom bands using user input\n']) ;
customBands = choose2('default', 'custom') ;
if customBands
    bands = [] ;
    fprintf(['Enter the frequency bands of interest:\n' ...
    'Enter each band as a list, each element seperated by a blank' ...
    ' space,\nwith the band name as the first item in the list. ' ...
    'Press enter/return between entries.\nWhen you ' ...
    'have entered all bands, input "done" (without quotations).\n' ...
    'For optimization purposes, we do not recommend crossing 30Hz within' ...
    'a single band.\nExample: LowAlpha 6 9\n']) ;
    while true
        temp = split(input('> ', 's'))' ;
        if size(temp,2) == 1 && strcmpi(temp, 'done'); break ;
        elseif size(temp,2) == 3
            bands = [bands; temp] ;                                         %#ok<AGROW> 
        else
            fprintf(['Invalid input: enter a band name and the two frequency' ...
                ' limits or "done" (without quotations).\n']) ;
            continue ;
        end
    end
else
    bands = {'Delta', '2', '4'; 'Theta', '4', '6'; 'LowAlpha', '6', '9'; 'HighAlpha', ...
        '9', '12'; 'Beta', '13', '20'; 'Gamma', '30', '45'} ;
end
end