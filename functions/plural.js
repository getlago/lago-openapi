import inflection from "inflection";

// This function is Spectral function used to check if a parameter is plural.
export default (input) => {
  let sanitizedInput = input.replace(/[^a-z]*$/, "");
  const plural = inflection.pluralize(sanitizedInput);
  if (plural !== sanitizedInput) {
    return [
      {
        message: `Value must be plural: ${input}`,
      },
    ];
  }
};
