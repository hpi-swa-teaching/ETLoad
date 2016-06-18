baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			package: 'System';
			package: 'ETLoad' with: [
				spec requires: 'System'; preLoadDoIt: #preLoad. ]. ].