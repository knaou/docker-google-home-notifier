var googlehome = require('google-home-notifier');
var language = 'ja';
var reader = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});

googlehome.device(process.env.DEVICE || 'Google-Home', language);

message = process.env.MESSAGE || '';

reader.on('line', function(line) {
  message += ' ' + line;
});
reader.on('close', function() {
  googlehome.notify(message ,function(res) {
    console.log(res);
  });
});

