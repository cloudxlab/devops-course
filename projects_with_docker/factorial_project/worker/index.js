const keys = require('./keys');
const redis = require('redis');

const redisClient = redis.createClient({
  host: keys.redisHost,
  port: keys.redisPort,
  retry_strategy: () => 1000
});
const sub = redisClient.duplicate();

function factorial(number) {
  if (number == 0)
    return 1
  return number * factorial(number-1)
}

sub.on('message', (channel, message) => {
  redisClient.hset('values', message, factorial(parseInt(message)));
});
sub.subscribe('insert');
