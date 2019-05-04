var googlehome = require('google-home-notifier');
var language = 'ja';

googlehome.device(process.env.DEVICE || 'Google-Home', language);

message = process.env.MESSAGE || 'message is not set';
googlehome.notify(message ,function(res) {
  console.log(res);
});
