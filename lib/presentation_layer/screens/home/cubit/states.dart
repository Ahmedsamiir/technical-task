abstract class ExhibitsLoaderStates {}

class ExhibitInitialStates extends ExhibitsLoaderStates {}

class ExhibitLoadingStates extends ExhibitsLoaderStates {}

class ExhibitSuccessStates extends ExhibitsLoaderStates {}

class ExhibitErrorStates extends ExhibitsLoaderStates {
  final error;

  ExhibitErrorStates(this.error);
}
