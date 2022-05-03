%% RAW

% The file 'iclabel-output-raw.mat' was obtained from the ICA decomposition
% in the 'sample-raw.set' dataset.

% ----------------------------------------------
% sha1: 59a706d5cf750534ebfe72798731ec30252b556d
% ----------------------------------------------

EEG = pop_loadset('sample-raw.set');
EEG = eeg_checkset(EEG);

% Calculate ICA activations
EEG.icaact = eeg_getica(EEG);
EEG.icaact = double(EEG.icaact);

% Extract features
features = ICL_feature_extractor(EEG, true);

% Run ICLabel
labels = run_ICL('default', features{1}, features{2}, features{3});
save('iclabel-output-raw.mat', 'labels');


%% EPOCHS

% The file 'iclabel-output-epo.mat' was obtained from the ICA decomposition
% in the 'sample-epo.set' dataset.

% ----------------------------------------------
% sha1: 20a856c1296f72e5ae81a5ed8656db7f1598c9b9
% ----------------------------------------------

EEG = pop_loadset('sample-epo.set');
EEG = eeg_checkset(EEG);

% Calculate ICA activations
EEG.icaact = eeg_getica(EEG);
EEG.icaact = double(EEG.icaact);

% Extract features
features = ICL_feature_extractor(EEG, true);

% Run ICLabel
labels = run_ICL('default', features{1}, features{2}, features{3});
save('iclabel-output-epo.mat', 'labels');
