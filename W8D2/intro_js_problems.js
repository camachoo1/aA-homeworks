const madLib = (verb, adj, noun) =>
  `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;

const isSubstring = (phrase, subphrase) => phrase.includes(subphrase);

const fizzBuzz = (arr) => {
  let res = [];

  for (let i = 0; i < arr.length; i++) {
    if (i % 3 === 0 && i % 5 !== 0) {
      res.push(i);
    } else if (i % 5 === 0 && i % 3 !== 0) {
      res.push(i);
    }
  }
  return res;
};

const isPrime = (n) => {
  if (n < 2) return false;

  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
};

const sumOfNPrimes = (n) => {
  let sum = 0;
  let count = 0;
  let i = 2;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  return sum;
};
