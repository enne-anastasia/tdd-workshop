### Answer 5

You should have added tests of the correct behavior of the Fst function, but also moved the input checks to another family of tests, so that the tests of Fis and Fst can focus on whatever output is specific to them, and error handling can be safely tested independently. See answer code to check whether your implementation of Fst is correct.