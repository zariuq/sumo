import Sumo.Signature

namespace Sumo

namespace MergeAxioms

noncomputable section
def domainDecls : List (Obj × Nat × Obj) :=
 [
  (Const.«instance», 1, Const.«Entity»),
  (Const.«instance», 2, Const.«Class»),
  (Const.«immediateInstance», 1, Const.«Entity»),
  (Const.«immediateInstance», 2, Const.«Class»),
  (Const.«inverse», 1, Const.«BinaryRelation»),
  (Const.«inverse», 2, Const.«BinaryRelation»),
  (Const.«subclass», 1, Const.«Class»),
  (Const.«subclass», 2, Const.«Class»),
  (Const.«immediateSubclass», 1, Const.«Class»),
  (Const.«immediateSubclass», 2, Const.«Class»),
  (Const.«subrelation», 1, Const.«Relation»),
  (Const.«subrelation», 2, Const.«Relation»),
  (Const.«domain», 1, Const.«Relation»),
  (Const.«domain», 2, Const.«PositiveInteger»),
  (Const.«domain», 3, Const.«Class»),
  (Const.«domainSubclass», 1, Const.«Relation»),
  (Const.«domainSubclass», 2, Const.«PositiveInteger»),
  (Const.«domainSubclass», 3, Const.«Class»),
  (Const.«range», 1, Const.«Function»),
  (Const.«range», 2, Const.«Class»),
  (Const.«rangeSubclass», 1, Const.«Function»),
  (Const.«valence», 1, Const.«Relation»),
  (Const.«valence», 2, Const.«PositiveInteger»),
  (Const.«documentation», 1, Const.«Entity»),
  (Const.«documentation», 2, Const.«HumanLanguage»),
  (Const.«documentation», 3, Const.«SymbolicString»),
  (Const.«format», 1, Const.«Language»),
  (Const.«format», 2, Const.«Entity»),
  (Const.«format», 3, Const.«SymbolicString»),
  (Const.«termFormat», 1, Const.«Language»),
  (Const.«termFormat», 2, Const.«Entity»),
  (Const.«termFormat», 3, Const.«SymbolicString»),
  (Const.«disjoint», 1, Const.«Class»),
  (Const.«disjoint», 2, Const.«Class»),
  (Const.«disjointRelation», 1, Const.«Relation»),
  (Const.«disjointRelation», 2, Const.«Relation»),
  (Const.«contraryAttribute», 1, Const.«Attribute»),
  (Const.«exhaustiveAttribute», 2, Const.«Attribute»),
  (Const.«exhaustiveDecomposition», 1, Const.«Class»),
  (Const.«exhaustiveDecomposition», 2, Const.«Class»),
  (Const.«disjointDecomposition», 1, Const.«Class»),
  (Const.«disjointDecomposition», 2, Const.«Class»),
  (Const.«partition», 1, Const.«Class»),
  (Const.«partition», 2, Const.«Class»),
  (Const.«relatedInternalConcept», 1, Const.«Entity»),
  (Const.«relatedInternalConcept», 2, Const.«Entity»),
  (Const.«relatedExternalConcept», 1, Const.«SymbolicString»),
  (Const.«relatedExternalConcept», 2, Const.«Entity»),
  (Const.«relatedExternalConcept», 3, Const.«Language»),
  (Const.«synonymousExternalConcept», 1, Const.«SymbolicString»),
  (Const.«synonymousExternalConcept», 2, Const.«Entity»),
  (Const.«synonymousExternalConcept», 3, Const.«Language»),
  (Const.«subsumingExternalConcept», 1, Const.«SymbolicString»),
  (Const.«subsumingExternalConcept», 2, Const.«Entity»),
  (Const.«subsumingExternalConcept», 3, Const.«Language»),
  (Const.«subsumedExternalConcept», 1, Const.«SymbolicString»),
  (Const.«subsumedExternalConcept», 2, Const.«Entity»),
  (Const.«subsumedExternalConcept», 3, Const.«Language»),
  (Const.«externalImage», 1, Const.«Entity»),
  (Const.«externalImage», 2, Const.«SymbolicString»),
  (Const.«subAttribute», 1, Const.«Attribute»),
  (Const.«subAttribute», 2, Const.«Attribute»),
  (Const.«successorAttribute», 1, Const.«Attribute»),
  (Const.«successorAttribute», 2, Const.«Attribute»),
  (Const.«successorAttributeClosure», 1, Const.«Attribute»),
  (Const.«successorAttributeClosure», 2, Const.«Attribute»),
  (Const.«greaterThanByQuality», 1, Const.«Entity»),
  (Const.«greaterThanByQuality», 2, Const.«Entity»),
  (Const.«greaterThanByQuality», 3, Const.«Attribute»),
  (Const.«entails», 1, Const.«Formula»),
  (Const.«entails», 2, Const.«Formula»),
  (Const.«AssignmentFn», 1, Const.«Function»),
  (Const.«AssignmentFn», 2, Const.«Entity»),
  (Const.«PowerSetFn», 1, Const.«SetOrClass»),
  (Const.«FrontFn», 1, Const.«SelfConnectedObject»),
  (Const.«BackFn», 1, Const.«SelfConnectedObject»),
  (Const.«part», 1, Const.«Object»),
  (Const.«part», 2, Const.«Object»),
  (Const.«properPart», 1, Const.«Object»),
  (Const.«properPart», 2, Const.«Object»),
  (Const.«piece», 1, Const.«Substance»),
  (Const.«piece», 2, Const.«Substance»),
  (Const.«component», 1, Const.«CorpuscularObject»),
  (Const.«component», 2, Const.«CorpuscularObject»),
  (Const.«material», 2, Const.«CorpuscularObject»),
  (Const.«hole», 1, Const.«HoleRegion»),
  (Const.«hole», 2, Const.«SelfConnectedObject»),
  (Const.«properlyFills», 1, Const.«Object»),
  (Const.«properlyFills», 2, Const.«HoleRegion»),
  (Const.«contains», 1, Const.«SelfConnectedObject»),
  (Const.«contains», 2, Const.«Object»),
  (Const.«member», 1, Const.«Physical»),
  (Const.«member», 2, Const.«Collection»),
  (Const.«subCollection», 1, Const.«Collection»),
  (Const.«subCollection», 2, Const.«Collection»),
  (Const.«containsInformation», 1, Const.«ContentBearingPhysical»),
  (Const.«containsInformation», 2, Const.«Proposition»),
  (Const.«containsFormula», 1, Const.«ContentBearingPhysical»),
  (Const.«containsFormula», 2, Const.«Formula»),
  (Const.«language», 1, Const.«ContentBearingPhysical»),
  (Const.«language», 2, Const.«Language»),
  (Const.«leader», 1, Const.«AutonomousAgent»),
  (Const.«leader», 2, Const.«Human»),
  (Const.«property», 1, Const.«Entity»),
  (Const.«property», 2, Const.«Attribute»),
  (Const.«attribute», 1, Const.«Object»),
  (Const.«attribute», 2, Const.«Attribute»),
  (Const.«manner», 1, Const.«Process»),
  (Const.«manner», 2, Const.«Attribute»),
  (Const.«ExtensionFn», 1, Const.«Attribute»),
  (Const.«AttrFn», 2, Const.«Attribute»),
  (Const.«lessThan», 1, Const.«RealNumber»),
  (Const.«lessThan», 2, Const.«RealNumber»),
  (Const.«greaterThan», 1, Const.«RealNumber»),
  (Const.«greaterThan», 2, Const.«RealNumber»),
  (Const.«lessThanOrEqualTo», 1, Const.«RealNumber»),
  (Const.«lessThanOrEqualTo», 2, Const.«RealNumber»),
  (Const.«greaterThanOrEqualTo», 1, Const.«RealNumber»),
  (Const.«greaterThanOrEqualTo», 2, Const.«RealNumber»),
  (Const.«involvedInEvent», 1, Const.«Process»),
  (Const.«involvedInEvent», 2, Const.«Entity»),
  (Const.«agent», 1, Const.«Process»),
  (Const.«agent», 2, Const.«AutonomousAgent»),
  (Const.«destination», 1, Const.«Process»),
  (Const.«destination», 2, Const.«Entity»),
  (Const.«experiencer», 1, Const.«Process»),
  (Const.«experiencer», 2, Const.«AutonomousAgent»),
  (Const.«instrument», 1, Const.«Process»),
  (Const.«instrument», 2, Const.«Object»),
  (Const.«origin», 1, Const.«Process»),
  (Const.«origin», 2, Const.«Object»),
  (Const.«patient», 1, Const.«Process»),
  (Const.«patient», 2, Const.«Entity»),
  (Const.«resource», 1, Const.«Process»),
  (Const.«resource», 2, Const.«Object»),
  (Const.«resourceExhausted», 1, Const.«Process»),
  (Const.«resourceExhausted», 2, Const.«Object»),
  (Const.«result», 1, Const.«Process»),
  (Const.«result», 2, Const.«Entity»),
  (Const.«ProbabilityFn», 1, Const.«Formula»),
  (Const.«conditionalProbability», 1, Const.«Formula»),
  (Const.«conditionalProbability», 2, Const.«Formula»),
  (Const.«conditionalProbability», 3, Const.«RealNumber»),
  (Const.«increasesLikelihood», 1, Const.«Formula»),
  (Const.«increasesLikelihood», 2, Const.«Formula»),
  (Const.«decreasesLikelihood», 1, Const.«Formula»),
  (Const.«decreasesLikelihood», 2, Const.«Formula»),
  (Const.«independentProbability», 1, Const.«Formula»),
  (Const.«independentProbability», 2, Const.«Formula»),
  (Const.«prefers», 1, Const.«CognitiveAgent»),
  (Const.«prefers», 2, Const.«Formula»),
  (Const.«prefers», 3, Const.«Formula»),
  (Const.«inScopeOfInterest», 1, Const.«CognitiveAgent»),
  (Const.«inScopeOfInterest», 2, Const.«Entity»),
  (Const.«needs», 1, Const.«CognitiveAgent»),
  (Const.«needs», 2, Const.«Physical»),
  (Const.«wants», 1, Const.«CognitiveAgent»),
  (Const.«wants», 2, Const.«Physical»),
  (Const.«desires», 1, Const.«CognitiveAgent»),
  (Const.«desires», 2, Const.«Formula»),
  (Const.«considers», 1, Const.«CognitiveAgent»),
  (Const.«considers», 2, Const.«Formula»),
  (Const.«believes», 1, Const.«CognitiveAgent»),
  (Const.«believes», 2, Const.«Formula»),
  (Const.«knows», 1, Const.«CognitiveAgent»),
  (Const.«knows», 2, Const.«Formula»),
  (Const.«says», 1, Const.«CognitiveAgent»),
  (Const.«says», 2, Const.«Formula»),
  (Const.«ListFn», 1, Const.«Entity»),
  (Const.«ListOrderFn», 1, Const.«List»),
  (Const.«ListOrderFn», 2, Const.«PositiveInteger»),
  (Const.«ListLengthFn», 1, Const.«List»),
  (Const.«ListConcatenateFn», 1, Const.«List»),
  (Const.«ListConcatenateFn», 2, Const.«List»),
  (Const.«inList», 1, Const.«Entity»),
  (Const.«inList», 2, Const.«List»),
  (Const.«subList», 1, Const.«List»),
  (Const.«subList», 2, Const.«List»),
  (Const.«SubListFn», 1, Const.«Integer»),
  (Const.«SubListFn», 2, Const.«Integer»),
  (Const.«SubListFn», 3, Const.«List»),
  (Const.«LastFn», 1, Const.«List»),
  (Const.«FirstFn», 1, Const.«List»),
  (Const.«ListSumFn», 1, Const.«List»),
  (Const.«AverageFn», 1, Const.«List»),
  (Const.«initialList», 1, Const.«List»),
  (Const.«initialList», 2, Const.«List»),
  (Const.«identicalListItems», 1, Const.«List»),
  (Const.«identicalListItems», 2, Const.«List»),
  (Const.«closedOn», 1, Const.«Function»),
  (Const.«closedOn», 2, Const.«Class»),
  (Const.«reflexiveOn», 1, Const.«BinaryRelation»),
  (Const.«reflexiveOn», 2, Const.«Class»),
  (Const.«partialOrderingOn», 1, Const.«BinaryRelation»),
  (Const.«partialOrderingOn», 2, Const.«Class»),
  (Const.«totalOrderingOn», 1, Const.«BinaryRelation»),
  (Const.«totalOrderingOn», 2, Const.«Class»),
  (Const.«trichotomizingOn», 1, Const.«BinaryRelation»),
  (Const.«trichotomizingOn», 2, Const.«Class»),
  (Const.«equivalenceRelationOn», 1, Const.«BinaryRelation»),
  (Const.«equivalenceRelationOn», 2, Const.«Class»),
  (Const.«distributes», 1, Const.«BinaryFunction»),
  (Const.«distributes», 2, Const.«BinaryFunction»),
  (Const.«subProcess», 1, Const.«Process»),
  (Const.«subProcess», 2, Const.«Process»),
  (Const.«relatedEvent», 1, Const.«Process»),
  (Const.«relatedEvent», 2, Const.«Process»),
  (Const.«causes», 1, Const.«Process»),
  (Const.«causes», 2, Const.«Process»),
  (Const.«causesProposition», 1, Const.«Formula»),
  (Const.«causesProposition», 2, Const.«Formula»),
  (Const.«copy», 1, Const.«Object»),
  (Const.«copy», 2, Const.«Object»),
  (Const.«time», 1, Const.«Physical»),
  (Const.«time», 2, Const.«TimePosition»),
  (Const.«holdsDuring», 1, Const.«TimePosition»),
  (Const.«holdsDuring», 2, Const.«Formula»),
  (Const.«capability», 2, Const.«CaseRole»),
  (Const.«capability», 3, Const.«Object»),
  (Const.«exploits», 1, Const.«Object»),
  (Const.«exploits», 2, Const.«AutonomousAgent»),
  (Const.«hasPurpose», 1, Const.«Physical»),
  (Const.«hasPurpose», 2, Const.«Formula»),
  (Const.«hasPurposeForAgent», 1, Const.«Physical»),
  (Const.«hasPurposeForAgent», 2, Const.«Formula»),
  (Const.«hasPurposeForAgent», 3, Const.«AutonomousAgent»),
  (Const.«hasSkill», 2, Const.«AutonomousAgent»),
  (Const.«confersNorm», 1, Const.«Entity»),
  (Const.«confersNorm», 2, Const.«Formula»),
  (Const.«confersNorm», 3, Const.«ObjectiveNorm»),
  (Const.«deprivesNorm», 1, Const.«Entity»),
  (Const.«deprivesNorm», 2, Const.«Formula»),
  (Const.«deprivesNorm», 3, Const.«ObjectiveNorm»),
  (Const.«overlapsSpatially», 1, Const.«Object»),
  (Const.«overlapsSpatially», 2, Const.«Object»),
  (Const.«partlyLocated», 1, Const.«Physical»),
  (Const.«partlyLocated», 2, Const.«Object»),
  (Const.«located», 1, Const.«Physical»),
  (Const.«located», 2, Const.«Object»),
  (Const.«eventPartlyLocated», 1, Const.«Process»),
  (Const.«eventPartlyLocated», 2, Const.«Object»),
  (Const.«eventLocated», 1, Const.«Process»),
  (Const.«eventLocated», 2, Const.«Object»),
  (Const.«exactlyLocated», 1, Const.«Physical»),
  (Const.«exactlyLocated», 2, Const.«Object»),
  (Const.«between», 1, Const.«Object»),
  (Const.«between», 2, Const.«Object»),
  (Const.«between», 3, Const.«Object»),
  (Const.«betweenOnPath», 1, Const.«Object»),
  (Const.«betweenOnPath», 2, Const.«Object»),
  (Const.«betweenOnPath», 3, Const.«Object»),
  (Const.«betweenOnPath», 4, Const.«Object»),
  (Const.«traverses», 1, Const.«Object»),
  (Const.«traverses», 2, Const.«Object»),
  (Const.«crosses», 1, Const.«Object»),
  (Const.«crosses», 2, Const.«Object»),
  (Const.«penetrates», 1, Const.«Object»),
  (Const.«penetrates», 2, Const.«Object»),
  (Const.«WhereFn», 1, Const.«Physical»),
  (Const.«WhereFn», 2, Const.«TimePoint»),
  (Const.«possesses», 1, Const.«AutonomousAgent»),
  (Const.«possesses», 2, Const.«Object»),
  (Const.«PropertyFn», 1, Const.«AutonomousAgent»),
  (Const.«prevents», 1, Const.«Process»),
  (Const.«hinders», 1, Const.«Process»),
  (Const.«refers», 1, Const.«Entity»),
  (Const.«refers», 2, Const.«Entity»),
  (Const.«names», 1, Const.«SymbolicString»),
  (Const.«names», 2, Const.«Entity»),
  (Const.«uniqueIdentifier», 1, Const.«SymbolicString»),
  (Const.«uniqueIdentifier», 2, Const.«Entity»),
  (Const.«represents», 1, Const.«Entity»),
  (Const.«represents», 2, Const.«Entity»),
  (Const.«representsForAgent», 1, Const.«Entity»),
  (Const.«representsForAgent», 2, Const.«Entity»),
  (Const.«representsForAgent», 3, Const.«AutonomousAgent»),
  (Const.«representsInLanguage», 1, Const.«LinguisticExpression»),
  (Const.«representsInLanguage», 2, Const.«Entity»),
  (Const.«representsInLanguage», 3, Const.«Language»),
  (Const.«equivalentContentInstance», 1, Const.«ContentBearingPhysical»),
  (Const.«equivalentContentInstance», 2, Const.«ContentBearingPhysical»),
  (Const.«subsumesContentInstance», 1, Const.«ContentBearingPhysical»),
  (Const.«subsumesContentInstance», 2, Const.«ContentBearingPhysical»),
  (Const.«realization», 1, Const.«Process»),
  (Const.«realization», 2, Const.«Proposition»),
  (Const.«expressedInLanguage», 1, Const.«LinguisticExpression»),
  (Const.«expressedInLanguage», 2, Const.«Language»),
  (Const.«subProposition», 1, Const.«Proposition»),
  (Const.«subProposition», 2, Const.«Proposition»),
  (Const.«subPlan», 1, Const.«Plan»),
  (Const.«subPlan», 2, Const.«Plan»),
  (Const.«uses», 1, Const.«Object»),
  (Const.«uses», 2, Const.«AutonomousAgent»),
  (Const.«MultiplicationFn», 1, Const.«RealNumber»),
  (Const.«MultiplicationFn», 2, Const.«RealNumber»),
  (Const.«AdditionFn», 1, Const.«RealNumber»),
  (Const.«AdditionFn», 2, Const.«RealNumber»),
  (Const.«SubtractionFn», 1, Const.«RealNumber»),
  (Const.«SubtractionFn», 2, Const.«RealNumber»),
  (Const.«DivisionFn», 1, Const.«RealNumber»),
  (Const.«DivisionFn», 2, Const.«RealNumber»),
  (Const.«AbsoluteValueFn», 1, Const.«RealNumber»),
  (Const.«CeilingFn», 1, Const.«RealNumber»),
  (Const.«CosineFn», 1, Const.«PlaneAngleMeasure»),
  (Const.«DenominatorFn», 1, Const.«RealNumber»),
  (Const.«ExponentiationFn», 1, Const.«RealNumber»),
  (Const.«ExponentiationFn», 2, Const.«Integer»),
  (Const.«FloorFn», 1, Const.«RealNumber»),
  (Const.«GreatestCommonDivisorFn», 1, Const.«Integer»),
  (Const.«multiplicativeFactor», 1, Const.«Integer»),
  (Const.«multiplicativeFactor», 2, Const.«Integer»),
  (Const.«ImaginaryPartFn», 1, Const.«ComplexNumber»),
  (Const.«IntegerSquareRootFn», 1, Const.«RealNumber»),
  (Const.«LeastCommonMultipleFn», 1, Const.«Integer»),
  (Const.«LogFn», 1, Const.«RealNumber»),
  (Const.«LogFn», 2, Const.«PositiveInteger»),
  (Const.«MaxFn», 1, Const.«Number»),
  (Const.«MaxFn», 2, Const.«Number»),
  (Const.«MinFn», 1, Const.«Number»),
  (Const.«MinFn», 2, Const.«Number»),
  (Const.«NumeratorFn», 1, Const.«RealNumber»),
  (Const.«RationalNumberFn», 1, Const.«Number»),
  (Const.«RealNumberFn», 1, Const.«Number»),
  (Const.«ReciprocalFn», 1, Const.«RealNumber»),
  (Const.«RemainderFn», 1, Const.«Integer»),
  (Const.«RemainderFn», 2, Const.«Integer»),
  (Const.«RoundFn», 1, Const.«RealNumber»),
  (Const.«SignumFn», 1, Const.«RealNumber»),
  (Const.«SineFn», 1, Const.«RealNumber»),
  (Const.«SquareRootFn», 1, Const.«RealNumber»),
  (Const.«TangentFn», 1, Const.«RealNumber»),
  (Const.«ArcTangentFn», 1, Const.«RealNumber»),
  (Const.«ArcCosineFn», 1, Const.«RealNumber»),
  (Const.«ArcSineFn», 1, Const.«RealNumber»),
  (Const.«identityElement», 1, Const.«BinaryFunction»),
  (Const.«identityElement», 2, Const.«Integer»),
  (Const.«SuccessorFn», 1, Const.«Integer»),
  (Const.«PredecessorFn», 1, Const.«Integer»),
  (Const.«average», 1, Const.«List»),
  (Const.«average», 2, Const.«RealNumber»),
  (Const.«subset», 1, Const.«Set»),
  (Const.«subset», 2, Const.«Set»),
  (Const.«element», 1, Const.«Entity»),
  (Const.«element», 2, Const.«Set»),
  (Const.«UnionFn», 1, Const.«SetOrClass»),
  (Const.«UnionFn», 2, Const.«SetOrClass»),
  (Const.«IntersectionFn», 1, Const.«SetOrClass»),
  (Const.«IntersectionFn», 2, Const.«SetOrClass»),
  (Const.«RelativeComplementFn», 1, Const.«SetOrClass»),
  (Const.«RelativeComplementFn», 2, Const.«SetOrClass»),
  (Const.«ComplementFn», 1, Const.«SetOrClass»),
  (Const.«CardinalityFn», 1, Const.«SetOrClass»),
  (Const.«KappaFn», 1, Const.«SymbolicString»),
  (Const.«KappaFn», 2, Const.«Formula»),
  (Const.«links», 1, Const.«GraphNode»),
  (Const.«links», 2, Const.«GraphNode»),
  (Const.«links», 3, Const.«GraphArc»),
  (Const.«graphPart», 1, Const.«GraphElement»),
  (Const.«graphPart», 2, Const.«Graph»),
  (Const.«subGraph», 1, Const.«Graph»),
  (Const.«subGraph», 2, Const.«Graph»),
  (Const.«pathLength», 1, Const.«GraphPath»),
  (Const.«pathLength», 2, Const.«PositiveInteger»),
  (Const.«InitialNodeFn», 1, Const.«GraphArc»),
  (Const.«TerminalNodeFn», 1, Const.«GraphArc»),
  (Const.«BeginNodeFn», 1, Const.«GraphPath»),
  (Const.«EndNodeFn», 1, Const.«GraphPath»),
  (Const.«arcWeight», 1, Const.«GraphArc»),
  (Const.«arcWeight», 2, Const.«RealNumber»),
  (Const.«PathWeightFn», 1, Const.«GraphPath»),
  (Const.«MinimalWeightedPathFn», 1, Const.«GraphNode»),
  (Const.«MinimalWeightedPathFn», 2, Const.«GraphNode»),
  (Const.«MaximalWeightedPathFn», 1, Const.«GraphNode»),
  (Const.«MaximalWeightedPathFn», 2, Const.«GraphNode»),
  (Const.«GraphPathFn», 1, Const.«GraphNode»),
  (Const.«GraphPathFn», 2, Const.«GraphNode»),
  (Const.«CutSetFn», 1, Const.«Graph»),
  (Const.«MinimalCutSetFn», 1, Const.«Graph»),
  (Const.«abstractCounterpart», 1, Const.«Abstract»),
  (Const.«abstractCounterpart», 2, Const.«Physical»),
  (Const.«subSystem», 1, Const.«PhysicalSystem»),
  (Const.«subSystem», 2, Const.«PhysicalSystem»),
  (Const.«systemPart», 1, Const.«Physical»),
  (Const.«systemPart», 2, Const.«PhysicalSystem»),
  (Const.«graphMeasure», 1, Const.«Graph»),
  (Const.«graphMeasure», 2, Const.«UnitOfMeasure»),
  (Const.«MeasureFn», 1, Const.«RealNumber»),
  (Const.«MeasureFn», 2, Const.«UnitOfMeasure»),
  (Const.«KiloFn», 1, Const.«UnitOfMeasure»),
  (Const.«MegaFn», 1, Const.«UnitOfMeasure»),
  (Const.«GigaFn», 1, Const.«UnitOfMeasure»),
  (Const.«TeraFn», 1, Const.«UnitOfMeasure»),
  (Const.«MilliFn», 1, Const.«UnitOfMeasure»),
  (Const.«MicroFn», 1, Const.«UnitOfMeasure»),
  (Const.«NanoFn», 1, Const.«UnitOfMeasure»),
  (Const.«PicoFn», 1, Const.«UnitOfMeasure»),
  (Const.«IntervalFn», 1, Const.«ConstantQuantity»),
  (Const.«IntervalFn», 2, Const.«ConstantQuantity»),
  (Const.«UnitFn», 1, Const.«PhysicalQuantity»),
  (Const.«PerFn», 1, Const.«PhysicalQuantity»),
  (Const.«PerFn», 2, Const.«PhysicalQuantity»),
  (Const.«DensityFn», 1, Const.«MassMeasure»),
  (Const.«DensityFn», 2, Const.«VolumeMeasure»),
  (Const.«SpeedFn», 1, Const.«LengthMeasure»),
  (Const.«SpeedFn», 2, Const.«TimeDuration»),
  (Const.«VelocityFn», 1, Const.«LengthMeasure»),
  (Const.«VelocityFn», 2, Const.«TimeDuration»),
  (Const.«VelocityFn», 3, Const.«Region»),
  (Const.«VelocityFn», 4, Const.«DirectionalAttribute»),
  (Const.«weight», 1, Const.«SelfConnectedObject»),
  (Const.«weight», 2, Const.«MassMeasure»),
  (Const.«measure», 1, Const.«Physical»),
  (Const.«measure», 2, Const.«PhysicalQuantity»),
  (Const.«age», 1, Const.«Physical»),
  (Const.«age», 2, Const.«TimeDuration»),
  (Const.«linearExtent», 1, Const.«Physical»),
  (Const.«linearExtent», 2, Const.«LengthMeasure»),
  (Const.«width», 1, Const.«Physical»),
  (Const.«width», 2, Const.«LengthMeasure»),
  (Const.«height», 1, Const.«SelfConnectedObject»),
  (Const.«height», 2, Const.«LengthMeasure»),
  (Const.«length», 1, Const.«Physical»),
  (Const.«length», 2, Const.«LengthMeasure»),
  (Const.«AmountsFn», 2, Const.«CorpuscularObject»),
  (Const.«AmountsFn», 3, Const.«UnitOfMass»),
  (Const.«amount», 2, Const.«CorpuscularObject»),
  (Const.«amount», 3, Const.«MassMeasure»),
  (Const.«shape», 1, Const.«Physical»),
  (Const.«shape», 2, Const.«ShapeAttribute»),
  (Const.«CenterOfCircleFn», 1, Const.«Circle»),
  (Const.«radius», 1, Const.«Circle»),
  (Const.«radius», 2, Const.«LengthMeasure»),
  (Const.«diameter», 1, Const.«Circle»),
  (Const.«diameter», 2, Const.«LengthMeasure»),
  (Const.«distance», 1, Const.«Physical»),
  (Const.«distance», 2, Const.«Physical»),
  (Const.«distance», 3, Const.«LengthMeasure»),
  (Const.«altitude», 1, Const.«Physical»),
  (Const.«altitude», 2, Const.«Physical»),
  (Const.«altitude», 3, Const.«LengthMeasure»),
  (Const.«depth», 1, Const.«Physical»),
  (Const.«depth», 2, Const.«Physical»),
  (Const.«depth», 3, Const.«LengthMeasure»),
  (Const.«larger», 1, Const.«Object»),
  (Const.«larger», 2, Const.«Object»),
  (Const.«smaller», 1, Const.«Object»),
  (Const.«smaller», 2, Const.«Object»),
  (Const.«monetaryValue», 1, Const.«Physical»),
  (Const.«monetaryValue», 2, Const.«CurrencyMeasure»),
  (Const.«WealthFn», 1, Const.«AutonomousAgent»),
  (Const.«barometricPressure», 1, Const.«Object»),
  (Const.«barometricPressure», 2, Const.«PhysicalQuantity»),
  (Const.«duration», 1, Const.«TimeInterval»),
  (Const.«duration», 2, Const.«TimeDuration»),
  (Const.«frequency», 2, Const.«TimeDuration»),
  (Const.«temporalPart», 1, Const.«TimePosition»),
  (Const.«temporalPart», 2, Const.«TimePosition»),
  (Const.«BeginFn», 1, Const.«TimeInterval»),
  (Const.«EndFn», 1, Const.«TimeInterval»),
  (Const.«starts», 1, Const.«TimeInterval»),
  (Const.«starts», 2, Const.«TimeInterval»),
  (Const.«finishes», 1, Const.«TimeInterval»),
  (Const.«finishes», 2, Const.«TimeInterval»),
  (Const.«finishesDuring», 1, Const.«TimeInterval»),
  (Const.«finishesDuring», 2, Const.«TimeInterval»),
  (Const.«startsDuring», 1, Const.«TimeInterval»),
  (Const.«startsDuring», 2, Const.«TimeInterval»),
  (Const.«before», 1, Const.«TimePoint»),
  (Const.«before», 2, Const.«TimePoint»),
  (Const.«beforeOrEqual», 1, Const.«TimePoint»),
  (Const.«beforeOrEqual», 2, Const.«TimePoint»),
  (Const.«temporallyBetween», 1, Const.«TimePoint»),
  (Const.«temporallyBetween», 2, Const.«TimePoint»),
  (Const.«temporallyBetween», 3, Const.«TimePoint»),
  (Const.«temporallyBetweenOrEqual», 1, Const.«TimePoint»),
  (Const.«temporallyBetweenOrEqual», 2, Const.«TimePoint»),
  (Const.«temporallyBetweenOrEqual», 3, Const.«TimePoint»),
  (Const.«overlapsTemporally», 1, Const.«TimeInterval»),
  (Const.«overlapsTemporally», 2, Const.«TimeInterval»),
  (Const.«during», 1, Const.«TimeInterval»),
  (Const.«during», 2, Const.«TimeInterval»),
  (Const.«meetsTemporally», 1, Const.«TimeInterval»),
  (Const.«meetsTemporally», 2, Const.«TimeInterval»),
  (Const.«earlier», 1, Const.«TimeInterval»),
  (Const.«earlier», 2, Const.«TimeInterval»),
  (Const.«cooccur», 1, Const.«Physical»),
  (Const.«cooccur», 2, Const.«Physical»),
  (Const.«TimeIntervalFn», 1, Const.«TimePoint»),
  (Const.«TimeIntervalFn», 2, Const.«TimePoint»),
  (Const.«WhenFn», 1, Const.«Physical»),
  (Const.«PastFn», 1, Const.«TimePosition»),
  (Const.«ImmediatePastFn», 1, Const.«TimePosition»),
  (Const.«FutureFn», 1, Const.«TimePosition»),
  (Const.«ImmediateFutureFn», 1, Const.«TimePosition»),
  (Const.«date», 1, Const.«Physical»),
  (Const.«date», 2, Const.«Day»),
  (Const.«YearFn», 1, Const.«Integer»),
  (Const.«DayFn», 1, Const.«PositiveInteger»),
  (Const.«HourFn», 1, Const.«NonnegativeInteger»),
  (Const.«MinuteFn», 1, Const.«NonnegativeInteger»),
  (Const.«SecondFn», 1, Const.«PositiveInteger»),
  (Const.«MorningFn», 1, Const.«Day»),
  (Const.«AfternoonFn», 1, Const.«Day»),
  (Const.«EveningFn», 1, Const.«Day»),
  (Const.«WeekFn», 1, Const.«PositiveInteger»),
  (Const.«QuarterFn», 1, Const.«PositiveInteger»),
  (Const.«successorClass», 1, Const.«Class»),
  (Const.«successorClass», 2, Const.«Class»),
  (Const.«TemporalCompositionFn», 1, Const.«TimeInterval»),
  (Const.«connected», 1, Const.«Object»),
  (Const.«connected», 2, Const.«Object»),
  (Const.«connects», 1, Const.«Object»),
  (Const.«connects», 2, Const.«Object»),
  (Const.«connects», 3, Const.«Object»),
  (Const.«meetsSpatially», 1, Const.«Object»),
  (Const.«meetsSpatially», 2, Const.«Object»),
  (Const.«overlapsPartially», 1, Const.«Object»),
  (Const.«overlapsPartially», 2, Const.«Object»),
  (Const.«superficialPart», 1, Const.«Object»),
  (Const.«superficialPart», 2, Const.«Object»),
  (Const.«surface», 1, Const.«SelfConnectedObject»),
  (Const.«surface», 2, Const.«SelfConnectedObject»),
  (Const.«interiorPart», 1, Const.«Object»),
  (Const.«interiorPart», 2, Const.«Object»),
  (Const.«bottom», 1, Const.«SelfConnectedObject»),
  (Const.«bottom», 2, Const.«SelfConnectedObject»),
  (Const.«top», 1, Const.«SelfConnectedObject»),
  (Const.«top», 2, Const.«SelfConnectedObject»),
  (Const.«side», 1, Const.«SelfConnectedObject»),
  (Const.«side», 2, Const.«SelfConnectedObject»),
  (Const.«MereologicalSumFn», 1, Const.«Object»),
  (Const.«MereologicalSumFn», 2, Const.«Object»),
  (Const.«MereologicalProductFn», 1, Const.«Object»),
  (Const.«MereologicalProductFn», 2, Const.«Object»),
  (Const.«MereologicalDifferenceFn», 1, Const.«Object»),
  (Const.«MereologicalDifferenceFn», 2, Const.«Object»),
  (Const.«HoleHostFn», 1, Const.«HoleRegion»),
  (Const.«partiallyFills», 1, Const.«Object»),
  (Const.«partiallyFills», 2, Const.«HoleRegion»),
  (Const.«completelyFills», 1, Const.«Object»),
  (Const.«completelyFills», 2, Const.«HoleRegion»),
  (Const.«fills», 1, Const.«Object»),
  (Const.«fills», 2, Const.«HoleRegion»),
  (Const.«HoleSkinFn», 1, Const.«HoleRegion»),
  (Const.«pathologicSymptom», 1, Const.«DiseaseOrSyndrome»),
  (Const.«expects», 1, Const.«CognitiveAgent»),
  (Const.«expects», 2, Const.«Formula»),
  (Const.«moves», 1, Const.«Motion»),
  (Const.«moves», 2, Const.«Object»),
  (Const.«changesLocation», 1, Const.«Translocation»),
  (Const.«changesLocation», 2, Const.«Object»),
  (Const.«path», 1, Const.«Motion»),
  (Const.«path», 2, Const.«Object»),
  (Const.«surfaceWindSpeed», 1, Const.«Object»),
  (Const.«surfaceWindSpeed», 2, Const.«PhysicalQuantity»),
  (Const.«objectTransferred», 1, Const.«Transfer»),
  (Const.«objectTransferred», 2, Const.«Object»),
  (Const.«grasps», 1, Const.«Animal»),
  (Const.«grasps», 2, Const.«Object»),
  (Const.«transactionAmount», 1, Const.«FinancialTransaction»),
  (Const.«transactionAmount», 2, Const.«CurrencyMeasure»),
  (Const.«objectAttached», 1, Const.«Process»),
  (Const.«objectAttached», 2, Const.«Entity»),
  (Const.«objectDetached», 1, Const.«Process»),
  (Const.«objectDetached», 2, Const.«Entity»),
  (Const.«attends», 1, Const.«Demonstrating»),
  (Const.«attends», 2, Const.«Human»),
  (Const.«atomicNumber», 2, Const.«PositiveInteger»),
  (Const.«boilingPoint», 2, Const.«TemperatureMeasure»),
  (Const.«meltingPoint», 2, Const.«TemperatureMeasure»),
  (Const.«geographicSubregion», 1, Const.«GeographicArea»),
  (Const.«geographicSubregion», 2, Const.«GeographicArea»),
  (Const.«geopoliticalSubdivision», 1, Const.«GeopoliticalArea»),
  (Const.«geopoliticalSubdivision», 2, Const.«GeopoliticalArea»),
  (Const.«developmentalForm», 1, Const.«OrganicObject»),
  (Const.«developmentalForm», 2, Const.«DevelopmentalAttribute»),
  (Const.«inhabits», 1, Const.«Organism»),
  (Const.«inhabits», 2, Const.«Object»),
  (Const.«home», 1, Const.«Human»),
  (Const.«home», 2, Const.«PermanentResidence»),
  (Const.«stays», 1, Const.«Human»),
  (Const.«stays», 2, Const.«TemporaryResidence»),
  (Const.«BodySideFn», 1, Const.«AntiSymmetricPositionalAttribute»),
  (Const.«authors», 1, Const.«AutonomousAgent»),
  (Const.«editor», 1, Const.«AutonomousAgent»),
  (Const.«publishes», 1, Const.«Organization»),
  (Const.«EditionFn», 2, Const.«PositiveInteger»),
  (Const.«covers», 1, Const.«Object»),
  (Const.«covers», 2, Const.«Object»),
  (Const.«wears», 1, Const.«Animal»),
  (Const.«wears», 2, Const.«WearableItem»),
  (Const.«engineeringSubcomponent», 1, Const.«EngineeringComponent»),
  (Const.«engineeringSubcomponent», 2, Const.«EngineeringComponent»),
  (Const.«connectedEngineeringComponents», 1, Const.«EngineeringComponent»),
  (Const.«connectedEngineeringComponents», 2, Const.«EngineeringComponent»),
  (Const.«connectsEngineeringComponents», 1, Const.«EngineeringConnection»),
  (Const.«connectsEngineeringComponents», 2, Const.«EngineeringComponent»),
  (Const.«connectsEngineeringComponents», 3, Const.«EngineeringComponent»),
  (Const.«ImmediateFamilyFn», 1, Const.«Human»),
  (Const.«relative», 1, Const.«Organism»),
  (Const.«relative», 2, Const.«Organism»),
  (Const.«familyRelation», 1, Const.«Organism»),
  (Const.«familyRelation», 2, Const.«Organism»),
  (Const.«ancestor», 1, Const.«Organism»),
  (Const.«ancestor», 2, Const.«Organism»),
  (Const.«parent», 1, Const.«Organism»),
  (Const.«parent», 2, Const.«Organism»),
  (Const.«mother», 1, Const.«Organism»),
  (Const.«mother», 2, Const.«Organism»),
  (Const.«father», 1, Const.«Organism»),
  (Const.«father», 2, Const.«Organism»),
  (Const.«daughter», 1, Const.«Organism»),
  (Const.«daughter», 2, Const.«Organism»),
  (Const.«son», 1, Const.«Organism»),
  (Const.«son», 2, Const.«Organism»),
  (Const.«sibling», 1, Const.«Organism»),
  (Const.«sibling», 2, Const.«Organism»),
  (Const.«brother», 1, Const.«Man»),
  (Const.«brother», 2, Const.«Human»),
  (Const.«sister», 1, Const.«Woman»),
  (Const.«sister», 2, Const.«Human»),
  (Const.«legalRelation», 1, Const.«Human»),
  (Const.«legalRelation», 2, Const.«Human»),
  (Const.«acquaintance», 1, Const.«Human»),
  (Const.«acquaintance», 2, Const.«Human»),
  (Const.«mutualAcquaintance», 1, Const.«Human»),
  (Const.«mutualAcquaintance», 2, Const.«Human»),
  (Const.«spouse», 1, Const.«Human»),
  (Const.«spouse», 2, Const.«Human»),
  (Const.«husband», 1, Const.«Man»),
  (Const.«husband», 2, Const.«Woman»),
  (Const.«wife», 1, Const.«Woman»),
  (Const.«wife», 2, Const.«Man»),
  (Const.«employs», 1, Const.«AutonomousAgent»),
  (Const.«employs», 2, Const.«CognitiveAgent»),
  (Const.«GovernmentFn», 1, Const.«GeopoliticalArea»),
  (Const.«subOrganization», 1, Const.«Organization»),
  (Const.«subOrganization», 2, Const.«Organization»),
  (Const.«citizen», 1, Const.«Human»),
  (Const.«citizen», 2, Const.«Nation»),
  (Const.«premise», 1, Const.«Argument»),
  (Const.«premise», 2, Const.«Proposition»),
  (Const.«PremisesFn», 1, Const.«Argument»),
  (Const.«conclusion», 1, Const.«Argument»),
  (Const.«conclusion», 2, Const.«Proposition»),
  (Const.«consistent», 1, Const.«Proposition»),
  (Const.«consistent», 2, Const.«Proposition»),
  (Const.«orientation», 1, Const.«Object»),
  (Const.«orientation», 2, Const.«Object»),
  (Const.«orientation», 3, Const.«PositionalAttribute»),
  (Const.«direction», 1, Const.«Process»),
  (Const.«direction», 2, Const.«PositionalAttribute»),
  (Const.«faces», 1, Const.«Object»),
  (Const.«faces», 2, Const.«DirectionalAttribute»),
  (Const.«truth», 1, Const.«Sentence»),
  (Const.«truth», 2, Const.«TruthValue»),
  (Const.«RelativeTimeFn», 1, Const.«TimePosition»),
  (Const.«RelativeTimeFn», 2, Const.«TimeZone»),
  (Const.«occupiesPosition», 1, Const.«Human»),
  (Const.«occupiesPosition», 2, Const.«Position»),
  (Const.«occupiesPosition», 3, Const.«Organization»),
  (Const.«modalAttribute», 1, Const.«Formula»),
  (Const.«modalAttribute», 2, Const.«NormativeAttribute»),
  (Const.«holdsRight», 1, Const.«Formula»),
  (Const.«holdsRight», 2, Const.«CognitiveAgent»),
  (Const.«confersRight», 1, Const.«Formula»),
  (Const.«confersRight», 2, Const.«Entity»),
  (Const.«confersRight», 3, Const.«CognitiveAgent»),
  (Const.«holdsObligation», 1, Const.«Formula»),
  (Const.«holdsObligation», 2, Const.«CognitiveAgent»),
  (Const.«confersObligation», 1, Const.«Formula»),
  (Const.«confersObligation», 2, Const.«Entity»),
  (Const.«confersObligation», 3, Const.«CognitiveAgent»),
  (Const.«geometricPart», 1, Const.«GeometricFigure»),
  (Const.«geometricPart», 2, Const.«GeometricFigure»),
  (Const.«pointOfFigure», 1, Const.«GeometricPoint»),
  (Const.«pointOfFigure», 2, Const.«GeometricFigure»),
  (Const.«angleOfFigure», 1, Const.«TwoDimensionalAngle»),
  (Const.«angleOfFigure», 2, Const.«GeometricFigure»),
  (Const.«pointOfIntersection», 1, Const.«OneDimensionalFigure»),
  (Const.«pointOfIntersection», 2, Const.«OneDimensionalFigure»),
  (Const.«pointOfIntersection», 3, Const.«GeometricPoint»),
  (Const.«parallel», 1, Const.«StraightLine»),
  (Const.«parallel», 2, Const.«StraightLine»),
  (Const.«angularMeasure», 1, Const.«TwoDimensionalAngle»),
  (Const.«angularMeasure», 2, Const.«AngleMeasure»),
  (Const.«relativeAngle», 1, Const.«Object»),
  (Const.«relativeAngle», 2, Const.«Object»),
  (Const.«relativeAngle», 3, Const.«RealNumber»),
  (Const.«physicalEnd», 1, Const.«Object»),
  (Const.«physicalEnd», 2, Const.«Object»),
  (Const.«lineMeasure», 1, Const.«OneDimensionalFigure»),
  (Const.«lineMeasure», 2, Const.«LengthMeasure»),
  (Const.«geometricDistance», 1, Const.«GeometricPoint»),
  (Const.«geometricDistance», 2, Const.«GeometricPoint»),
  (Const.«geometricDistance», 3, Const.«LengthMeasure»),
  (Const.«comment», 1, Const.«Entity»),
  (Const.«comment», 2, Const.«SymbolicString»),
  (Const.«comment», 3, Const.«SymbolicString»),
  (Const.«minValue», 1, Const.«Predicate»),
  (Const.«minValue», 2, Const.«Integer»),
  (Const.«minValue», 3, Const.«Quantity»),
  (Const.«maxValue», 1, Const.«Predicate»),
  (Const.«maxValue», 2, Const.«Integer»),
  (Const.«maxValue», 3, Const.«Quantity»),
  (Const.«defaultMinValue», 1, Const.«Predicate»),
  (Const.«defaultMinValue», 2, Const.«Integer»),
  (Const.«defaultMinValue», 3, Const.«Quantity»),
  (Const.«defaultMaxValue», 1, Const.«Predicate»),
  (Const.«defaultMaxValue», 2, Const.«Integer»),
  (Const.«defaultMaxValue», 3, Const.«Quantity»),
  (Const.«defaultValue», 1, Const.«Predicate»),
  (Const.«defaultValue», 2, Const.«Integer»),
  (Const.«defaultValue», 3, Const.«Quantity»)
 ]
def domainSubclassDecls : List (Obj × Nat × Obj) :=
 [
  (Const.«rangeSubclass», 2, Const.«Class»),
  (Const.«exhaustiveAttribute», 1, Const.«Attribute»),
  (Const.«material», 1, Const.«Substance»),
  (Const.«ingredient», 1, Const.«Substance»),
  (Const.«ingredient», 2, Const.«Substance»),
  (Const.«substanceElement», 1, Const.«CorpuscularObject»),
  (Const.«substanceElement», 2, Const.«Substance»),
  (Const.«AttrFn», 1, Const.«Object»),
  (Const.«causesSubclass», 1, Const.«Process»),
  (Const.«causesSubclass», 2, Const.«Process»),
  (Const.«capability», 1, Const.«Process»),
  (Const.«hasSkill», 1, Const.«Process»),
  (Const.«precondition», 1, Const.«Process»),
  (Const.«precondition», 2, Const.«Process»),
  (Const.«hindersSubclass», 1, Const.«Process»),
  (Const.«hindersSubclass», 2, Const.«Process»),
  (Const.«preventsSubclass», 1, Const.«Process»),
  (Const.«preventsSubclass», 2, Const.«Process»),
  (Const.«prevents», 2, Const.«Process»),
  (Const.«hinders», 2, Const.«Process»),
  (Const.«equivalentContentClass», 1, Const.«ContentBearingPhysical»),
  (Const.«equivalentContentClass», 2, Const.«ContentBearingPhysical»),
  (Const.«subsumesContentClass», 1, Const.«ContentBearingPhysical»),
  (Const.«subsumesContentClass», 2, Const.«ContentBearingPhysical»),
  (Const.«GeneralizedUnionFn», 1, Const.«SetOrClass»),
  (Const.«GeneralizedIntersectionFn», 1, Const.«SetOrClass»),
  (Const.«AmountsFn», 1, Const.«Substance»),
  (Const.«amount», 1, Const.«Substance»),
  (Const.«frequency», 1, Const.«Process»),
  (Const.«RecurrentTimeIntervalFn», 1, Const.«TimeInterval»),
  (Const.«RecurrentTimeIntervalFn», 2, Const.«TimeInterval»),
  (Const.«MonthFn», 1, Const.«Month»),
  (Const.«MonthFn», 2, Const.«Year»),
  (Const.«DayFn», 2, Const.«Month»),
  (Const.«HourFn», 2, Const.«Day»),
  (Const.«MinuteFn», 2, Const.«Hour»),
  (Const.«SecondFn», 2, Const.«Minute»),
  (Const.«WeekFn», 2, Const.«Year»),
  (Const.«QuarterFn», 2, Const.«Year»),
  (Const.«TemporalCompositionFn», 2, Const.«TimeInterval»),
  (Const.«pathologicSymptom», 2, Const.«PathologicProcess»),
  (Const.«ImpairmentFn», 1, Const.«PhysiologicProcess»),
  (Const.«SenseImpairmentFn», 1, Const.«Perception»),
  (Const.«SenseInabilityFn», 1, Const.«Perception»),
  (Const.«atomicNumber», 1, Const.«ElementalSubstance»),
  (Const.«boilingPoint», 1, Const.«PureSubstance»),
  (Const.«meltingPoint», 1, Const.«PureSubstance»),
  (Const.«FoodForFn», 1, Const.«Organism»),
  (Const.«BodySideFn», 2, Const.«BodyPart»),
  (Const.«authors», 2, Const.«ContentBearingObject»),
  (Const.«editor», 2, Const.«Text»),
  (Const.«publishes», 2, Const.«Text»),
  (Const.«EditionFn», 1, Const.«ContentBearingObject»),
  (Const.«version», 1, Const.«Artifact»),
  (Const.«version», 2, Const.«Artifact»),
  (Const.«ImpairedBodyPartFn», 1, Const.«BodyPart»),
  (Const.«DeadOrMissingBodyPartFn», 1, Const.«BodyPart»),
  (Const.«MakingFn», 1, Const.«Making»),
  (Const.«DeadFn», 1, Const.«OrganicObject»)
 ]
def rangeDecls : List (Obj × Obj) :=
 [
  (Const.«AssignmentFn», Const.«Entity»),
  (Const.«FrontFn», Const.«SelfConnectedObject»),
  (Const.«BackFn», Const.«SelfConnectedObject»),
  (Const.«ExtensionFn», Const.«Class»),
  (Const.«ProbabilityFn», Const.«RealNumber»),
  (Const.«ListFn», Const.«List»),
  (Const.«ListOrderFn», Const.«Entity»),
  (Const.«ListLengthFn», Const.«NonnegativeInteger»),
  (Const.«ListConcatenateFn», Const.«List»),
  (Const.«SubListFn», Const.«List»),
  (Const.«LastFn», Const.«Entity»),
  (Const.«FirstFn», Const.«Entity»),
  (Const.«ListSumFn», Const.«RealNumber»),
  (Const.«AverageFn», Const.«RealNumber»),
  (Const.«WhereFn», Const.«Region»),
  (Const.«PropertyFn», Const.«Set»),
  (Const.«MultiplicationFn», Const.«RealNumber»),
  (Const.«AdditionFn», Const.«RealNumber»),
  (Const.«SubtractionFn», Const.«RealNumber»),
  (Const.«DivisionFn», Const.«RealNumber»),
  (Const.«AbsoluteValueFn», Const.«NonnegativeRealNumber»),
  (Const.«CeilingFn», Const.«Integer»),
  (Const.«CosineFn», Const.«RealNumber»),
  (Const.«DenominatorFn», Const.«Integer»),
  (Const.«ExponentiationFn», Const.«RealNumber»),
  (Const.«FloorFn», Const.«Integer»),
  (Const.«GreatestCommonDivisorFn», Const.«Integer»),
  (Const.«ImaginaryPartFn», Const.«ImaginaryNumber»),
  (Const.«IntegerSquareRootFn», Const.«NonnegativeInteger»),
  (Const.«LeastCommonMultipleFn», Const.«Integer»),
  (Const.«LogFn», Const.«RealNumber»),
  (Const.«MaxFn», Const.«Number»),
  (Const.«MinFn», Const.«Number»),
  (Const.«NumeratorFn», Const.«Integer»),
  (Const.«RationalNumberFn», Const.«RationalNumber»),
  (Const.«RealNumberFn», Const.«RealNumber»),
  (Const.«ReciprocalFn», Const.«RealNumber»),
  (Const.«RemainderFn», Const.«Integer»),
  (Const.«RoundFn», Const.«RealNumber»),
  (Const.«SignumFn», Const.«Integer»),
  (Const.«SineFn», Const.«RealNumber»),
  (Const.«SquareRootFn», Const.«RealNumber»),
  (Const.«TangentFn», Const.«RealNumber»),
  (Const.«ArcTangentFn», Const.«RealNumber»),
  (Const.«ArcCosineFn», Const.«RealNumber»),
  (Const.«ArcSineFn», Const.«RealNumber»),
  (Const.«SuccessorFn», Const.«Integer»),
  (Const.«PredecessorFn», Const.«Integer»),
  (Const.«UnionFn», Const.«SetOrClass»),
  (Const.«IntersectionFn», Const.«SetOrClass»),
  (Const.«RelativeComplementFn», Const.«SetOrClass»),
  (Const.«ComplementFn», Const.«SetOrClass»),
  (Const.«GeneralizedUnionFn», Const.«SetOrClass»),
  (Const.«GeneralizedIntersectionFn», Const.«SetOrClass»),
  (Const.«CardinalityFn», Const.«Integer»),
  (Const.«KappaFn», Const.«Class»),
  (Const.«InitialNodeFn», Const.«GraphNode»),
  (Const.«TerminalNodeFn», Const.«GraphNode»),
  (Const.«BeginNodeFn», Const.«GraphNode»),
  (Const.«EndNodeFn», Const.«GraphNode»),
  (Const.«PathWeightFn», Const.«RealNumber»),
  (Const.«MinimalWeightedPathFn», Const.«GraphPath»),
  (Const.«MaximalWeightedPathFn», Const.«GraphPath»),
  (Const.«MeasureFn», Const.«PhysicalQuantity»),
  (Const.«KiloFn», Const.«UnitOfMeasure»),
  (Const.«MegaFn», Const.«UnitOfMeasure»),
  (Const.«GigaFn», Const.«UnitOfMeasure»),
  (Const.«TeraFn», Const.«UnitOfMeasure»),
  (Const.«MilliFn», Const.«UnitOfMeasure»),
  (Const.«MicroFn», Const.«UnitOfMeasure»),
  (Const.«NanoFn», Const.«UnitOfMeasure»),
  (Const.«PicoFn», Const.«UnitOfMeasure»),
  (Const.«UnitFn», Const.«UnitOfMeasure»),
  (Const.«PerFn», Const.«FunctionQuantity»),
  (Const.«DensityFn», Const.«FunctionQuantity»),
  (Const.«SpeedFn», Const.«FunctionQuantity»),
  (Const.«VelocityFn», Const.«FunctionQuantity»),
  (Const.«AmountsFn», Const.«List»),
  (Const.«CenterOfCircleFn», Const.«GeometricPoint»),
  (Const.«WealthFn», Const.«CurrencyMeasure»),
  (Const.«BeginFn», Const.«TimePoint»),
  (Const.«EndFn», Const.«TimePoint»),
  (Const.«TimeIntervalFn», Const.«TimeInterval»),
  (Const.«WhenFn», Const.«TimeInterval»),
  (Const.«PastFn», Const.«TimeInterval»),
  (Const.«ImmediatePastFn», Const.«TimeInterval»),
  (Const.«FutureFn», Const.«TimeInterval»),
  (Const.«ImmediateFutureFn», Const.«TimeInterval»),
  (Const.«MorningFn», Const.«Morning»),
  (Const.«AfternoonFn», Const.«Afternoon»),
  (Const.«EveningFn», Const.«Evening»),
  (Const.«MereologicalSumFn», Const.«Object»),
  (Const.«MereologicalProductFn», Const.«Object»),
  (Const.«MereologicalDifferenceFn», Const.«Object»),
  (Const.«HoleHostFn», Const.«Object»),
  (Const.«HoleSkinFn», Const.«Object»),
  (Const.«ImmediateFamilyFn», Const.«FamilyGroup»),
  (Const.«GovernmentFn», Const.«Government»),
  (Const.«PremisesFn», Const.«Formula»),
  (Const.«RelativeTimeFn», Const.«TimePosition»),
  (Const.«ImpairedBodyPartFn», Const.«DiseaseOrSyndrome»),
  (Const.«DeadOrMissingBodyPartFn», Const.«DiseaseOrSyndrome»)
 ]
def rangeSubclassDecls : List (Obj × Obj) :=
 [
  (Const.«PowerSetFn», Const.«SetOrClass»),
  (Const.«AttrFn», Const.«Object»),
  (Const.«GraphPathFn», Const.«GraphPath»),
  (Const.«CutSetFn», Const.«GraphPath»),
  (Const.«MinimalCutSetFn», Const.«GraphPath»),
  (Const.«IntervalFn», Const.«ConstantQuantity»),
  (Const.«RecurrentTimeIntervalFn», Const.«TimeInterval»),
  (Const.«YearFn», Const.«Year»),
  (Const.«MonthFn», Const.«Month»),
  (Const.«DayFn», Const.«Day»),
  (Const.«HourFn», Const.«Hour»),
  (Const.«MinuteFn», Const.«Minute»),
  (Const.«SecondFn», Const.«Second»),
  (Const.«WeekFn», Const.«Week»),
  (Const.«QuarterFn», Const.«QuarterYear»),
  (Const.«TemporalCompositionFn», Const.«TimeInterval»),
  (Const.«ImpairmentFn», Const.«BiologicalProcess»),
  (Const.«SenseImpairmentFn», Const.«PathologicProcess»),
  (Const.«SenseInabilityFn», Const.«PathologicProcess»),
  (Const.«FoodForFn», Const.«SelfConnectedObject»),
  (Const.«BodySideFn», Const.«BodyPart»),
  (Const.«EditionFn», Const.«ContentBearingObject»),
  (Const.«MakingFn», Const.«Object»),
  (Const.«DeadFn», Const.«OrganismRemains»)
 ]
end

axiom ax_1 : Holds (ap (Const.«instance») ([Const.«instance», Const.«BinaryPredicate»]))
axiom ax_2 : Holds (ap (Const.«subrelation») ([Const.«immediateInstance», Const.«instance»]))
axiom ax_3 : Holds (ap (Const.«instance») ([Const.«immediateInstance», Const.«AsymmetricRelation»]))
axiom ax_4 : Holds (ap (Const.«instance») ([Const.«immediateInstance», Const.«IntransitiveRelation»]))
axiom ax_5 : ∀ («?CLASS» : Obj) («?ENTITY» : Obj), Holds (mkImp (ap (Const.«immediateInstance») ([«?ENTITY», «?CLASS»])) (mkNot (mkExists (fun («?SUBCLASS» : Obj) => mkAnd [ap (Const.«subclass») ([«?SUBCLASS», «?CLASS»]), mkNot (ap (Const.«equal») ([«?SUBCLASS», «?CLASS»])), ap (Const.«instance») ([«?ENTITY», «?SUBCLASS»])]))))
axiom ax_6 : Holds (ap (Const.«instance») ([Const.«inverse», Const.«BinaryPredicate»]))
axiom ax_7 : Holds (ap (Const.«instance») ([Const.«inverse», Const.«IrreflexiveRelation»]))
axiom ax_8 : Holds (ap (Const.«instance») ([Const.«inverse», Const.«IntransitiveRelation»]))
axiom ax_9 : Holds (ap (Const.«instance») ([Const.«inverse», Const.«SymmetricRelation»]))
axiom ax_10 : Holds (ap (Const.«instance») ([Const.«inverse», Const.«PartialValuedRelation»]))
axiom ax_11 : Holds (ap (Const.«instance») ([Const.«subclass», Const.«BinaryPredicate»]))
axiom ax_12 : Holds (ap (Const.«instance») ([Const.«subclass», Const.«PartialOrderingRelation»]))
axiom ax_13 : ∀ («?X» : Obj) («?Y» : Obj) («?Z» : Obj), Holds (mkImp (mkAnd [ap (Const.«subclass») ([«?X», «?Y»]), ap (Const.«instance») ([«?Z», «?X»])]) (ap (Const.«instance») ([«?Z», «?Y»])))
axiom ax_14 : Holds (ap (Const.«instance») ([Const.«immediateSubclass», Const.«AsymmetricRelation»]))
axiom ax_15 : Holds (ap (Const.«instance») ([Const.«immediateSubclass», Const.«IntransitiveRelation»]))
axiom ax_16 : Holds (ap (Const.«instance») ([Const.«immediateSubclass», Const.«BinaryPredicate»]))
axiom ax_17 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (ap (Const.«immediateSubclass») ([«?CLASS1», «?CLASS2»])) (mkNot (mkExists (fun («?CLASS3» : Obj) => mkAnd [ap (Const.«subclass») ([«?CLASS3», «?CLASS2»]), ap (Const.«subclass») ([«?CLASS1», «?CLASS3»]), mkNot (ap (Const.«equal») ([«?CLASS2», «?CLASS3»])), mkNot (ap (Const.«equal») ([«?CLASS1», «?CLASS3»]))]))))
axiom ax_18 : Holds (ap (Const.«instance») ([Const.«subrelation», Const.«BinaryPredicate»]))
axiom ax_19 : Holds (ap (Const.«instance») ([Const.«subrelation», Const.«PartialOrderingRelation»]))
axiom ax_20 : ∀ («?NUMBER» : Obj) («?PRED1» : Obj) («?PRED2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?PRED1», «?PRED2»]), ap (Const.«valence») ([«?PRED1», «?NUMBER»])]) (ap (Const.«valence») ([«?PRED2», «?NUMBER»])))
axiom ax_21 : ∀ («?CLASS1» : Obj) («?NUMBER» : Obj) («?PRED1» : Obj) («?PRED2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?PRED1», «?PRED2»]), ap (Const.«domain») ([«?PRED2», «?NUMBER», «?CLASS1»])]) (ap (Const.«domain») ([«?PRED1», «?NUMBER», «?CLASS1»])))
axiom ax_22 : ∀ («?REL1» : Obj) («?REL2» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?REL1», «?REL2»]), ap (Const.«instance») ([«?REL1», Const.«Predicate»]), ap (Const.«instance») ([«?REL2», Const.«Predicate»]), ap («?REL1») («@ROW»)]) (ap («?REL2») («@ROW»)))
axiom ax_23 : ∀ («?CLASS» : Obj) («?PRED1» : Obj) («?PRED2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?PRED1», «?PRED2»]), ap (Const.«instance») ([«?PRED2», «?CLASS»]), ap (Const.«subclass») ([«?CLASS», Const.«InheritableRelation»])]) (ap (Const.«instance») ([«?PRED1», «?CLASS»])))
axiom ax_24 : Holds (ap (Const.«instance») ([Const.«domain», Const.«TernaryPredicate»]))
axiom ax_25 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?NUMBER» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«domain») ([«?REL», «?NUMBER», «?CLASS1»]), ap (Const.«domain») ([«?REL», «?NUMBER», «?CLASS2»])]) (mkOr [ap (Const.«subclass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subclass») ([«?CLASS2», «?CLASS1»])]))
axiom ax_26 : Holds (ap (Const.«instance») ([Const.«domainSubclass», Const.«TernaryPredicate»]))
axiom ax_27 : ∀ («?CLASS1» : Obj) («?NUMBER» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?REL1», «?REL2»]), ap (Const.«domainSubclass») ([«?REL2», «?NUMBER», «?CLASS1»])]) (ap (Const.«domainSubclass») ([«?REL1», «?NUMBER», «?CLASS1»])))
axiom ax_28 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?NUMBER» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«domainSubclass») ([«?REL», «?NUMBER», «?CLASS1»]), ap (Const.«domainSubclass») ([«?REL», «?NUMBER», «?CLASS2»])]) (mkOr [ap (Const.«subclass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subclass») ([«?CLASS2», «?CLASS1»])]))
axiom ax_29 : ∀ («?THING1» : Obj) («?THING2» : Obj), Holds (mkImp (ap (Const.«equal») ([«?THING1», «?THING2»])) (mkForall (fun («?ATTR» : Obj) => mkIff (ap (Const.«property») ([«?THING1», «?ATTR»])) (ap (Const.«property») ([«?THING2», «?ATTR»])))))
axiom ax_30 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj), Holds (mkImp (ap (Const.«equal») ([«?ATTR1», «?ATTR2»])) (mkForall (fun («?THING» : Obj) => mkIff (ap (Const.«property») ([«?THING», «?ATTR1»])) (ap (Const.«property») ([«?THING», «?ATTR2»])))))
axiom ax_31 : ∀ («?THING1» : Obj) («?THING2» : Obj), Holds (mkImp (ap (Const.«equal») ([«?THING1», «?THING2»])) (mkForall (fun («?CLASS» : Obj) => mkIff (ap (Const.«instance») ([«?THING1», «?CLASS»])) (ap (Const.«instance») ([«?THING2», «?CLASS»])))))
axiom ax_32 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (ap (Const.«equal») ([«?CLASS1», «?CLASS2»])) (mkForall (fun («?THING» : Obj) => mkIff (ap (Const.«instance») ([«?THING», «?CLASS1»])) (ap (Const.«instance») ([«?THING», «?CLASS2»])))))
axiom ax_33 : ∀ («?LIST1» : Obj) («?LIST2» : Obj) («?NUMBER» : Obj) («@ROW1» : List Obj) («@ROW2» : List Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?LIST1», «?LIST2»]), ap (Const.«equal») ([«?LIST1», ap (Const.«ListFn») («@ROW1»)]), ap (Const.«equal») ([«?LIST2», ap (Const.«ListFn») («@ROW2»)])]) (ap (Const.«equal») ([ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW1»), «?NUMBER»]), ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW2»), «?NUMBER»])])))
axiom ax_34 : Holds (ap (Const.«instance») ([Const.«range», Const.«BinaryPredicate»]))
axiom ax_35 : Holds (ap (Const.«instance») ([Const.«range», Const.«AsymmetricRelation»]))
axiom ax_36 : ∀ («?CLASS» : Obj) («?FUNCTION» : Obj) («?VALUE» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«range») ([«?FUNCTION», «?CLASS»]), ap (Const.«equal») ([ap (Const.«AssignmentFn») ([«?FUNCTION»] ++ «@ROW»), «?VALUE»])]) (ap (Const.«instance») ([«?VALUE», «?CLASS»])))
axiom ax_37 : ∀ («?CLASS1» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?REL1», «?REL2»]), ap (Const.«range») ([«?REL2», «?CLASS1»])]) (ap (Const.«range») ([«?REL1», «?CLASS1»])))
axiom ax_38 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«range») ([«?REL», «?CLASS1»]), ap (Const.«range») ([«?REL», «?CLASS2»])]) (mkOr [ap (Const.«subclass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subclass») ([«?CLASS2», «?CLASS1»])]))
axiom ax_39 : Holds (ap (Const.«instance») ([Const.«rangeSubclass», Const.«BinaryPredicate»]))
axiom ax_40 : ∀ («?CLASS» : Obj) («?FUNCTION» : Obj) («?VALUE» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«rangeSubclass») ([«?FUNCTION», «?CLASS»]), ap (Const.«equal») ([ap (Const.«AssignmentFn») ([«?FUNCTION»] ++ «@ROW»), «?VALUE»])]) (ap (Const.«subclass») ([«?VALUE», «?CLASS»])))
axiom ax_41 : ∀ («?CLASS1» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subrelation») ([«?REL1», «?REL2»]), ap (Const.«rangeSubclass») ([«?REL2», «?CLASS1»])]) (ap (Const.«rangeSubclass») ([«?REL1», «?CLASS1»])))
axiom ax_42 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«rangeSubclass») ([«?REL», «?CLASS1»]), ap (Const.«rangeSubclass») ([«?REL», «?CLASS2»])]) (mkOr [ap (Const.«subclass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subclass») ([«?CLASS2», «?CLASS1»])]))
axiom ax_43 : Holds (ap (Const.«instance») ([Const.«valence», Const.«BinaryPredicate»]))
axiom ax_44 : Holds (ap (Const.«instance») ([Const.«valence», Const.«SingleValuedRelation»]))
axiom ax_45 : Holds (ap (Const.«instance») ([Const.«documentation», Const.«TernaryPredicate»]))
axiom ax_46 : Holds (ap (Const.«instance») ([Const.«format», Const.«TernaryPredicate»]))
axiom ax_47 : Holds (ap (Const.«instance») ([Const.«termFormat», Const.«TernaryPredicate»]))
axiom ax_48 : Holds (ap (Const.«instance») ([Const.«disjoint», Const.«BinaryPredicate»]))
axiom ax_49 : Holds (ap (Const.«instance») ([Const.«disjoint», Const.«SymmetricRelation»]))
axiom ax_50 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (ap (Const.«disjoint») ([«?CLASS1», «?CLASS2»])) (mkNot (mkExists (fun («?INST» : Obj) => mkAnd [ap (Const.«instance») ([«?INST», «?CLASS1»]), ap (Const.«instance») ([«?INST», «?CLASS2»])]))))
axiom ax_51 : Holds (ap (Const.«instance») ([Const.«disjointRelation», Const.«BinaryPredicate»]))
axiom ax_52 : Holds (ap (Const.«instance») ([Const.«disjointRelation», Const.«IrreflexiveRelation»]))
axiom ax_53 : Holds (ap (Const.«instance») ([Const.«disjointRelation», Const.«PartialValuedRelation»]))
axiom ax_54 : Holds (ap (Const.«relatedInternalConcept») ([Const.«disjointRelation», Const.«disjoint»]))
axiom ax_55 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?NUMBER» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«domain») ([«?REL1», «?NUMBER», «?CLASS1»]), ap (Const.«domain») ([«?REL2», «?NUMBER», «?CLASS2»]), ap (Const.«disjoint») ([«?CLASS1», «?CLASS2»])]) (ap (Const.«disjointRelation») ([«?REL1», «?REL2»])))
axiom ax_56 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?NUMBER» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«domainSubclass») ([«?REL1», «?NUMBER», «?CLASS1»]), ap (Const.«domainSubclass») ([«?REL2», «?NUMBER», «?CLASS2»]), ap (Const.«disjoint») ([«?CLASS1», «?CLASS2»])]) (ap (Const.«disjointRelation») ([«?REL1», «?REL2»])))
axiom ax_57 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«range») ([«?REL1», «?CLASS1»]), ap (Const.«range») ([«?REL2», «?CLASS2»]), ap (Const.«disjoint») ([«?CLASS1», «?CLASS2»])]) (ap (Const.«disjointRelation») ([«?REL1», «?REL2»])))
axiom ax_58 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj) («?REL1» : Obj) («?REL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«rangeSubclass») ([«?REL1», «?CLASS1»]), ap (Const.«rangeSubclass») ([«?REL2», «?CLASS2»]), ap (Const.«disjoint») ([«?CLASS1», «?CLASS2»])]) (ap (Const.«disjointRelation») ([«?REL1», «?REL2»])))
axiom ax_59 : ∀ («?REL1» : Obj) («?REL2» : Obj) («@ROW2» : List Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL1», Const.«Predicate»]), ap (Const.«instance») ([«?REL2», Const.«Predicate»]), ap (Const.«disjointRelation») ([«?REL1», «?REL2»]), ap («?REL1») («@ROW2»)]) (mkNot (ap («?REL2») («@ROW2»))))
axiom ax_60 : Holds (ap (Const.«instance») ([Const.«contraryAttribute», Const.«Predicate»]))
axiom ax_61 : Holds (ap (Const.«instance») ([Const.«contraryAttribute», Const.«VariableArityRelation»]))
axiom ax_62 : ∀ («?ELEMENT» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«contraryAttribute») («@ROW»)) (mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«instance») ([«?ELEMENT», Const.«Attribute»]))))
axiom ax_63 : ∀ («@ROW1» : List Obj) («@ROW2» : List Obj), Holds (mkImp (mkAnd [ap (Const.«contraryAttribute») («@ROW1»), ap (Const.«identicalListItems») ([ap (Const.«ListFn») («@ROW1»), ap (Const.«ListFn») («@ROW2»)])]) (ap (Const.«contraryAttribute») («@ROW2»)))
axiom ax_64 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj) («?OBJ» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«contraryAttribute») («@ROW»), ap (Const.«equal») ([«?ATTR1», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW»), «?NUMBER1»])]), ap (Const.«equal») ([«?ATTR2», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW»), «?NUMBER2»])]), mkNot (ap (Const.«equal») ([«?NUMBER1», «?NUMBER2»])), ap (Const.«property») ([«?OBJ», «?ATTR1»])]) (mkNot (ap (Const.«property») ([«?OBJ», «?ATTR2»]))))
axiom ax_65 : Holds (ap (Const.«instance») ([Const.«exhaustiveAttribute», Const.«Predicate»]))
axiom ax_66 : Holds (ap (Const.«instance») ([Const.«exhaustiveAttribute», Const.«VariableArityRelation»]))
axiom ax_67 : ∀ («?ATTR» : Obj) («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«exhaustiveAttribute») ([«?CLASS»] ++ «@ROW»), ap (Const.«inList») ([«?ATTR», ap (Const.«ListFn») («@ROW»)])]) (ap (Const.«instance») ([«?ATTR», Const.«Attribute»])))
axiom ax_68 : ∀ («?ATTR» : Obj) («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«exhaustiveAttribute») ([«?CLASS»] ++ «@ROW»), ap (Const.«inList») ([«?ATTR», ap (Const.«ListFn») («@ROW»)])]) (ap (Const.«instance») ([«?ATTR», «?CLASS»])))
axiom ax_69 : ∀ («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«exhaustiveAttribute») ([«?CLASS»] ++ «@ROW»)) (mkForall (fun («?ATTR1» : Obj) => mkImp (ap (Const.«instance») ([«?ATTR1», «?CLASS»])) (mkExists (fun («?ATTR2» : Obj) => mkAnd [ap (Const.«inList») ([«?ATTR2», ap (Const.«ListFn») («@ROW»)]), ap (Const.«equal») ([«?ATTR1», «?ATTR2»])])))))
axiom ax_70 : ∀ («?ATTRCLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«exhaustiveAttribute») ([«?ATTRCLASS»] ++ «@ROW»)) (mkNot (mkExists (fun («?EL» : Obj) => mkAnd [ap (Const.«instance») ([«?EL», «?ATTRCLASS»]), mkNot (mkExists (fun («?ATTR» : Obj) => mkExists (fun («?NUMBER» : Obj) => mkAnd [ap (Const.«equal») ([«?EL», «?ATTR»]), ap (Const.«equal») ([«?ATTR», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW»), «?NUMBER»])])])))]))))
axiom ax_71 : Holds (ap (Const.«instance») ([Const.«exhaustiveDecomposition», Const.«Predicate»]))
axiom ax_72 : Holds (ap (Const.«instance») ([Const.«exhaustiveDecomposition», Const.«VariableArityRelation»]))
axiom ax_73 : Holds (ap (Const.«relatedInternalConcept») ([Const.«exhaustiveDecomposition», Const.«partition»]))
axiom ax_74 : ∀ («?ELEMENT» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«exhaustiveDecomposition») («@ROW»)) (mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«instance») ([«?ELEMENT», Const.«Class»]))))
axiom ax_75 : Holds (ap (Const.«instance») ([Const.«disjointDecomposition», Const.«Predicate»]))
axiom ax_76 : Holds (ap (Const.«instance») ([Const.«disjointDecomposition», Const.«VariableArityRelation»]))
axiom ax_77 : Holds (ap (Const.«relatedInternalConcept») ([Const.«disjointDecomposition», Const.«exhaustiveDecomposition»]))
axiom ax_78 : Holds (ap (Const.«relatedInternalConcept») ([Const.«disjointDecomposition», Const.«disjoint»]))
axiom ax_79 : ∀ («?ELEMENT» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«disjointDecomposition») («@ROW»)) (mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«instance») ([«?ELEMENT», Const.«Class»]))))
axiom ax_80 : Holds (ap (Const.«instance») ([Const.«partition», Const.«Predicate»]))
axiom ax_81 : Holds (ap (Const.«instance») ([Const.«partition», Const.«VariableArityRelation»]))
axiom ax_82 : ∀ («@ROW» : List Obj), Holds (mkImp (ap (Const.«partition») («@ROW»)) (mkAnd [ap (Const.«exhaustiveDecomposition») («@ROW»), ap (Const.«disjointDecomposition») («@ROW»)]))
axiom ax_83 : ∀ («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«exhaustiveDecomposition») («@ROW»), ap (Const.«disjointDecomposition») («@ROW»)]) (ap (Const.«partition») («@ROW»)))
axiom ax_84 : ∀ («?SUB1» : Obj) («?SUB2» : Obj) («?SUPER» : Obj), Holds (mkImp (ap (Const.«partition») ([«?SUPER», «?SUB1», «?SUB2»])) (ap (Const.«partition») ([«?SUPER», «?SUB2», «?SUB1»])))
axiom ax_85 : ∀ («?INST» : Obj) («?SUB1» : Obj) («?SUB2» : Obj) («?SUPER» : Obj), Holds (mkImp (mkAnd [ap (Const.«partition») ([«?SUPER», «?SUB1», «?SUB2»]), ap (Const.«instance») ([«?INST», «?SUPER»]), mkNot (ap (Const.«instance») ([«?INST», «?SUB1»]))]) (ap (Const.«instance») ([«?INST», «?SUB2»])))
axiom ax_86 : Holds (ap (Const.«instance») ([Const.«relatedInternalConcept», Const.«BinaryPredicate»]))
axiom ax_87 : Holds (ap (Const.«instance») ([Const.«relatedInternalConcept», Const.«EquivalenceRelation»]))
axiom ax_88 : Holds (ap (Const.«instance») ([Const.«relatedExternalConcept», Const.«TernaryPredicate»]))
axiom ax_89 : Holds (ap (Const.«relatedInternalConcept») ([Const.«relatedExternalConcept», Const.«relatedInternalConcept»]))
axiom ax_90 : Holds (ap (Const.«subrelation») ([Const.«synonymousExternalConcept», Const.«relatedExternalConcept»]))
axiom ax_91 : Holds (ap (Const.«instance») ([Const.«synonymousExternalConcept», Const.«TernaryPredicate»]))
axiom ax_92 : Holds (ap (Const.«disjointRelation») ([Const.«synonymousExternalConcept», Const.«subsumedExternalConcept»]))
axiom ax_93 : Holds (ap (Const.«disjointRelation») ([Const.«synonymousExternalConcept», Const.«subsumingExternalConcept»]))
axiom ax_94 : Holds (ap (Const.«disjointRelation») ([Const.«subsumedExternalConcept», Const.«subsumingExternalConcept»]))
axiom ax_95 : Holds (ap (Const.«subrelation») ([Const.«subsumingExternalConcept», Const.«relatedExternalConcept»]))
axiom ax_96 : Holds (ap (Const.«instance») ([Const.«subsumingExternalConcept», Const.«TernaryPredicate»]))
axiom ax_97 : Holds (ap (Const.«subrelation») ([Const.«subsumedExternalConcept», Const.«relatedExternalConcept»]))
axiom ax_98 : Holds (ap (Const.«instance») ([Const.«subsumedExternalConcept», Const.«TernaryPredicate»]))
axiom ax_99 : Holds (ap (Const.«instance») ([Const.«externalImage», Const.«BinaryPredicate»]))
axiom ax_100 : Holds (ap (Const.«instance») ([Const.«subAttribute», Const.«BinaryPredicate»]))
axiom ax_101 : Holds (ap (Const.«instance») ([Const.«subAttribute», Const.«PartialOrderingRelation»]))
axiom ax_102 : Holds (ap (Const.«disjointRelation») ([Const.«subAttribute», Const.«successorAttribute»]))
axiom ax_103 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj), Holds (mkImp (ap (Const.«subAttribute») ([«?ATTR1», «?ATTR2»])) (mkForall (fun («?OBJ» : Obj) => mkImp (ap (Const.«property») ([«?OBJ», «?ATTR1»])) (ap (Const.«property») ([«?OBJ», «?ATTR2»])))))
axiom ax_104 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj) («?CLASS» : Obj), Holds (mkImp (mkAnd [ap (Const.«subAttribute») ([«?ATTR1», «?ATTR2»]), ap (Const.«instance») ([«?ATTR2», «?CLASS»])]) (ap (Const.«instance») ([«?ATTR1», «?CLASS»])))
axiom ax_105 : Holds (ap (Const.«instance») ([Const.«successorAttribute», Const.«BinaryPredicate»]))
axiom ax_106 : Holds (ap (Const.«instance») ([Const.«successorAttribute», Const.«AsymmetricRelation»]))
axiom ax_107 : Holds (ap (Const.«instance») ([Const.«successorAttributeClosure», Const.«BinaryPredicate»]))
axiom ax_108 : Holds (ap (Const.«instance») ([Const.«successorAttributeClosure», Const.«TransitiveRelation»]))
axiom ax_109 : Holds (ap (Const.«instance») ([Const.«successorAttributeClosure», Const.«IrreflexiveRelation»]))
axiom ax_110 : Holds (ap (Const.«instance») ([Const.«successorAttributeClosure», Const.«PartialValuedRelation»]))
axiom ax_111 : Holds (ap (Const.«relatedInternalConcept») ([Const.«successorAttributeClosure», Const.«successorAttribute»]))
axiom ax_112 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj), Holds (mkImp (ap (Const.«successorAttribute») ([«?ATTR1», «?ATTR2»])) (ap (Const.«successorAttributeClosure») ([«?ATTR1», «?ATTR2»])))
axiom ax_113 : Holds (ap (Const.«instance») ([Const.«greaterThanByQuality», Const.«TernaryPredicate»]))
axiom ax_114 : ∀ («?ATT» : Obj) («?E1» : Obj) («?E2» : Obj) («?E3» : Obj), Holds (mkImp (mkAnd [ap (Const.«greaterThanByQuality») ([«?E1», «?E2», «?ATT»]), ap (Const.«greaterThanByQuality») ([«?E2», «?E3», «?ATT»])]) (ap (Const.«greaterThanByQuality») ([«?E1», «?E3», «?ATT»])))
axiom ax_115 : ∀ («?ATT» : Obj) («?E1» : Obj) («?E2» : Obj), Holds (mkImp (ap (Const.«greaterThanByQuality») ([«?E1», «?E2», «?ATT»])) (mkNot (ap (Const.«greaterThanByQuality») ([«?E2», «?E1», «?ATT»]))))
axiom ax_116 : ∀ («?ATT» : Obj) («?E1» : Obj) («?E2» : Obj), Holds (mkImp (ap (Const.«greaterThanByQuality») ([«?E1», «?E2», «?ATT»])) (mkNot (ap (Const.«equal») ([«?E2», «?E1»]))))
axiom ax_117 : Holds (ap (Const.«instance») ([Const.«entails», Const.«BinaryPredicate»]))
axiom ax_118 : Holds (ap (Const.«instance») ([Const.«AssignmentFn», Const.«Function»]))
axiom ax_119 : Holds (ap (Const.«instance») ([Const.«AssignmentFn», Const.«VariableArityRelation»]))
axiom ax_120 : Holds (ap (Const.«instance») ([Const.«PowerSetFn», Const.«UnaryFunction»]))
axiom ax_121 : Holds (ap (Const.«instance») ([Const.«PowerSetFn», Const.«TotalValuedRelation»]))
axiom ax_122 : Holds (ap (Const.«partition») ([Const.«Entity», Const.«Physical», Const.«Abstract»]))
axiom ax_123 : Holds (mkExists (fun («?THING» : Obj) => ap (Const.«instance») ([«?THING», Const.«Entity»])))
axiom ax_124 : ∀ («?CLASS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLASS», Const.«Class»])) (ap (Const.«subclass») ([«?CLASS», Const.«Entity»])))
axiom ax_125 : Holds (ap (Const.«subclass») ([Const.«Physical», Const.«Entity»]))
axiom ax_126 : Holds (ap (Const.«partition») ([Const.«Physical», Const.«Object», Const.«Process»]))
axiom ax_127 : ∀ («?PHYS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PHYS», Const.«Physical»])) (mkExists (fun («?LOC» : Obj) => mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«located») ([«?PHYS», «?LOC»]), ap (Const.«time») ([«?PHYS», «?TIME»])]))))
axiom ax_128 : Holds (ap (Const.«subclass») ([Const.«Object», Const.«Physical»]))
axiom ax_129 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Object»])) (ap (Const.«capability») ([Const.«Translocation», Const.«origin», «?O»])))
axiom ax_130 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Object»])) (ap (Const.«capability») ([Const.«Translocation», Const.«destination», «?O»])))
axiom ax_131 : Holds (ap (Const.«subclass») ([Const.«SelfConnectedObject», Const.«Object»]))
axiom ax_132 : Holds (ap (Const.«subclass») ([Const.«OrganicThing», Const.«SelfConnectedObject»]))
axiom ax_133 : Holds (ap (Const.«instance») ([Const.«FrontFn», Const.«SpatialRelation»]))
axiom ax_134 : Holds (ap (Const.«instance») ([Const.«FrontFn», Const.«PartialValuedRelation»]))
axiom ax_135 : Holds (ap (Const.«instance») ([Const.«FrontFn», Const.«UnaryFunction»]))
axiom ax_136 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»])) (ap (Const.«side») ([ap (Const.«FrontFn») ([«?OBJ»]), «?OBJ»])))
axiom ax_137 : Holds (ap (Const.«instance») ([Const.«BackFn», Const.«SpatialRelation»]))
axiom ax_138 : Holds (ap (Const.«instance») ([Const.«BackFn», Const.«PartialValuedRelation»]))
axiom ax_139 : Holds (ap (Const.«instance») ([Const.«BackFn», Const.«UnaryFunction»]))
axiom ax_140 : Holds (ap (Const.«relatedInternalConcept») ([Const.«BackFn», Const.«FrontFn»]))
axiom ax_141 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»])) (ap (Const.«side») ([ap (Const.«BackFn») ([«?OBJ»]), «?OBJ»])))
axiom ax_142 : ∀ («?F» : Obj) («?O» : Obj), Holds (mkImp (ap (Const.«equal») ([«?F», ap (Const.«FrontFn») ([«?O»])])) (mkNot (ap (Const.«overlapsSpatially») ([«?F», ap (Const.«BackFn») ([«?O»])]))))
axiom ax_143 : ∀ («?B» : Obj) («?O» : Obj), Holds (mkImp (ap (Const.«equal») ([«?B», ap (Const.«BackFn») ([«?O»])])) (mkNot (ap (Const.«overlapsSpatially») ([«?B», ap (Const.«FrontFn») ([«?O»])]))))
axiom ax_144 : Holds (ap (Const.«instance») ([Const.«part», Const.«SpatialRelation»]))
axiom ax_145 : Holds (ap (Const.«instance») ([Const.«part», Const.«PartialOrderingRelation»]))
axiom ax_146 : Holds (ap (Const.«instance») ([Const.«part», Const.«BinaryPredicate»]))
axiom ax_147 : Holds (ap (Const.«instance») ([Const.«properPart», Const.«AsymmetricRelation»]))
axiom ax_148 : Holds (ap (Const.«instance») ([Const.«properPart», Const.«TransitiveRelation»]))
axiom ax_149 : Holds (ap (Const.«subrelation») ([Const.«properPart», Const.«part»]))
axiom ax_150 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«properPart») ([«?OBJ1», «?OBJ2»])) (mkAnd [ap (Const.«part») ([«?OBJ1», «?OBJ2»]), mkNot (ap (Const.«part») ([«?OBJ2», «?OBJ1»]))]))
axiom ax_151 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«part») ([«?OBJ1», «?OBJ2»]), mkNot (ap (Const.«part») ([«?OBJ2», «?OBJ1»]))]) (ap (Const.«properPart») ([«?OBJ1», «?OBJ2»])))
axiom ax_152 : Holds (ap (Const.«subrelation») ([Const.«piece», Const.«part»]))
axiom ax_153 : Holds (ap (Const.«instance») ([Const.«piece», Const.«BinaryPredicate»]))
axiom ax_154 : ∀ («?SUBSTANCE1» : Obj) («?SUBSTANCE2» : Obj), Holds (mkImp (ap (Const.«piece») ([«?SUBSTANCE1», «?SUBSTANCE2»])) (mkForall (fun («?CLASS» : Obj) => mkImp (ap (Const.«instance») ([«?SUBSTANCE1», «?CLASS»])) (ap (Const.«instance») ([«?SUBSTANCE2», «?CLASS»])))))
axiom ax_155 : Holds (ap (Const.«subrelation») ([Const.«component», Const.«part»]))
axiom ax_156 : Holds (ap (Const.«instance») ([Const.«component», Const.«BinaryPredicate»]))
axiom ax_157 : Holds (ap (Const.«instance») ([Const.«material», Const.«BinaryPredicate»]))
axiom ax_158 : ∀ («?BIG» : Obj) («?SMALL» : Obj), Holds (mkImp (ap (Const.«contains») ([«?SMALL», «?BIG»])) (ap (Const.«partlyLocated») ([«?SMALL», «?BIG»])))
axiom ax_159 : Holds (ap (Const.«instance») ([Const.«hole», Const.«BinaryPredicate»]))
axiom ax_160 : Holds (ap (Const.«instance») ([Const.«hole», Const.«SpatialRelation»]))
axiom ax_161 : Holds (ap (Const.«instance») ([Const.«hole», Const.«AsymmetricRelation»]))
axiom ax_162 : Holds (ap (Const.«instance») ([Const.«properlyFills», Const.«AsymmetricRelation»]))
axiom ax_163 : Holds (ap (Const.«subrelation») ([Const.«properlyFills», Const.«partiallyFills»]))
axiom ax_164 : Holds (ap (Const.«subclass») ([Const.«Crater», Const.«HoleRegion»]))
axiom ax_165 : ∀ («?C» : Obj) («?SURF» : Obj), Holds (mkImp (ap (Const.«instance») ([«?C», Const.«Crater»])) (mkExists (fun («?HOST» : Obj) => mkExists (fun («?EVENT» : Obj) => mkExists (fun («?METEOR» : Obj) => mkExists (fun («?BOMB» : Obj) => mkAnd [ap (Const.«hole») ([«?C», «?HOST»]), ap (Const.«superficialPart») ([«?SURF», ap (Const.«HoleHostFn») ([«?C»])]), mkOr [mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Impacting»]), ap (Const.«instrument») ([«?EVENT», «?METEOR»]), ap (Const.«instance») ([«?METEOR», Const.«Meteorite»])], mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Explosion»]), ap (Const.«instrument») ([«?EVENT», «?BOMB»]), ap (Const.«instance») ([«?BOMB», Const.«Bomb»])], ap (Const.«instance») ([«?EVENT», Const.«VolcanicEruption»])], ap (Const.«result») ([«?EVENT», «?C»])]))))))
axiom ax_166 : Holds (ap (Const.«instance») ([Const.«contains», Const.«SpatialRelation»]))
axiom ax_167 : Holds (ap (Const.«instance») ([Const.«contains», Const.«AsymmetricRelation»]))
axiom ax_168 : Holds (ap (Const.«instance») ([Const.«contains», Const.«PartialValuedRelation»]))
axiom ax_169 : Holds (ap (Const.«instance») ([Const.«contains», Const.«BinaryPredicate»]))
axiom ax_170 : Holds (ap (Const.«disjointRelation») ([Const.«contains», Const.«part»]))
axiom ax_171 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«contains») ([«?OBJ1», «?OBJ2»])) (mkExists (fun («?HOLE» : Obj) => mkAnd [ap (Const.«hole») ([«?HOLE», «?OBJ1»]), ap (Const.«properlyFills») ([«?OBJ2», «?HOLE»])])))
axiom ax_172 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«hole») ([«?HOLE», «?OBJ1»]), ap (Const.«properlyFills») ([«?OBJ2», «?HOLE»])]) (ap (Const.«contains») ([«?OBJ1», «?OBJ2»])))
axiom ax_173 : Holds (ap (Const.«subclass») ([Const.«Substance», Const.«SelfConnectedObject»]))
axiom ax_174 : Holds (ap (Const.«partition») ([Const.«Substance», Const.«PureSubstance», Const.«Mixture»]))
axiom ax_175 : Holds (ap (Const.«partition») ([Const.«Substance», Const.«SyntheticSubstance», Const.«NaturalSubstance»]))
axiom ax_176 : ∀ («?OBJECT» : Obj) («?OBJECTTYPE» : Obj) («?PART» : Obj), Holds (mkImp (mkAnd [ap (Const.«subclass») ([«?OBJECTTYPE», Const.«Substance»]), ap (Const.«instance») ([«?OBJECT», «?OBJECTTYPE»]), ap (Const.«piece») ([«?PART», «?OBJECT»])]) (ap (Const.«instance») ([«?PART», «?OBJECTTYPE»])))
axiom ax_177 : ∀ («?ATTR» : Obj) («?OBJ» : Obj) («?PART» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?OBJ», Const.«Substance»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»]), ap (Const.«piece») ([«?PART», «?OBJ»])]) (ap (Const.«attribute») ([«?PART», «?ATTR»])))
axiom ax_178 : Holds (ap (Const.«subclass») ([Const.«SyntheticSubstance», Const.«Substance»]))
axiom ax_179 : ∀ («?SUBSTANCE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SUBSTANCE», Const.«SyntheticSubstance»])) (mkExists (fun («?PROCESS» : Obj) => mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«IntentionalProcess»]), ap (Const.«result») ([«?PROCESS», «?SUBSTANCE»]), ap (Const.«instance») ([«?SUBSTANCE», Const.«Substance»])])))
axiom ax_180 : Holds (ap (Const.«subclass») ([Const.«NaturalSubstance», Const.«Substance»]))
axiom ax_181 : Holds (ap (Const.«subclass») ([Const.«PureSubstance», Const.«Substance»]))
axiom ax_182 : Holds (ap (Const.«partition») ([Const.«PureSubstance», Const.«CompoundSubstance», Const.«ElementalSubstance»]))
axiom ax_183 : Holds (ap (Const.«subclass») ([Const.«ElementalSubstance», Const.«PureSubstance»]))
axiom ax_184 : Holds (ap (Const.«subclass») ([Const.«Metal», Const.«ElementalSubstance»]))
axiom ax_185 : Holds (ap (Const.«subclass») ([Const.«Atom», Const.«ElementalSubstance»]))
axiom ax_186 : ∀ («?ATOM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ATOM», Const.«Atom»])) (mkExists (fun («?PROTON» : Obj) => mkExists (fun («?ELECTRON» : Obj) => mkAnd [ap (Const.«part») ([«?PROTON», «?ATOM»]), ap (Const.«part») ([«?ELECTRON», «?ATOM»]), ap (Const.«instance») ([«?PROTON», Const.«Proton»]), ap (Const.«instance») ([«?ELECTRON», Const.«Electron»])]))))
axiom ax_187 : ∀ («?ATOM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ATOM», Const.«Atom»])) (mkForall (fun («?NUCLEUS1» : Obj) => mkForall (fun («?NUCLEUS2» : Obj) => mkImp (mkAnd [ap (Const.«part») ([«?NUCLEUS1», «?ATOM»]), ap (Const.«part») ([«?NUCLEUS2», «?ATOM»]), ap (Const.«instance») ([«?NUCLEUS1», Const.«AtomicNucleus»]), ap (Const.«instance») ([«?NUCLEUS2», Const.«AtomicNucleus»])]) (ap (Const.«equal») ([«?NUCLEUS1», «?NUCLEUS2»]))))))
axiom ax_188 : Holds (ap (Const.«subclass») ([Const.«SubatomicParticle», Const.«ElementalSubstance»]))
axiom ax_189 : ∀ («?PARTICLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PARTICLE», Const.«SubatomicParticle»])) (mkExists (fun («?ATOM» : Obj) => mkAnd [ap (Const.«instance») ([«?ATOM», Const.«Atom»]), ap (Const.«component») ([«?PARTICLE», «?ATOM»])])))
axiom ax_190 : Holds (ap (Const.«subclass») ([Const.«AtomicNucleus», Const.«SubatomicParticle»]))
axiom ax_191 : ∀ («?NUCLEUS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUCLEUS», Const.«AtomicNucleus»])) (mkExists (fun («?NEUTRON» : Obj) => mkExists (fun («?PROTON» : Obj) => mkAnd [ap (Const.«component») ([«?NEUTRON», «?NUCLEUS»]), ap (Const.«component») ([«?PROTON», «?NUCLEUS»]), ap (Const.«instance») ([«?NEUTRON», Const.«Neutron»]), ap (Const.«instance») ([«?PROTON», Const.«Proton»])]))))
axiom ax_192 : Holds (ap (Const.«subclass») ([Const.«Electron», Const.«SubatomicParticle»]))
axiom ax_193 : Holds (ap (Const.«subclass») ([Const.«Proton», Const.«SubatomicParticle»]))
axiom ax_194 : Holds (ap (Const.«subclass») ([Const.«Neutron», Const.«SubatomicParticle»]))
axiom ax_195 : Holds (ap (Const.«subclass») ([Const.«CompoundSubstance», Const.«PureSubstance»]))
axiom ax_196 : Holds (ap (Const.«subclass») ([Const.«Mixture», Const.«Substance»]))
axiom ax_197 : ∀ («?MIXTURE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MIXTURE», Const.«Mixture»])) (mkExists (fun («?PURE1» : Obj) => mkExists (fun («?PURE2» : Obj) => mkAnd [ap (Const.«instance») ([«?PURE1», Const.«PureSubstance»]), ap (Const.«instance») ([«?PURE2», Const.«PureSubstance»]), mkNot (ap (Const.«equal») ([«?PURE1», «?PURE2»])), ap (Const.«piece») ([«?PURE1», «?MIXTURE»]), ap (Const.«piece») ([«?PURE2», «?MIXTURE»])]))))
axiom ax_198 : ∀ («?MIXTURE» : Obj) («?SUBSTANCE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MIXTURE», Const.«Mixture»]), ap (Const.«piece») ([«?SUBSTANCE», «?MIXTURE»]), mkNot (ap (Const.«instance») ([«?SUBSTANCE», Const.«Mixture»]))]) (ap (Const.«instance») ([«?SUBSTANCE», Const.«PureSubstance»])))
axiom ax_199 : Holds (ap (Const.«subrelation») ([Const.«ingredient», Const.«material»]))
axiom ax_200 : Holds (ap (Const.«instance») ([Const.«ingredient», Const.«BinaryPredicate»]))
axiom ax_201 : ∀ («?ING» : Obj) («?S» : Obj), Holds (mkImp (ap (Const.«ingredient») ([«?ING», «?S»])) (mkExists (fun («?PROC» : Obj) => mkExists (fun («?X» : Obj) => mkExists (fun («?Y» : Obj) => mkAnd [ap (Const.«instance») ([«?PROC», Const.«Process»]), ap (Const.«instance») ([«?X», «?ING»]), ap (Const.«patient») ([«?PROC», «?X»]), ap (Const.«instance») ([«?Y», «?S»]), ap (Const.«result») ([«?PROC», «?Y»])])))))
axiom ax_202 : Holds (ap (Const.«subclass») ([Const.«CorpuscularObject», Const.«SelfConnectedObject»]))
axiom ax_203 : Holds (ap (Const.«disjoint») ([Const.«CorpuscularObject», Const.«Substance»]))
axiom ax_204 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«CorpuscularObject»])) (mkExists (fun («?SUBSTANCE1» : Obj) => mkExists (fun («?SUBSTANCE2» : Obj) => mkAnd [ap (Const.«subclass») ([«?SUBSTANCE1», Const.«Substance»]), ap (Const.«subclass») ([«?SUBSTANCE2», Const.«Substance»]), ap (Const.«material») ([«?SUBSTANCE1», «?OBJ»]), ap (Const.«material») ([«?SUBSTANCE2», «?OBJ»]), mkNot (ap (Const.«equal») ([«?SUBSTANCE1», «?SUBSTANCE2»]))]))))
axiom ax_205 : Holds (ap (Const.«instance») ([Const.«substanceElement», Const.«BinaryPredicate»]))
axiom ax_206 : Holds (ap (Const.«subclass») ([Const.«Region», Const.«Object»]))
axiom ax_207 : Holds (ap (Const.«subclass») ([Const.«Collection», Const.«Physical»]))
axiom ax_208 : Holds (ap (Const.«disjoint») ([Const.«Collection», Const.«SelfConnectedObject»]))
axiom ax_209 : ∀ («?COLL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COLL», Const.«Collection»])) (mkExists (fun («?OBJ» : Obj) => ap (Const.«member») ([«?OBJ», «?COLL»]))))
axiom ax_210 : Holds (ap (Const.«instance») ([Const.«member», Const.«AsymmetricRelation»]))
axiom ax_211 : Holds (ap (Const.«instance») ([Const.«member», Const.«BinaryPredicate»]))
axiom ax_212 : Holds (ap (Const.«instance») ([Const.«member», Const.«IntransitiveRelation»]))
axiom ax_213 : Holds (ap (Const.«relatedInternalConcept») ([Const.«member», Const.«instance»]))
axiom ax_214 : Holds (ap (Const.«relatedInternalConcept») ([Const.«member», Const.«element»]))
axiom ax_215 : Holds (ap (Const.«instance») ([Const.«subCollection», Const.«BinaryPredicate»]))
axiom ax_216 : Holds (ap (Const.«instance») ([Const.«subCollection», Const.«PartialOrderingRelation»]))
axiom ax_217 : ∀ («?COLL1» : Obj) («?COLL2» : Obj), Holds (mkIff (ap (Const.«subCollection») ([«?COLL1», «?COLL2»])) (mkForall (fun («?MEMBER» : Obj) => mkImp (ap (Const.«member») ([«?MEMBER», «?COLL1»])) (ap (Const.«member») ([«?MEMBER», «?COLL2»])))))
axiom ax_218 : Holds (ap (Const.«subclass») ([Const.«ContentBearingPhysical», Const.«Physical»]))
axiom ax_219 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«ContentBearingPhysical»])) (mkExists (fun («?THING» : Obj) => ap (Const.«represents») ([«?OBJ», «?THING»]))))
axiom ax_220 : Holds (ap (Const.«subclass») ([Const.«ContentBearingProcess», Const.«ContentBearingPhysical»]))
axiom ax_221 : Holds (ap (Const.«subclass») ([Const.«ContentBearingProcess», Const.«Process»]))
axiom ax_222 : Holds (ap (Const.«subclass») ([Const.«ContentBearingObject», Const.«CorpuscularObject»]))
axiom ax_223 : Holds (ap (Const.«subclass») ([Const.«ContentBearingObject», Const.«ContentBearingPhysical»]))
axiom ax_224 : Holds (ap (Const.«relatedInternalConcept») ([Const.«ContentBearingObject», Const.«containsInformation»]))
axiom ax_225 : Holds (ap (Const.«subclass») ([Const.«SymbolicString», Const.«ContentBearingPhysical»]))
axiom ax_226 : Holds (ap (Const.«subclass») ([Const.«Character», Const.«SymbolicString»]))
axiom ax_227 : ∀ («?STRING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STRING», Const.«SymbolicString»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?STRING»]), ap (Const.«instance») ([«?PART», Const.«Character»])])))
axiom ax_228 : Holds (ap (Const.«instance») ([Const.«containsInformation», Const.«BinaryPredicate»]))
axiom ax_229 : Holds (ap (Const.«instance») ([Const.«containsInformation», Const.«AsymmetricRelation»]))
axiom ax_230 : Holds (ap (Const.«subrelation») ([Const.«containsInformation», Const.«represents»]))
axiom ax_231 : Holds (ap (Const.«instance») ([Const.«containsFormula», Const.«BinaryPredicate»]))
axiom ax_232 : Holds (ap (Const.«relatedInternalConcept») ([Const.«containsInformation», Const.«containsFormula»]))
axiom ax_233 : Holds (ap (Const.«subclass») ([Const.«Icon», Const.«ContentBearingPhysical»]))
axiom ax_234 : Holds (ap (Const.«subclass») ([Const.«Recording», Const.«ContentBearingObject»]))
axiom ax_235 : Holds (ap (Const.«subclass») ([Const.«MotionPicture», Const.«Recording»]))
axiom ax_236 : Holds (ap (Const.«subclass») ([Const.«MotionPicture», Const.«Text»]))
axiom ax_237 : Holds (ap (Const.«subclass») ([Const.«LinguisticExpression», Const.«ContentBearingPhysical»]))
axiom ax_238 : Holds (ap (Const.«disjoint») ([Const.«LinguisticExpression», Const.«Icon»]))
axiom ax_239 : Holds (ap (Const.«subclass») ([Const.«Language», Const.«LinguisticExpression»]))
axiom ax_240 : Holds (ap (Const.«disjointDecomposition») ([Const.«Language», Const.«AnimalLanguage», Const.«HumanLanguage», Const.«ComputerLanguage»]))
axiom ax_241 : Holds (ap (Const.«subclass») ([Const.«WrittenLanguage», Const.«Language»]))
axiom ax_242 : Holds (ap (Const.«subclass») ([Const.«AnimalLanguage», Const.«Language»]))
axiom ax_243 : ∀ («?AGENT» : Obj) («?LANG» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LANG», Const.«AnimalLanguage»]), ap (Const.«agent») ([«?PROC», «?AGENT»]), ap (Const.«instrument») ([«?PROC», «?LANG»])]) (mkAnd [ap (Const.«instance») ([«?AGENT», Const.«Animal»]), mkNot (ap (Const.«instance») ([«?AGENT», Const.«Human»]))]))
axiom ax_244 : Holds (ap (Const.«subclass») ([Const.«ArtificialLanguage», Const.«Language»]))
axiom ax_245 : Holds (ap (Const.«subclass») ([Const.«ComputerLanguage», Const.«ArtificialLanguage»]))
axiom ax_246 : ∀ («?AGENT» : Obj) («?LANG» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LANG», Const.«ComputerLanguage»]), ap (Const.«agent») ([«?PROC», «?AGENT»]), ap (Const.«instrument») ([«?PROC», «?LANG»])]) (ap (Const.«instance») ([«?AGENT», Const.«Machine»])))
axiom ax_247 : Holds (ap (Const.«subclass») ([Const.«HumanLanguage», Const.«Language»]))
axiom ax_248 : Holds (ap (Const.«partition») ([Const.«HumanLanguage», Const.«NaturalLanguage», Const.«ConstructedLanguage»]))
axiom ax_249 : Holds (ap (Const.«partition») ([Const.«HumanLanguage», Const.«SpokenHumanLanguage», Const.«ManualHumanLanguage»]))
axiom ax_250 : ∀ («?AGENT» : Obj) («?LANG» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LANG», Const.«HumanLanguage»]), ap (Const.«agent») ([«?PROC», «?AGENT»]), ap (Const.«instrument») ([«?PROC», «?LANG»])]) (ap (Const.«instance») ([«?AGENT», Const.«Human»])))
axiom ax_251 : Holds (ap (Const.«subclass») ([Const.«ConstructedLanguage», Const.«HumanLanguage»]))
axiom ax_252 : Holds (ap (Const.«subclass») ([Const.«ConstructedLanguage», Const.«ArtificialLanguage»]))
axiom ax_253 : ∀ («?LANG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?LANG», Const.«ConstructedLanguage»])) (mkExists (fun («?PLAN» : Obj) => mkAnd [ap (Const.«instance») ([«?PLAN», Const.«Planning»]), ap (Const.«result») ([«?PLAN», «?LANG»])])))
axiom ax_254 : Holds (ap (Const.«subclass») ([Const.«NaturalLanguage», Const.«HumanLanguage»]))
axiom ax_255 : Holds (ap (Const.«subclass») ([Const.«ManualHumanLanguage», Const.«HumanLanguage»]))
axiom ax_256 : Holds (ap (Const.«subclass») ([Const.«SpokenHumanLanguage», Const.«HumanLanguage»]))
axiom ax_257 : Holds (ap (Const.«instance») ([Const.«language», Const.«BinaryPredicate»]))
axiom ax_258 : Holds (ap (Const.«subclass») ([Const.«WrittenHumanLanguage», Const.«HumanLanguage»]))
axiom ax_259 : ∀ («?W» : Obj), Holds (mkImp (ap (Const.«instance») ([«?W», Const.«Writing»])) (mkExists (fun («?S» : Obj) => mkExists (fun («?L» : Obj) => mkAnd [ap (Const.«instance») ([«?S», Const.«Text»]), ap (Const.«instance») ([«?L», Const.«WrittenHumanLanguage»]), ap (Const.«language») ([«?S», «?L»])]))))
axiom ax_260 : Holds (ap (Const.«instance») ([Const.«ChineseTraditionalLanguage», Const.«WrittenHumanLanguage»]))
axiom ax_261 : Holds (ap (Const.«instance») ([Const.«ChineseSimplifiedWriting», Const.«WrittenHumanLanguage»]))
axiom ax_262 : Holds (ap (Const.«instance») ([Const.«ChinesePinyinWriting», Const.«WrittenHumanLanguage»]))
axiom ax_263 : Holds (ap (Const.«instance») ([Const.«EnglishLanguage», Const.«NaturalLanguage»]))
axiom ax_264 : Holds (ap (Const.«instance») ([Const.«EnglishLanguage», Const.«SpokenHumanLanguage»]))
axiom ax_265 : Holds (ap (Const.«subclass») ([Const.«Word», Const.«LinguisticExpression»]))
axiom ax_266 : Holds (ap (Const.«subclass») ([Const.«Formula», Const.«Sentence»]))
axiom ax_267 : Holds (ap (Const.«subclass») ([Const.«AutonomousAgent», Const.«Object»]))
axiom ax_268 : ∀ («?AGENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AGENT», Const.«AutonomousAgent»])) (mkExists (fun («?PROC» : Obj) => ap (Const.«capability») ([«?PROC», Const.«agent», «?AGENT»]))))
axiom ax_269 : Holds (ap (Const.«subclass») ([Const.«SentientAgent», Const.«AutonomousAgent»]))
axiom ax_270 : Holds (ap (Const.«subclass») ([Const.«CognitiveAgent», Const.«SentientAgent»]))
axiom ax_271 : Holds (ap (Const.«subclass») ([Const.«LegalAgent», Const.«RelationalAttribute»]))
axiom ax_272 : ∀ («?AGENT» : Obj) («?TIME» : Obj), Holds (mkIff (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?AGENT», Const.«LegalAgent»])])) (ap (Const.«holdsDuring») ([«?TIME», mkOr [ap (Const.«capability») ([Const.«LegalAction», Const.«agent», «?AGENT»]), ap (Const.«capability») ([Const.«LegalAction», Const.«patient», «?AGENT»])]])))
axiom ax_273 : Holds (ap (Const.«instance») ([Const.«leader», Const.«BinaryPredicate»]))
axiom ax_274 : Holds (ap (Const.«instance») ([Const.«leader», Const.«AsymmetricRelation»]))
axiom ax_275 : Holds (ap (Const.«instance») ([Const.«leader», Const.«SingleValuedRelation»]))
axiom ax_276 : ∀ («?TIME» : Obj) («?X» : Obj) («?Y» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«leader») ([«?X», «?Y»])])) (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?Y», Const.«Living»])])))
axiom ax_277 : Holds (ap (Const.«subclass») ([Const.«Process», Const.«Physical»]))
axiom ax_278 : Holds (ap (Const.«subclass») ([Const.«DualObjectProcess», Const.«Process»]))
axiom ax_279 : ∀ («?PROCESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROCESS», Const.«DualObjectProcess»])) (mkExists (fun («?OBJ1» : Obj) => mkExists (fun («?OBJ2» : Obj) => mkAnd [ap (Const.«patient») ([«?PROCESS», «?OBJ1»]), ap (Const.«patient») ([«?PROCESS», «?OBJ2»]), mkNot (ap (Const.«equal») ([«?OBJ1», «?OBJ2»]))]))))
axiom ax_280 : Holds (ap (Const.«subclass») ([Const.«SingleAgentProcess», Const.«Process»]))
axiom ax_281 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«SingleAgentProcess»])) (mkExists (fun («?AGENT» : Obj) => ap (Const.«agent») ([«?PROC», «?AGENT»]))))
axiom ax_282 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«SingleAgentProcess»]), ap (Const.«agent») ([«?PROC», «?AGENT1»]), ap (Const.«agent») ([«?PROC», «?AGENT2»])]) (mkAnd [ap (Const.«equal») ([«?AGENT1», «?AGENT2»]), mkNot (mkExists (fun («?AGENT3» : Obj) => mkAnd [ap (Const.«agent») ([«?PROC», «?AGENT3»]), mkNot (ap (Const.«equal») ([«?AGENT3», «?AGENT1»]))]))]))
axiom ax_283 : Holds (ap (Const.«subclass») ([Const.«Abstract», Const.«Entity»]))
axiom ax_284 : Holds (ap (Const.«disjointDecomposition») ([Const.«Abstract», Const.«Quantity», Const.«Attribute», Const.«Relation», Const.«Proposition», Const.«List»]))
axiom ax_285 : Holds (ap (Const.«subclass») ([Const.«Quantity», Const.«Abstract»]))
axiom ax_286 : Holds (ap (Const.«subclass») ([Const.«Attribute», Const.«Abstract»]))
axiom ax_287 : Holds (ap (Const.«partition») ([Const.«Attribute», Const.«InternalAttribute», Const.«RelationalAttribute»]))
axiom ax_288 : Holds (ap (Const.«instance») ([Const.«property», Const.«BinaryPredicate»]))
axiom ax_289 : Holds (ap (Const.«instance») ([Const.«attribute», Const.«AsymmetricRelation»]))
axiom ax_290 : Holds (ap (Const.«instance») ([Const.«attribute», Const.«IrreflexiveRelation»]))
axiom ax_291 : Holds (ap (Const.«instance») ([Const.«attribute», Const.«TotalValuedRelation»]))
axiom ax_292 : Holds (ap (Const.«instance») ([Const.«attribute», Const.«BinaryPredicate»]))
axiom ax_293 : Holds (ap (Const.«subrelation») ([Const.«attribute», Const.«property»]))
axiom ax_294 : Holds (ap (Const.«instance») ([Const.«manner», Const.«AsymmetricRelation»]))
axiom ax_295 : Holds (ap (Const.«instance») ([Const.«manner», Const.«IrreflexiveRelation»]))
axiom ax_296 : Holds (ap (Const.«instance») ([Const.«manner», Const.«TotalValuedRelation»]))
axiom ax_297 : Holds (ap (Const.«instance») ([Const.«manner», Const.«BinaryPredicate»]))
axiom ax_298 : Holds (ap (Const.«subrelation») ([Const.«manner», Const.«property»]))
axiom ax_299 : Holds (ap (Const.«disjointRelation») ([Const.«manner», Const.«attribute»]))
axiom ax_300 : Holds (ap (Const.«instance») ([Const.«ExtensionFn», Const.«UnaryFunction»]))
axiom ax_301 : Holds (ap (Const.«instance») ([Const.«ExtensionFn», Const.«PartialValuedRelation»]))
axiom ax_302 : Holds (ap (Const.«instance») ([Const.«AttrFn», Const.«BinaryFunction»]))
axiom ax_303 : Holds (ap (Const.«instance») ([Const.«AttrFn», Const.«PartialValuedRelation»]))
axiom ax_304 : ∀ («?ATTR» : Obj) («?CLASS» : Obj) («?I» : Obj) («?X» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?X», ap (Const.«AttrFn») ([«?CLASS», «?ATTR»])]), ap (Const.«instance») ([«?I», «?X»])]) (mkAnd [ap (Const.«instance») ([«?I», «?CLASS»]), ap (Const.«subclass») ([«?X», «?CLASS»]), ap (Const.«attribute») ([«?I», «?ATTR»])]))
axiom ax_305 : ∀ («?ATTR» : Obj) («?CLASS» : Obj) («?X» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», ap (Const.«AttrFn») ([«?CLASS», «?ATTR»])])) (mkAnd [ap (Const.«instance») ([«?X», «?CLASS»]), ap (Const.«attribute») ([«?X», «?ATTR»])]))
axiom ax_306 : ∀ («?ATTR» : Obj) («?CLASS» : Obj) («?X» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?X», «?CLASS»]), ap (Const.«attribute») ([«?X», «?ATTR»])]) (ap (Const.«instance») ([«?X», ap (Const.«AttrFn») ([«?CLASS», «?ATTR»])])))
axiom ax_307 : Holds (ap (Const.«subclass») ([Const.«InternalAttribute», Const.«Attribute»]))
axiom ax_308 : Holds (ap (Const.«subclass») ([Const.«PhysicalAttribute», Const.«InternalAttribute»]))
axiom ax_309 : Holds (ap (Const.«subclass») ([Const.«RelationalAttribute», Const.«Attribute»]))
axiom ax_310 : Holds (ap (Const.«subclass») ([Const.«Number», Const.«Quantity»]))
axiom ax_311 : Holds (ap (Const.«partition») ([Const.«Number», Const.«RealNumber», Const.«ImaginaryNumber», Const.«ComplexNumber»]))
axiom ax_312 : Holds (ap (Const.«instance») ([Const.«lessThan», Const.«BinaryPredicate»]))
axiom ax_313 : Holds (ap (Const.«instance») ([Const.«lessThan», Const.«TransitiveRelation»]))
axiom ax_314 : Holds (ap (Const.«instance») ([Const.«lessThan», Const.«IrreflexiveRelation»]))
axiom ax_315 : Holds (ap (Const.«instance») ([Const.«lessThan», Const.«RelationExtendedToQuantities»]))
axiom ax_316 : Holds (ap (Const.«trichotomizingOn») ([Const.«lessThan», Const.«RealNumber»]))
axiom ax_317 : Holds (ap (Const.«instance») ([Const.«greaterThan», Const.«BinaryPredicate»]))
axiom ax_318 : Holds (ap (Const.«instance») ([Const.«greaterThan», Const.«TotalValuedRelation»]))
axiom ax_319 : Holds (ap (Const.«instance») ([Const.«greaterThan», Const.«TransitiveRelation»]))
axiom ax_320 : Holds (ap (Const.«instance») ([Const.«greaterThan», Const.«IrreflexiveRelation»]))
axiom ax_321 : Holds (ap (Const.«instance») ([Const.«greaterThan», Const.«RelationExtendedToQuantities»]))
axiom ax_322 : Holds (ap (Const.«trichotomizingOn») ([Const.«greaterThan», Const.«RealNumber»]))
axiom ax_323 : Holds (ap (Const.«inverse») ([Const.«greaterThan», Const.«lessThan»]))
axiom ax_324 : Holds (ap (Const.«instance») ([Const.«lessThanOrEqualTo», Const.«BinaryPredicate»]))
axiom ax_325 : Holds (ap (Const.«instance») ([Const.«lessThanOrEqualTo», Const.«PartialOrderingRelation»]))
axiom ax_326 : Holds (ap (Const.«instance») ([Const.«lessThanOrEqualTo», Const.«RelationExtendedToQuantities»]))
axiom ax_327 : Holds (ap (Const.«trichotomizingOn») ([Const.«lessThanOrEqualTo», Const.«RealNumber»]))
axiom ax_328 : ∀ («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkIff (ap (Const.«lessThanOrEqualTo») ([«?NUMBER1», «?NUMBER2»])) (mkOr [ap (Const.«equal») ([«?NUMBER1», «?NUMBER2»]), ap (Const.«lessThan») ([«?NUMBER1», «?NUMBER2»])]))
axiom ax_329 : Holds (ap (Const.«instance») ([Const.«greaterThanOrEqualTo», Const.«BinaryPredicate»]))
axiom ax_330 : Holds (ap (Const.«instance») ([Const.«greaterThanOrEqualTo», Const.«PartialOrderingRelation»]))
axiom ax_331 : Holds (ap (Const.«instance») ([Const.«greaterThanOrEqualTo», Const.«RelationExtendedToQuantities»]))
axiom ax_332 : Holds (ap (Const.«trichotomizingOn») ([Const.«greaterThanOrEqualTo», Const.«RealNumber»]))
axiom ax_333 : Holds (ap (Const.«inverse») ([Const.«greaterThanOrEqualTo», Const.«lessThanOrEqualTo»]))
axiom ax_334 : Holds (ap (Const.«subclass») ([Const.«RealNumber», Const.«Number»]))
axiom ax_335 : Holds (ap (Const.«partition») ([Const.«RealNumber», Const.«NegativeRealNumber», Const.«NonnegativeRealNumber»]))
axiom ax_336 : Holds (ap (Const.«partition») ([Const.«RealNumber», Const.«RationalNumber», Const.«IrrationalNumber»]))
axiom ax_337 : Holds (ap (Const.«subclass») ([Const.«ImaginaryNumber», Const.«Number»]))
axiom ax_338 : Holds (ap (Const.«subclass») ([Const.«RationalNumber», Const.«RealNumber»]))
axiom ax_339 : Holds (ap (Const.«subclass») ([Const.«IrrationalNumber», Const.«RealNumber»]))
axiom ax_340 : Holds (ap (Const.«subclass») ([Const.«NonnegativeRealNumber», Const.«RealNumber»]))
axiom ax_341 : ∀ («?NUMBER» : Obj), Holds (mkIff (ap (Const.«instance») ([«?NUMBER», Const.«NonnegativeRealNumber»])) (mkAnd [ap (Const.«greaterThanOrEqualTo») ([«?NUMBER», numLit "0"]), ap (Const.«instance») ([«?NUMBER», Const.«RealNumber»])]))
axiom ax_342 : Holds (ap (Const.«subclass») ([Const.«PositiveRealNumber», Const.«NonnegativeRealNumber»]))
axiom ax_343 : ∀ («?NUMBER» : Obj), Holds (mkIff (ap (Const.«instance») ([«?NUMBER», Const.«PositiveRealNumber»])) (mkAnd [ap (Const.«greaterThan») ([«?NUMBER», numLit "0"]), ap (Const.«instance») ([«?NUMBER», Const.«RealNumber»])]))
axiom ax_344 : Holds (ap (Const.«subclass») ([Const.«NegativeRealNumber», Const.«RealNumber»]))
axiom ax_345 : ∀ («?NUMBER» : Obj), Holds (mkIff (ap (Const.«instance») ([«?NUMBER», Const.«NegativeRealNumber»])) (mkAnd [ap (Const.«lessThan») ([«?NUMBER», numLit "0"]), ap (Const.«instance») ([«?NUMBER», Const.«RealNumber»])]))
axiom ax_346 : Holds (ap (Const.«subclass») ([Const.«Integer», Const.«RationalNumber»]))
axiom ax_347 : Holds (ap (Const.«partition») ([Const.«Integer», Const.«OddInteger», Const.«EvenInteger»]))
axiom ax_348 : Holds (ap (Const.«partition») ([Const.«Integer», Const.«NegativeInteger», Const.«NonnegativeInteger»]))
axiom ax_349 : Holds (ap (Const.«subclass») ([Const.«EvenInteger», Const.«Integer»]))
axiom ax_350 : Holds (ap (Const.«subclass») ([Const.«OddInteger», Const.«Integer»]))
axiom ax_351 : Holds (ap (Const.«subclass») ([Const.«PrimeNumber», Const.«Integer»]))
axiom ax_352 : Holds (ap (Const.«subclass») ([Const.«NonnegativeInteger», Const.«Integer»]))
axiom ax_353 : Holds (ap (Const.«subclass») ([Const.«NonnegativeInteger», Const.«NonnegativeRealNumber»]))
axiom ax_354 : ∀ («?X» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», Const.«NonnegativeInteger»])) (ap (Const.«greaterThan») ([«?X», numLit "-1"])))
axiom ax_355 : Holds (ap (Const.«subclass») ([Const.«NegativeInteger», Const.«Integer»]))
axiom ax_356 : Holds (ap (Const.«subclass») ([Const.«NegativeInteger», Const.«NegativeRealNumber»]))
axiom ax_357 : ∀ («?X» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», Const.«NegativeInteger»])) (ap (Const.«greaterThan») ([numLit "0", «?X»])))
axiom ax_358 : Holds (ap (Const.«subclass») ([Const.«PositiveInteger», Const.«NonnegativeInteger»]))
axiom ax_359 : Holds (ap (Const.«subclass») ([Const.«PositiveInteger», Const.«PositiveRealNumber»]))
axiom ax_360 : ∀ («?X» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», Const.«PositiveInteger»])) (ap (Const.«greaterThan») ([«?X», numLit "0"])))
axiom ax_361 : Holds (ap (Const.«subclass») ([Const.«BinaryNumber», Const.«RealNumber»]))
axiom ax_362 : Holds (ap (Const.«subclass») ([Const.«ComplexNumber», Const.«Number»]))
axiom ax_363 : Holds (ap (Const.«disjoint») ([Const.«ComplexNumber», Const.«RealNumber»]))
axiom ax_364 : Holds (ap (Const.«subclass») ([Const.«PhysicalQuantity», Const.«Quantity»]))
axiom ax_365 : Holds (ap (Const.«partition») ([Const.«PhysicalQuantity», Const.«ConstantQuantity», Const.«FunctionQuantity»]))
axiom ax_366 : Holds (ap (Const.«subclass») ([Const.«ConstantQuantity», Const.«PhysicalQuantity»]))
axiom ax_367 : Holds (ap (Const.«subclass») ([Const.«TimeMeasure», Const.«ConstantQuantity»]))
axiom ax_368 : Holds (ap (Const.«subclass») ([Const.«TimeDuration», Const.«TimeMeasure»]))
axiom ax_369 : Holds (ap (Const.«subclass») ([Const.«TimePosition», Const.«TimeMeasure»]))
axiom ax_370 : Holds (ap (Const.«partition») ([Const.«TimePosition», Const.«TimeInterval», Const.«TimePoint»]))
axiom ax_371 : Holds (ap (Const.«subclass») ([Const.«TimeInterval», Const.«TimePosition»]))
axiom ax_372 : Holds (ap (Const.«subclass») ([Const.«TimePoint», Const.«TimePosition»]))
axiom ax_373 : Holds (ap (Const.«subclass») ([Const.«FunctionQuantity», Const.«PhysicalQuantity»]))
axiom ax_374 : Holds (ap (Const.«subclass») ([Const.«UnaryConstantFunctionQuantity», Const.«FunctionQuantity»]))
axiom ax_375 : Holds (ap (Const.«subclass») ([Const.«TimeDependentQuantity», Const.«UnaryConstantFunctionQuantity»]))
axiom ax_376 : Holds (ap (Const.«subclass») ([Const.«SetOrClass», Const.«Abstract»]))
axiom ax_377 : Holds (ap (Const.«partition») ([Const.«SetOrClass», Const.«Set», Const.«Class»]))
axiom ax_378 : Holds (ap (Const.«subclass») ([Const.«Class», Const.«SetOrClass»]))
axiom ax_379 : Holds (ap (Const.«subclass») ([Const.«Set», Const.«SetOrClass»]))
axiom ax_380 : Holds (ap (Const.«subclass») ([Const.«Relation», Const.«Abstract»]))
axiom ax_381 : Holds (ap (Const.«disjointDecomposition») ([Const.«Relation», Const.«BinaryRelation», Const.«TernaryRelation», Const.«QuaternaryRelation», Const.«QuintaryRelation», Const.«VariableArityRelation»]))
axiom ax_382 : Holds (ap (Const.«partition») ([Const.«Relation», Const.«Predicate», Const.«Function»]))
axiom ax_383 : Holds (ap (Const.«partition») ([Const.«Relation», Const.«TotalValuedRelation», Const.«PartialValuedRelation»]))
axiom ax_384 : Holds (ap (Const.«subclass») ([Const.«SingleValuedRelation», Const.«Relation»]))
axiom ax_385 : Holds (ap (Const.«subclass») ([Const.«SingleValuedRelation», Const.«InheritableRelation»]))
axiom ax_386 : Holds (ap (Const.«subclass») ([Const.«TotalValuedRelation», Const.«Relation»]))
axiom ax_387 : Holds (ap (Const.«subclass») ([Const.«TotalValuedRelation», Const.«InheritableRelation»]))
axiom ax_388 : Holds (ap (Const.«subclass») ([Const.«PartialValuedRelation», Const.«Relation»]))
axiom ax_389 : Holds (ap (Const.«subclass») ([Const.«BinaryRelation», Const.«Relation»]))
axiom ax_390 : Holds (ap (Const.«subclass») ([Const.«BinaryRelation», Const.«InheritableRelation»]))
axiom ax_391 : Holds (ap (Const.«subclass») ([Const.«ReflexiveRelation», Const.«BinaryRelation»]))
axiom ax_392 : Holds (ap (Const.«subclass») ([Const.«IrreflexiveRelation», Const.«BinaryRelation»]))
axiom ax_393 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«IrreflexiveRelation»])) (mkForall (fun («?INST» : Obj) => mkNot (ap («?REL») ([«?INST», «?INST»])))))
axiom ax_394 : Holds (ap (Const.«subclass») ([Const.«SymmetricRelation», Const.«BinaryRelation»]))
axiom ax_395 : Holds (ap (Const.«disjoint») ([Const.«SymmetricRelation», Const.«AntisymmetricRelation»]))
axiom ax_396 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«SymmetricRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkImp (ap («?REL») ([«?INST1», «?INST2»])) (ap («?REL») ([«?INST2», «?INST1»]))))))
axiom ax_397 : Holds (ap (Const.«subclass») ([Const.«AsymmetricRelation», Const.«IrreflexiveRelation»]))
axiom ax_398 : Holds (ap (Const.«subclass») ([Const.«AsymmetricRelation», Const.«AntisymmetricRelation»]))
axiom ax_399 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«AsymmetricRelation»])) (mkAnd [ap (Const.«instance») ([«?REL», Const.«AntisymmetricRelation»]), ap (Const.«instance») ([«?REL», Const.«IrreflexiveRelation»])]))
axiom ax_400 : ∀ («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«AntisymmetricRelation»]), ap (Const.«instance») ([«?REL», Const.«IrreflexiveRelation»])]) (ap (Const.«instance») ([«?REL», Const.«AsymmetricRelation»])))
axiom ax_401 : Holds (ap (Const.«subclass») ([Const.«AntisymmetricRelation», Const.«BinaryRelation»]))
axiom ax_402 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«AntisymmetricRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkImp (mkAnd [ap («?REL») ([«?INST1», «?INST2»]), ap («?REL») ([«?INST2», «?INST1»])]) (ap (Const.«equal») ([«?INST1», «?INST2»]))))))
axiom ax_403 : Holds (ap (Const.«subclass») ([Const.«TrichotomizingRelation», Const.«BinaryRelation»]))
axiom ax_404 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«TrichotomizingRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkOr [mkAnd [ap («?REL») ([«?INST1», «?INST2»]), mkNot (ap (Const.«equal») ([«?INST1», «?INST2»])), mkNot (ap («?REL») ([«?INST2», «?INST1»]))], mkAnd [mkNot (ap («?REL») ([«?INST1», «?INST2»])), ap (Const.«equal») ([«?INST1», «?INST2»]), mkNot (ap («?REL») ([«?INST2», «?INST1»]))], mkAnd [mkNot (ap («?REL») ([«?INST1», «?INST2»])), mkNot (ap (Const.«equal») ([«?INST1», «?INST2»])), ap («?REL») ([«?INST2», «?INST1»])]]))))
axiom ax_405 : Holds (ap (Const.«subclass») ([Const.«TransitiveRelation», Const.«BinaryRelation»]))
axiom ax_406 : Holds (ap (Const.«disjoint») ([Const.«TransitiveRelation», Const.«IntransitiveRelation»]))
axiom ax_407 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«TransitiveRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkForall (fun («?INST3» : Obj) => mkImp (mkAnd [ap («?REL») ([«?INST1», «?INST2»]), ap («?REL») ([«?INST2», «?INST3»])]) (ap («?REL») ([«?INST1», «?INST3»])))))))
axiom ax_408 : Holds (ap (Const.«subclass») ([Const.«IntransitiveRelation», Const.«BinaryRelation»]))
axiom ax_409 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«IntransitiveRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkForall (fun («?INST3» : Obj) => mkImp (mkAnd [ap («?REL») ([«?INST1», «?INST2»]), ap («?REL») ([«?INST2», «?INST3»])]) (mkNot (ap («?REL») ([«?INST1», «?INST3»]))))))))
axiom ax_410 : Holds (ap (Const.«subclass») ([Const.«PartialOrderingRelation», Const.«TransitiveRelation»]))
axiom ax_411 : Holds (ap (Const.«subclass») ([Const.«PartialOrderingRelation», Const.«AntisymmetricRelation»]))
axiom ax_412 : Holds (ap (Const.«subclass») ([Const.«PartialOrderingRelation», Const.«ReflexiveRelation»]))
axiom ax_413 : Holds (ap (Const.«subclass») ([Const.«PartialOrderingRelation», Const.«TotalValuedRelation»]))
axiom ax_414 : Holds (ap (Const.«subclass») ([Const.«TotalOrderingRelation», Const.«PartialOrderingRelation»]))
axiom ax_415 : Holds (ap (Const.«subclass») ([Const.«TotalOrderingRelation», Const.«TrichotomizingRelation»]))
axiom ax_416 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«TotalOrderingRelation»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkAnd [mkOr [ap («?REL») ([«?INST1», «?INST2»]), ap («?REL») ([«?INST2», «?INST1»])], mkOr [mkNot (ap («?REL») ([«?INST1», «?INST2»])), mkNot (ap («?REL») ([«?INST2», «?INST1»]))]]))))
axiom ax_417 : Holds (ap (Const.«subclass») ([Const.«EquivalenceRelation», Const.«TransitiveRelation»]))
axiom ax_418 : Holds (ap (Const.«subclass») ([Const.«EquivalenceRelation», Const.«SymmetricRelation»]))
axiom ax_419 : Holds (ap (Const.«subclass») ([Const.«EquivalenceRelation», Const.«ReflexiveRelation»]))
axiom ax_420 : Holds (ap (Const.«subclass») ([Const.«CaseRole», Const.«BinaryPredicate»]))
axiom ax_421 : Holds (ap (Const.«subclass») ([Const.«CaseRole», Const.«InheritableRelation»]))
axiom ax_422 : Holds (ap (Const.«subclass») ([Const.«CaseRole», Const.«AsymmetricRelation»]))
axiom ax_423 : Holds (ap (Const.«instance») ([Const.«involvedInEvent», Const.«BinaryPredicate»]))
axiom ax_424 : Holds (ap (Const.«instance») ([Const.«involvedInEvent», Const.«AsymmetricRelation»]))
axiom ax_425 : ∀ («?R» : Obj), Holds (mkImp (ap (Const.«instance») ([«?R», Const.«CaseRole»])) (ap (Const.«subrelation») ([«?R», Const.«involvedInEvent»])))
axiom ax_426 : Holds (ap (Const.«instance») ([Const.«agent», Const.«CaseRole»]))
axiom ax_427 : Holds (ap (Const.«instance») ([Const.«agent», Const.«PartialValuedRelation»]))
axiom ax_428 : Holds (ap (Const.«subrelation») ([Const.«agent», Const.«involvedInEvent»]))
axiom ax_429 : Holds (ap (Const.«instance») ([Const.«destination», Const.«CaseRole»]))
axiom ax_430 : Holds (ap (Const.«instance») ([Const.«destination», Const.«PartialValuedRelation»]))
axiom ax_431 : Holds (ap (Const.«subrelation») ([Const.«destination», Const.«involvedInEvent»]))
axiom ax_432 : Holds (ap (Const.«instance») ([Const.«experiencer», Const.«CaseRole»]))
axiom ax_433 : Holds (ap (Const.«instance») ([Const.«experiencer», Const.«PartialValuedRelation»]))
axiom ax_434 : Holds (ap (Const.«subrelation») ([Const.«experiencer», Const.«involvedInEvent»]))
axiom ax_435 : Holds (ap (Const.«subrelation») ([Const.«instrument», Const.«patient»]))
axiom ax_436 : Holds (ap (Const.«instance») ([Const.«instrument», Const.«CaseRole»]))
axiom ax_437 : Holds (ap (Const.«instance») ([Const.«instrument», Const.«PartialValuedRelation»]))
axiom ax_438 : Holds (ap (Const.«instance») ([Const.«origin», Const.«CaseRole»]))
axiom ax_439 : Holds (ap (Const.«instance») ([Const.«origin», Const.«PartialValuedRelation»]))
axiom ax_440 : Holds (ap (Const.«subrelation») ([Const.«origin», Const.«involvedInEvent»]))
axiom ax_441 : Holds (ap (Const.«instance») ([Const.«patient», Const.«CaseRole»]))
axiom ax_442 : Holds (ap (Const.«instance») ([Const.«patient», Const.«PartialValuedRelation»]))
axiom ax_443 : Holds (ap (Const.«subrelation») ([Const.«patient», Const.«involvedInEvent»]))
axiom ax_444 : Holds (ap (Const.«subrelation») ([Const.«resource», Const.«patient»]))
axiom ax_445 : Holds (ap (Const.«instance») ([Const.«resource», Const.«CaseRole»]))
axiom ax_446 : Holds (ap (Const.«instance») ([Const.«resource», Const.«PartialValuedRelation»]))
axiom ax_447 : Holds (ap (Const.«disjointRelation») ([Const.«resource», Const.«result»]))
axiom ax_448 : Holds (ap (Const.«disjointRelation») ([Const.«resource», Const.«instrument»]))
axiom ax_449 : Holds (ap (Const.«disjointRelation») ([Const.«result», Const.«instrument»]))
axiom ax_450 : Holds (ap (Const.«instance») ([Const.«resourceExhausted», Const.«CaseRole»]))
axiom ax_451 : Holds (ap (Const.«instance») ([Const.«resourceExhausted», Const.«AsymmetricRelation»]))
axiom ax_452 : Holds (ap (Const.«instance») ([Const.«resourceExhausted», Const.«BinaryPredicate»]))
axiom ax_453 : Holds (ap (Const.«instance») ([Const.«resourceExhausted», Const.«PartialValuedRelation»]))
axiom ax_454 : ∀ («?C» : Obj) («?P» : Obj) («?R» : Obj), Holds (mkImp (mkAnd [ap (Const.«resourceExhausted») ([«?P», «?R»]), ap (Const.«instance») ([«?R», «?C»])]) (ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([ap (Const.«WhenFn») ([«?P»])]), mkNot (mkExists (fun («?OBJ1» : Obj) => mkAnd [ap (Const.«part») ([«?OBJ1», «?R»]), ap (Const.«instance») ([«?OBJ1», «?C»])]))])))
axiom ax_455 : Holds (ap (Const.«subrelation») ([Const.«result», Const.«patient»]))
axiom ax_456 : Holds (ap (Const.«instance») ([Const.«result», Const.«CaseRole»]))
axiom ax_457 : Holds (ap (Const.«instance») ([Const.«result», Const.«PartialValuedRelation»]))
axiom ax_458 : Holds (ap (Const.«subclass») ([Const.«InheritableRelation», Const.«Relation»]))
axiom ax_459 : Holds (ap (Const.«subclass») ([Const.«ProbabilityRelation», Const.«Relation»]))
axiom ax_460 : Holds (ap (Const.«subclass») ([Const.«ProbabilityRelation», Const.«InheritableRelation»]))
axiom ax_461 : Holds (ap (Const.«instance») ([Const.«ProbabilityFn», Const.«ProbabilityRelation»]))
axiom ax_462 : Holds (ap (Const.«instance») ([Const.«ProbabilityFn», Const.«TotalValuedRelation»]))
axiom ax_463 : Holds (ap (Const.«instance») ([Const.«ProbabilityFn», Const.«UnaryFunction»]))
axiom ax_464 : Holds (ap (Const.«instance») ([Const.«conditionalProbability», Const.«ProbabilityRelation»]))
axiom ax_465 : Holds (ap (Const.«instance») ([Const.«conditionalProbability», Const.«TernaryPredicate»]))
axiom ax_466 : Holds (ap (Const.«instance») ([Const.«increasesLikelihood», Const.«ProbabilityRelation»]))
axiom ax_467 : Holds (ap (Const.«instance») ([Const.«increasesLikelihood», Const.«BinaryPredicate»]))
axiom ax_468 : Holds (ap (Const.«instance») ([Const.«increasesLikelihood», Const.«IrreflexiveRelation»]))
axiom ax_469 : Holds (ap (Const.«disjointRelation») ([Const.«increasesLikelihood», Const.«decreasesLikelihood»]))
axiom ax_470 : Holds (ap (Const.«disjointRelation») ([Const.«increasesLikelihood», Const.«independentProbability»]))
axiom ax_471 : Holds (ap (Const.«disjointRelation») ([Const.«decreasesLikelihood», Const.«independentProbability»]))
axiom ax_472 : ∀ («?FORMULA1» : Obj) («?FORMULA2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«increasesLikelihood») ([«?FORMULA1», «?FORMULA2»]), ap (Const.«equal») ([ap (Const.«ProbabilityFn») ([«?FORMULA2»]), «?NUMBER1»]), ap (Const.«conditionalProbability») ([«?FORMULA1», «?FORMULA2», «?NUMBER2»])]) (ap (Const.«greaterThan») ([«?NUMBER2», «?NUMBER1»])))
axiom ax_473 : Holds (ap (Const.«instance») ([Const.«decreasesLikelihood», Const.«ProbabilityRelation»]))
axiom ax_474 : Holds (ap (Const.«instance») ([Const.«decreasesLikelihood», Const.«BinaryPredicate»]))
axiom ax_475 : Holds (ap (Const.«instance») ([Const.«decreasesLikelihood», Const.«IrreflexiveRelation»]))
axiom ax_476 : ∀ («?FORMULA1» : Obj) («?FORMULA2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«decreasesLikelihood») ([«?FORMULA1», «?FORMULA2»]), ap (Const.«equal») ([ap (Const.«ProbabilityFn») ([«?FORMULA2»]), «?NUMBER1»]), ap (Const.«conditionalProbability») ([«?FORMULA1», «?FORMULA2», «?NUMBER2»])]) (ap (Const.«lessThan») ([«?NUMBER2», «?NUMBER1»])))
axiom ax_477 : Holds (ap (Const.«instance») ([Const.«independentProbability», Const.«ProbabilityRelation»]))
axiom ax_478 : Holds (ap (Const.«instance») ([Const.«independentProbability», Const.«BinaryPredicate»]))
axiom ax_479 : Holds (ap (Const.«instance») ([Const.«independentProbability», Const.«SymmetricRelation»]))
axiom ax_480 : ∀ («?FORMULA1» : Obj) («?FORMULA2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«independentProbability») ([«?FORMULA1», «?FORMULA2»]), ap (Const.«equal») ([ap (Const.«ProbabilityFn») ([«?FORMULA2»]), «?NUMBER1»]), ap (Const.«conditionalProbability») ([«?FORMULA1», «?FORMULA2», «?NUMBER2»])]) (ap (Const.«equal») ([«?NUMBER2», «?NUMBER1»])))
axiom ax_481 : ∀ («?FORMULA1» : Obj) («?FORMULA2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FORMULA1», Const.«Formula»]), ap (Const.«instance») ([«?FORMULA2», Const.«Formula»])]) (mkOr [ap (Const.«increasesLikelihood») ([«?FORMULA1», «?FORMULA2»]), ap (Const.«decreasesLikelihood») ([«?FORMULA1», «?FORMULA2»]), ap (Const.«independentProbability») ([«?FORMULA1», «?FORMULA2»])]))
axiom ax_482 : Holds (ap (Const.«subclass») ([Const.«SpatialRelation», Const.«Relation»]))
axiom ax_483 : Holds (ap (Const.«subclass») ([Const.«SpatialRelation», Const.«InheritableRelation»]))
axiom ax_484 : Holds (ap (Const.«subclass») ([Const.«TemporalRelation», Const.«Relation»]))
axiom ax_485 : Holds (ap (Const.«subclass») ([Const.«TemporalRelation», Const.«InheritableRelation»]))
axiom ax_486 : Holds (ap (Const.«subclass») ([Const.«IntentionalRelation», Const.«InheritableRelation»]))
axiom ax_487 : Holds (ap (Const.«subclass») ([Const.«IntentionalRelation», Const.«Relation»]))
axiom ax_488 : ∀ («?AGENT» : Obj) («?OBJ» : Obj) («?REL» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«IntentionalRelation»]), ap («?REL») ([«?AGENT»] ++ «@ROW»), ap (Const.«inList») ([«?OBJ», ap (Const.«ListFn») («@ROW»)])]) (ap (Const.«inScopeOfInterest») ([«?AGENT», «?OBJ»])))
axiom ax_489 : Holds (ap (Const.«instance») ([Const.«prefers», Const.«TernaryPredicate»]))
axiom ax_490 : Holds (ap (Const.«instance») ([Const.«prefers», Const.«IntentionalRelation»]))
axiom ax_491 : Holds (ap (Const.«subclass») ([Const.«PropositionalAttitude», Const.«IntentionalRelation»]))
axiom ax_492 : Holds (ap (Const.«subclass») ([Const.«PropositionalAttitude», Const.«AsymmetricRelation»]))
axiom ax_493 : Holds (ap (Const.«subclass») ([Const.«PropositionalAttitude», Const.«InheritableRelation»]))
axiom ax_494 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«PropositionalAttitude»]), ap («?REL») ([«?AGENT», «?FORMULA»])]) (ap (Const.«instance») ([«?FORMULA», Const.«Formula»])))
axiom ax_495 : Holds (ap (Const.«subclass») ([Const.«ObjectAttitude», Const.«IntentionalRelation»]))
axiom ax_496 : Holds (ap (Const.«subclass») ([Const.«ObjectAttitude», Const.«InheritableRelation»]))
axiom ax_497 : Holds (ap (Const.«disjoint») ([Const.«ObjectAttitude», Const.«PropositionalAttitude»]))
axiom ax_498 : ∀ («?AGENT» : Obj) («?REL» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«ObjectAttitude»]), ap («?REL») ([«?AGENT», «?THING»])]) (ap (Const.«instance») ([«?THING», Const.«Physical»])))
axiom ax_499 : Holds (ap (Const.«instance») ([Const.«inScopeOfInterest», Const.«BinaryPredicate»]))
axiom ax_500 : Holds (ap (Const.«instance») ([Const.«inScopeOfInterest», Const.«IntentionalRelation»]))
axiom ax_501 : ∀ («?AGENT» : Obj) («?OBJECT» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«IntentionalProcess»]), ap (Const.«agent») ([«?PROCESS», «?AGENT»]), ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»]), ap (Const.«patient») ([«?PROCESS», «?OBJECT»])]) (ap (Const.«inScopeOfInterest») ([«?AGENT», «?OBJECT»])))
axiom ax_502 : ∀ («?AGENT» : Obj) («?OBJECT» : Obj), Holds (mkImp (ap (Const.«inScopeOfInterest») ([«?AGENT», «?OBJECT»])) (mkExists (fun («?PROCESS» : Obj) => mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«IntentionalProcess»]), ap (Const.«agent») ([«?PROCESS», «?AGENT»]), ap (Const.«patient») ([«?PROCESS», «?OBJECT»])])))
axiom ax_503 : Holds (ap (Const.«instance») ([Const.«needs», Const.«ObjectAttitude»]))
axiom ax_504 : Holds (ap (Const.«instance») ([Const.«needs», Const.«BinaryPredicate»]))
axiom ax_505 : Holds (ap (Const.«subrelation») ([Const.«needs», Const.«inScopeOfInterest»]))
axiom ax_506 : ∀ («?AGENT» : Obj) («?OBJECT» : Obj), Holds (mkImp (ap (Const.«needs») ([«?AGENT», «?OBJECT»])) (ap (Const.«wants») ([«?AGENT», «?OBJECT»])))
axiom ax_507 : Holds (ap (Const.«instance») ([Const.«wants», Const.«ObjectAttitude»]))
axiom ax_508 : Holds (ap (Const.«instance») ([Const.«wants», Const.«BinaryPredicate»]))
axiom ax_509 : Holds (ap (Const.«subrelation») ([Const.«wants», Const.«inScopeOfInterest»]))
axiom ax_510 : Holds (ap (Const.«relatedInternalConcept») ([Const.«wants», Const.«desires»]))
axiom ax_511 : ∀ («?AGENT» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«wants») ([«?AGENT», «?OBJ»])) (mkExists (fun («?PURP» : Obj) => ap (Const.«hasPurposeForAgent») ([«?OBJ», «?PURP», «?AGENT»]))))
axiom ax_512 : ∀ («?AGENT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«wants») ([«?AGENT», «?OBJ»]), ap (Const.«instance») ([«?OBJ», Const.«Object»])]) (ap (Const.«desires») ([«?AGENT», ap (Const.«possesses») ([«?AGENT», «?OBJ»])])))
axiom ax_513 : Holds (ap (Const.«instance») ([Const.«desires», Const.«PropositionalAttitude»]))
axiom ax_514 : Holds (ap (Const.«instance») ([Const.«desires», Const.«BinaryPredicate»]))
axiom ax_515 : Holds (ap (Const.«subrelation») ([Const.«desires», Const.«inScopeOfInterest»]))
axiom ax_516 : Holds (ap (Const.«relatedInternalConcept») ([Const.«desires», Const.«wants»]))
axiom ax_517 : Holds (ap (Const.«instance») ([Const.«considers», Const.«PropositionalAttitude»]))
axiom ax_518 : Holds (ap (Const.«instance») ([Const.«considers», Const.«BinaryPredicate»]))
axiom ax_519 : Holds (ap (Const.«subrelation») ([Const.«considers», Const.«inScopeOfInterest»]))
axiom ax_520 : Holds (ap (Const.«instance») ([Const.«believes», Const.«PropositionalAttitude»]))
axiom ax_521 : Holds (ap (Const.«instance») ([Const.«believes», Const.«BinaryPredicate»]))
axiom ax_522 : Holds (ap (Const.«subrelation») ([Const.«believes», Const.«inScopeOfInterest»]))
axiom ax_523 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj), Holds (mkImp (ap (Const.«believes») ([«?AGENT», «?FORMULA»])) (mkExists (fun («?TIME» : Obj) => ap (Const.«holdsDuring») ([«?TIME», ap (Const.«considers») ([«?AGENT», «?FORMULA»])]))))
axiom ax_524 : Holds (ap (Const.«instance») ([Const.«knows», Const.«PropositionalAttitude»]))
axiom ax_525 : Holds (ap (Const.«instance») ([Const.«knows», Const.«BinaryPredicate»]))
axiom ax_526 : Holds (ap (Const.«subrelation») ([Const.«knows», Const.«inScopeOfInterest»]))
axiom ax_527 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj), Holds (mkImp (ap (Const.«knows») ([«?AGENT», «?FORMULA»])) (ap (Const.«believes») ([«?AGENT», «?FORMULA»])))
axiom ax_528 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj), Holds (mkImp (ap (Const.«knows») ([«?AGENT», «?FORMULA»])) (ap (Const.«truth») ([«?FORMULA», Const.«True»])))
axiom ax_529 : Holds (ap (Const.«instance») ([Const.«says», Const.«PropositionalAttitude»]))
axiom ax_530 : Holds (ap (Const.«instance») ([Const.«says», Const.«BinaryPredicate»]))
axiom ax_531 : Holds (ap (Const.«subrelation») ([Const.«says», Const.«inScopeOfInterest»]))
axiom ax_532 : Holds (ap (Const.«subclass») ([Const.«TernaryRelation», Const.«Relation»]))
axiom ax_533 : Holds (ap (Const.«subclass») ([Const.«TernaryRelation», Const.«InheritableRelation»]))
axiom ax_534 : Holds (ap (Const.«subclass») ([Const.«QuaternaryRelation», Const.«Relation»]))
axiom ax_535 : Holds (ap (Const.«subclass») ([Const.«QuaternaryRelation», Const.«InheritableRelation»]))
axiom ax_536 : Holds (ap (Const.«subclass») ([Const.«QuintaryRelation», Const.«Relation»]))
axiom ax_537 : Holds (ap (Const.«subclass») ([Const.«QuintaryRelation», Const.«InheritableRelation»]))
axiom ax_538 : Holds (ap (Const.«subclass») ([Const.«List», Const.«Abstract»]))
axiom ax_539 : Holds (ap (Const.«subclass») ([Const.«UniqueList», Const.«List»]))
axiom ax_540 : ∀ («?LIST» : Obj), Holds (mkImp (ap (Const.«instance») ([«?LIST», Const.«UniqueList»])) (mkForall (fun («?NUMBER1» : Obj) => mkForall (fun («?NUMBER2» : Obj) => mkImp (ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST», «?NUMBER1»]), ap (Const.«ListOrderFn») ([«?LIST», «?NUMBER2»])])) (ap (Const.«equal») ([«?NUMBER1», «?NUMBER2»]))))))
axiom ax_541 : Holds (ap (Const.«instance») ([Const.«NullList», Const.«List»]))
axiom ax_542 : Holds (ap (Const.«instance») ([Const.«ListFn», Const.«Function»]))
axiom ax_543 : Holds (ap (Const.«instance») ([Const.«ListFn», Const.«VariableArityRelation»]))
axiom ax_544 : ∀ («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«exhaustiveDecomposition») ([«?CLASS»] ++ «@ROW»)) (mkForall (fun («?OBJ» : Obj) => mkImp (ap (Const.«instance») ([«?OBJ», «?CLASS»])) (mkExists (fun («?ITEM» : Obj) => mkAnd [ap (Const.«inList») ([«?ITEM», ap (Const.«ListFn») («@ROW»)]), ap (Const.«instance») ([«?OBJ», «?ITEM»])])))))
axiom ax_545 : ∀ («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«disjointDecomposition») ([«?CLASS»] ++ «@ROW»)) (mkForall (fun («?ITEM» : Obj) => mkImp (ap (Const.«inList») ([«?ITEM», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«subclass») ([«?ITEM», «?CLASS»])))))
axiom ax_546 : ∀ («?CLASS» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«disjointDecomposition») ([«?CLASS»] ++ «@ROW»)) (mkForall (fun («?ITEM1» : Obj) => mkForall (fun («?ITEM2» : Obj) => mkImp (mkAnd [ap (Const.«inList») ([«?ITEM1», ap (Const.«ListFn») («@ROW»)]), ap (Const.«inList») ([«?ITEM2», ap (Const.«ListFn») («@ROW»)]), mkNot (ap (Const.«equal») ([«?ITEM1», «?ITEM2»]))]) (ap (Const.«disjoint») ([«?ITEM1», «?ITEM2»]))))))
axiom ax_547 : ∀ («?CLASS» : Obj) («?ROW1» : Obj) («?ROW2» : Obj) («?ROW3» : Obj), Holds (mkImp (ap (Const.«disjointDecomposition») ([«?CLASS», «?ROW1», «?ROW2», «?ROW3»])) (mkAnd [ap (Const.«disjoint») ([«?ROW1», «?ROW2»]), ap (Const.«disjoint») ([«?ROW2», «?ROW3»]), ap (Const.«disjoint») ([«?ROW3», «?ROW1»])]))
axiom ax_548 : Holds (ap (Const.«instance») ([Const.«ListOrderFn», Const.«BinaryFunction»]))
axiom ax_549 : Holds (ap (Const.«instance») ([Const.«ListOrderFn», Const.«PartialValuedRelation»]))
axiom ax_550 : ∀ («?CLASS» : Obj) («?NUMBER» : Obj) («?REL» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«domain») ([«?REL», «?NUMBER», «?CLASS»]), ap (Const.«instance») ([«?REL», Const.«Predicate»]), ap («?REL») («@ROW»)]) (ap (Const.«instance») ([ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW»), «?NUMBER»]), «?CLASS»])))
axiom ax_551 : ∀ («?CLASS» : Obj) («?NUMBER» : Obj) («?REL» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«domainSubclass») ([«?REL», «?NUMBER», «?CLASS»]), ap (Const.«instance») ([«?REL», Const.«Predicate»]), ap («?REL») («@ROW»)]) (ap (Const.«subclass») ([ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW»), «?NUMBER»]), «?CLASS»])))
axiom ax_552 : Holds (ap (Const.«instance») ([Const.«ListLengthFn», Const.«UnaryFunction»]))
axiom ax_553 : Holds (ap (Const.«instance») ([Const.«ListLengthFn», Const.«TotalValuedRelation»]))
axiom ax_554 : Holds (mkForallRow (fun («@ROW» : List Obj) => mkForall (fun («?ITEM» : Obj) => ap (Const.«equal») ([ap (Const.«ListLengthFn») ([ap (Const.«ListFn») («@ROW» ++ [«?ITEM»])]), ap (Const.«SuccessorFn») ([ap (Const.«ListLengthFn») ([ap (Const.«ListFn») («@ROW»)])])]))))
axiom ax_555 : Holds (mkForallRow (fun («@ROW» : List Obj) => mkForall (fun («?ITEM» : Obj) => ap (Const.«equal») ([ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ROW» ++ [«?ITEM»]), ap (Const.«ListLengthFn») ([ap (Const.«ListFn») («@ROW» ++ [«?ITEM»])])]), «?ITEM»]))))
axiom ax_556 : ∀ («?NUMBER» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«valence») ([«?REL», «?NUMBER»]), ap (Const.«instance») ([«?REL», Const.«Predicate»])]) (mkForallRow (fun («@ROW» : List Obj) => mkImp (ap («?REL») («@ROW»)) (ap (Const.«equal») ([ap (Const.«ListLengthFn») ([ap (Const.«ListFn») («@ROW»)]), «?NUMBER»])))))
axiom ax_557 : Holds (ap (Const.«instance») ([Const.«ListConcatenateFn», Const.«BinaryFunction»]))
axiom ax_558 : Holds (ap (Const.«instance») ([Const.«ListConcatenateFn», Const.«TotalValuedRelation»]))
axiom ax_559 : ∀ («?LIST1» : Obj) («?LIST2» : Obj) («?LIST3» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?LIST3», ap (Const.«ListConcatenateFn») ([«?LIST1», «?LIST2»])]), mkNot (ap (Const.«equal») ([«?LIST1», Const.«NullList»])), mkNot (ap (Const.«equal») ([«?LIST2», Const.«NullList»])), ap (Const.«lessThanOrEqualTo») ([«?NUMBER1», ap (Const.«ListLengthFn») ([«?LIST1»])]), ap (Const.«lessThanOrEqualTo») ([«?NUMBER2», ap (Const.«ListLengthFn») ([«?LIST2»])]), ap (Const.«instance») ([«?NUMBER1», Const.«PositiveInteger»]), ap (Const.«instance») ([«?NUMBER2», Const.«PositiveInteger»])]) (mkAnd [ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST3», «?NUMBER1»]), ap (Const.«ListOrderFn») ([«?LIST1», «?NUMBER1»])]), ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST3», ap (Const.«AdditionFn») ([ap (Const.«ListLengthFn») ([«?LIST1»]), «?NUMBER2»])]), ap (Const.«ListOrderFn») ([«?LIST2», «?NUMBER2»])])]))
axiom ax_560 : Holds (ap (Const.«instance») ([Const.«inList», Const.«BinaryPredicate»]))
axiom ax_561 : Holds (ap (Const.«instance») ([Const.«inList», Const.«PartialValuedRelation»]))
axiom ax_562 : ∀ («?ITEM» : Obj) («?LIST» : Obj), Holds (mkImp (ap (Const.«inList») ([«?ITEM», «?LIST»])) (mkExists (fun («?NUMBER» : Obj) => ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST», «?NUMBER»]), «?ITEM»]))))
axiom ax_563 : Holds (ap (Const.«instance») ([Const.«subList», Const.«BinaryPredicate»]))
axiom ax_564 : Holds (ap (Const.«instance») ([Const.«subList», Const.«PartialOrderingRelation»]))
axiom ax_565 : Holds (ap (Const.«instance») ([Const.«SubListFn», Const.«TernaryFunction»]))
axiom ax_566 : ∀ («?E» : Obj) («?L» : Obj) («?R» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?R», ap (Const.«SubListFn») ([«?S», «?E», «?L»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?E», «?S»]), numLit "0"])]) (ap (Const.«equal») ([«?R», Const.«NullList»])))
axiom ax_567 : ∀ («?E» : Obj) («?L» : Obj) («?R» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?R», ap (Const.«SubListFn») ([«?S», «?E», «?L»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?E», «?S»]), numLit "1"])]) (ap (Const.«equal») ([«?R», ap (Const.«ListFn») ([ap (Const.«ListOrderFn») ([«?L», «?S»])])])))
axiom ax_568 : ∀ («?E» : Obj) («?L» : Obj) («?R» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?R», ap (Const.«SubListFn») ([«?S», «?E», «?L»])]), ap (Const.«greaterThan») ([ap (Const.«SubtractionFn») ([«?E», «?S»]), numLit "1"])]) (ap (Const.«equal») ([«?R», ap (Const.«ListConcatenateFn») ([ap (Const.«ListFn») ([ap (Const.«ListOrderFn») ([«?L», «?S»])]), ap (Const.«SubListFn») ([ap (Const.«AdditionFn») ([numLit "1", «?S»]), «?E», «?L»])])])))
axiom ax_569 : Holds (ap (Const.«instance») ([Const.«LastFn», Const.«UnaryFunction»]))
axiom ax_570 : ∀ («?ITEM» : Obj) («?LIST» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«LastFn») ([«?LIST»]), «?ITEM»])) (mkExists (fun («?NUMBER» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«ListLengthFn») ([«?LIST»]), «?NUMBER»]), ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST», «?NUMBER»]), «?ITEM»])])))
axiom ax_571 : ∀ («?ITEM» : Obj) («?LIST» : Obj) («?NUMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«ListLengthFn») ([«?LIST»]), «?NUMBER»]), ap (Const.«equal») ([ap (Const.«ListOrderFn») ([«?LIST», «?NUMBER»]), «?ITEM»])]) (ap (Const.«equal») ([ap (Const.«LastFn») ([«?LIST»]), «?ITEM»])))
axiom ax_572 : Holds (ap (Const.«instance») ([Const.«FirstFn», Const.«UnaryFunction»]))
axiom ax_573 : ∀ («?LIST» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LIST», Const.«List»]), mkNot (ap (Const.«equal») ([«?LIST», Const.«NullList»]))]) (ap (Const.«equal») ([ap (Const.«FirstFn») ([«?LIST»]), ap (Const.«ListOrderFn») ([«?LIST», numLit "1"])])))
axiom ax_574 : Holds (ap (Const.«instance») ([Const.«ListSumFn», Const.«UnaryFunction»]))
axiom ax_575 : ∀ («?A» : Obj) («?L» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?A», ap (Const.«ListSumFn») ([«?L»])]), ap (Const.«equal») ([numLit "1", ap (Const.«ListLengthFn») ([«?L»])])]) (ap (Const.«equal») ([«?A», ap (Const.«ListOrderFn») ([«?L», numLit "1"])])))
axiom ax_576 : ∀ («?A» : Obj) («?L» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?A», ap (Const.«ListSumFn») ([«?L»])]), ap (Const.«greaterThan») ([ap (Const.«ListLengthFn») ([«?L»]), numLit "1"])]) (ap (Const.«equal») ([«?A», ap (Const.«AdditionFn») ([ap (Const.«FirstFn») ([«?L»]), ap (Const.«ListSumFn») ([ap (Const.«SubListFn») ([numLit "2", ap (Const.«ListLengthFn») ([«?L»]), «?L»])])])])))
axiom ax_577 : Holds (ap (Const.«instance») ([Const.«AverageFn», Const.«UnaryFunction»]))
axiom ax_578 : ∀ («?A» : Obj) («?L» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?A», ap (Const.«AverageFn») ([«?L»])]), ap (Const.«greaterThan») ([ap (Const.«ListLengthFn») ([«?L»]), numLit "0"])]) (ap (Const.«equal») ([«?A», ap (Const.«DivisionFn») ([ap (Const.«ListSumFn») ([«?L»]), ap (Const.«ListLengthFn») ([«?L»])])])))
axiom ax_579 : ∀ («?A» : Obj) («?L» : Obj) («?N» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?A», ap (Const.«AverageFn») ([«?L»])]), ap (Const.«inList») ([«?N», «?L»])]) (ap (Const.«instance») ([«?N», Const.«Number»])))
axiom ax_580 : Holds (ap (Const.«instance») ([Const.«initialList», Const.«BinaryPredicate»]))
axiom ax_581 : Holds (ap (Const.«instance») ([Const.«initialList», Const.«PartialOrderingRelation»]))
axiom ax_582 : Holds (ap (Const.«subrelation») ([Const.«initialList», Const.«subList»]))
axiom ax_583 : Holds (mkForallRow (fun («@ROW» : List Obj) => mkForall (fun («?ITEM» : Obj) => ap (Const.«initialList») ([ap (Const.«ListFn») («@ROW»), ap (Const.«ListFn») («@ROW» ++ [«?ITEM»])]))))
axiom ax_584 : Holds (ap (Const.«instance») ([Const.«identicalListItems», Const.«BinaryPredicate»]))
axiom ax_585 : Holds (ap (Const.«instance») ([Const.«identicalListItems», Const.«EquivalenceRelation»]))
axiom ax_586 : Holds (ap (Const.«subclass») ([Const.«Predicate», Const.«Relation»]))
axiom ax_587 : Holds (ap (Const.«subclass») ([Const.«Predicate», Const.«InheritableRelation»]))
axiom ax_588 : Holds (ap (Const.«subclass») ([Const.«Function», Const.«SingleValuedRelation»]))
axiom ax_589 : Holds (ap (Const.«subclass») ([Const.«Function», Const.«InheritableRelation»]))
axiom ax_590 : Holds (ap (Const.«subclass») ([Const.«UnaryFunction», Const.«Function»]))
axiom ax_591 : Holds (ap (Const.«subclass») ([Const.«UnaryFunction», Const.«BinaryRelation»]))
axiom ax_592 : Holds (ap (Const.«subclass») ([Const.«UnaryFunction», Const.«InheritableRelation»]))
axiom ax_593 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«UnaryFunction»])) (ap (Const.«valence») ([«?FUNCTION», numLit "1"])))
axiom ax_594 : Holds (ap (Const.«subclass») ([Const.«OneToOneFunction», Const.«UnaryFunction»]))
axiom ax_595 : ∀ («?FUN» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUN», Const.«OneToOneFunction»])) (mkForall (fun («?ARG1» : Obj) => mkForall (fun («?ARG2» : Obj) => mkImp (mkExists (fun («?CLASS» : Obj) => mkAnd [ap (Const.«domain») ([«?FUN», numLit "1", «?CLASS»]), ap (Const.«instance») ([«?ARG1», «?CLASS»]), ap (Const.«instance») ([«?ARG2», «?CLASS»]), mkNot (ap (Const.«equal») ([«?ARG1», «?ARG2»]))])) (mkNot (ap (Const.«equal») ([ap (Const.«AssignmentFn») ([«?FUN», «?ARG1»]), ap (Const.«AssignmentFn») ([«?FUN», «?ARG2»])])))))))
axiom ax_596 : Holds (ap (Const.«subclass») ([Const.«SequenceFunction», Const.«OneToOneFunction»]))
axiom ax_597 : ∀ («?CLASS» : Obj) («?SEQ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SEQ», Const.«SequenceFunction»]), ap (Const.«range») ([«?SEQ», «?CLASS»])]) (ap (Const.«subclass») ([«?CLASS», Const.«Integer»])))
axiom ax_598 : Holds (ap (Const.«subclass») ([Const.«BinaryFunction», Const.«Function»]))
axiom ax_599 : Holds (ap (Const.«subclass») ([Const.«BinaryFunction», Const.«TernaryRelation»]))
axiom ax_600 : Holds (ap (Const.«subclass») ([Const.«BinaryFunction», Const.«InheritableRelation»]))
axiom ax_601 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«BinaryFunction»])) (ap (Const.«valence») ([«?FUNCTION», numLit "2"])))
axiom ax_602 : Holds (ap (Const.«subclass») ([Const.«AssociativeFunction», Const.«BinaryFunction»]))
axiom ax_603 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«AssociativeFunction»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkForall (fun («?INST3» : Obj) => mkForall (fun («?CLASS» : Obj) => mkImp (mkAnd [ap (Const.«domain») ([«?FUNCTION», numLit "1", «?CLASS»]), ap (Const.«instance») ([«?INST1», «?CLASS»]), ap (Const.«instance») ([«?INST2», «?CLASS»]), ap (Const.«instance») ([«?INST3», «?CLASS»])]) (ap (Const.«equal») ([ap (Const.«AssignmentFn») ([«?FUNCTION», «?INST1», ap (Const.«AssignmentFn») ([«?FUNCTION», «?INST2», «?INST3»])]), ap (Const.«AssignmentFn») ([«?FUNCTION», ap (Const.«AssignmentFn») ([«?FUNCTION», «?INST1», «?INST2»]), «?INST3»])]))))))))
axiom ax_604 : Holds (ap (Const.«subclass») ([Const.«CommutativeFunction», Const.«BinaryFunction»]))
axiom ax_605 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«CommutativeFunction»])) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkForall (fun («?CLASS» : Obj) => mkImp (mkAnd [ap (Const.«domain») ([«?FUNCTION», numLit "1", «?CLASS»]), ap (Const.«instance») ([«?INST1», «?CLASS»]), ap (Const.«instance») ([«?INST2», «?CLASS»])]) (ap (Const.«equal») ([ap (Const.«AssignmentFn») ([«?FUNCTION», «?INST1», «?INST2»]), ap (Const.«AssignmentFn») ([«?FUNCTION», «?INST2», «?INST1»])])))))))
axiom ax_606 : Holds (ap (Const.«subclass») ([Const.«TernaryFunction», Const.«Function»]))
axiom ax_607 : Holds (ap (Const.«subclass») ([Const.«TernaryFunction», Const.«QuaternaryRelation»]))
axiom ax_608 : Holds (ap (Const.«subclass») ([Const.«TernaryFunction», Const.«InheritableRelation»]))
axiom ax_609 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«TernaryFunction»])) (ap (Const.«valence») ([«?FUNCTION», numLit "3"])))
axiom ax_610 : Holds (ap (Const.«subclass») ([Const.«QuaternaryFunction», Const.«Function»]))
axiom ax_611 : Holds (ap (Const.«subclass») ([Const.«QuaternaryFunction», Const.«QuintaryRelation»]))
axiom ax_612 : Holds (ap (Const.«subclass») ([Const.«QuaternaryFunction», Const.«InheritableRelation»]))
axiom ax_613 : ∀ («?FUNCTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUNCTION», Const.«QuaternaryFunction»])) (ap (Const.«valence») ([«?FUNCTION», numLit "4"])))
axiom ax_614 : Holds (ap (Const.«subclass») ([Const.«ContinuousFunction», Const.«Function»]))
axiom ax_615 : Holds (ap (Const.«subclass») ([Const.«BinaryPredicate», Const.«Predicate»]))
axiom ax_616 : Holds (ap (Const.«subclass») ([Const.«BinaryPredicate», Const.«BinaryRelation»]))
axiom ax_617 : Holds (ap (Const.«subclass») ([Const.«BinaryPredicate», Const.«InheritableRelation»]))
axiom ax_618 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«BinaryPredicate»])) (ap (Const.«valence») ([«?REL», numLit "2"])))
axiom ax_619 : Holds (ap (Const.«subclass») ([Const.«TernaryPredicate», Const.«Predicate»]))
axiom ax_620 : Holds (ap (Const.«subclass») ([Const.«TernaryPredicate», Const.«TernaryRelation»]))
axiom ax_621 : Holds (ap (Const.«subclass») ([Const.«TernaryPredicate», Const.«InheritableRelation»]))
axiom ax_622 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«TernaryPredicate»])) (ap (Const.«valence») ([«?REL», numLit "3"])))
axiom ax_623 : Holds (ap (Const.«subclass») ([Const.«QuaternaryPredicate», Const.«Predicate»]))
axiom ax_624 : Holds (ap (Const.«subclass») ([Const.«QuaternaryPredicate», Const.«QuaternaryRelation»]))
axiom ax_625 : Holds (ap (Const.«subclass») ([Const.«QuaternaryPredicate», Const.«InheritableRelation»]))
axiom ax_626 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«QuaternaryPredicate»])) (ap (Const.«valence») ([«?REL», numLit "4"])))
axiom ax_627 : Holds (ap (Const.«subclass») ([Const.«QuintaryPredicate», Const.«Predicate»]))
axiom ax_628 : Holds (ap (Const.«subclass») ([Const.«QuintaryPredicate», Const.«QuintaryRelation»]))
axiom ax_629 : Holds (ap (Const.«subclass») ([Const.«QuintaryPredicate», Const.«InheritableRelation»]))
axiom ax_630 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«QuintaryPredicate»])) (ap (Const.«valence») ([«?REL», numLit "5"])))
axiom ax_631 : Holds (ap (Const.«subclass») ([Const.«VariableArityRelation», Const.«Relation»]))
axiom ax_632 : ∀ («?REL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REL», Const.«VariableArityRelation»])) (mkNot (mkExists (fun («?INT» : Obj) => ap (Const.«valence») ([«?REL», «?INT»])))))
axiom ax_633 : Holds (ap (Const.«subclass») ([Const.«RelationExtendedToQuantities», Const.«Relation»]))
axiom ax_634 : Holds (ap (Const.«subclass») ([Const.«RelationExtendedToQuantities», Const.«InheritableRelation»]))
axiom ax_635 : Holds (ap (Const.«subclass») ([Const.«LogicalOperator», Const.«Predicate»]))
axiom ax_636 : Holds (ap (Const.«subclass») ([Const.«Proposition», Const.«Abstract»]))
axiom ax_637 : Holds (ap (Const.«instance») ([Const.«closedOn», Const.«BinaryPredicate»]))
axiom ax_638 : Holds (ap (Const.«instance») ([Const.«closedOn», Const.«AsymmetricRelation»]))
axiom ax_639 : Holds (ap (Const.«instance») ([Const.«reflexiveOn», Const.«BinaryPredicate»]))
axiom ax_640 : Holds (ap (Const.«instance») ([Const.«reflexiveOn», Const.«AsymmetricRelation»]))
axiom ax_641 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?RELATION», Const.«ReflexiveRelation»]), ap (Const.«reflexiveOn») ([«?RELATION», «?CLASS»]), ap (Const.«instance») ([«?RELATION», Const.«Predicate»])]) (mkForall (fun («?INST» : Obj) => mkImp (ap (Const.«instance») ([«?INST», «?CLASS»])) (ap («?RELATION») ([«?INST», «?INST»])))))
axiom ax_642 : Holds (ap (Const.«instance») ([Const.«partialOrderingOn», Const.«BinaryPredicate»]))
axiom ax_643 : Holds (ap (Const.«instance») ([Const.«partialOrderingOn», Const.«AsymmetricRelation»]))
axiom ax_644 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (ap (Const.«partialOrderingOn») ([«?RELATION», «?CLASS»])) (mkAnd [ap (Const.«reflexiveOn») ([«?RELATION», «?CLASS»]), ap (Const.«instance») ([«?RELATION», Const.«TransitiveRelation»]), ap (Const.«instance») ([«?RELATION», Const.«AntisymmetricRelation»])]))
axiom ax_645 : Holds (ap (Const.«instance») ([Const.«totalOrderingOn», Const.«BinaryPredicate»]))
axiom ax_646 : Holds (ap (Const.«instance») ([Const.«totalOrderingOn», Const.«AsymmetricRelation»]))
axiom ax_647 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (ap (Const.«totalOrderingOn») ([«?RELATION», «?CLASS»])) (mkAnd [ap (Const.«partialOrderingOn») ([«?RELATION», «?CLASS»]), ap (Const.«trichotomizingOn») ([«?RELATION», «?CLASS»])]))
axiom ax_648 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (mkAnd [ap (Const.«partialOrderingOn») ([«?RELATION», «?CLASS»]), ap (Const.«trichotomizingOn») ([«?RELATION», «?CLASS»])]) (ap (Const.«totalOrderingOn») ([«?RELATION», «?CLASS»])))
axiom ax_649 : Holds (ap (Const.«instance») ([Const.«trichotomizingOn», Const.«BinaryPredicate»]))
axiom ax_650 : Holds (ap (Const.«instance») ([Const.«trichotomizingOn», Const.«AsymmetricRelation»]))
axiom ax_651 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (mkAnd [ap (Const.«trichotomizingOn») ([«?RELATION», «?CLASS»]), ap (Const.«instance») ([«?RELATION», Const.«RelationExtendedToQuantities»])]) (mkForall (fun («?INST1» : Obj) => mkForall (fun («?INST2» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?INST1», «?CLASS»]), ap (Const.«instance») ([«?INST2», «?CLASS»])]) (mkOr [ap («?RELATION») ([«?INST1», «?INST2»]), ap («?RELATION») ([«?INST2», «?INST1»]), ap (Const.«equal») ([«?INST1», «?INST2»])])))))
axiom ax_652 : Holds (ap (Const.«instance») ([Const.«equivalenceRelationOn», Const.«BinaryPredicate»]))
axiom ax_653 : Holds (ap (Const.«instance») ([Const.«equivalenceRelationOn», Const.«AsymmetricRelation»]))
axiom ax_654 : ∀ («?CLASS» : Obj) («?RELATION» : Obj), Holds (mkImp (ap (Const.«equivalenceRelationOn») ([«?RELATION», «?CLASS»])) (mkAnd [ap (Const.«instance») ([«?RELATION», Const.«TransitiveRelation»]), ap (Const.«instance») ([«?RELATION», Const.«SymmetricRelation»]), ap (Const.«reflexiveOn») ([«?RELATION», «?CLASS»])]))
axiom ax_655 : Holds (ap (Const.«instance») ([Const.«distributes», Const.«BinaryPredicate»]))
axiom ax_656 : Holds (ap (Const.«instance») ([Const.«subProcess», Const.«BinaryPredicate»]))
axiom ax_657 : Holds (ap (Const.«instance») ([Const.«subProcess», Const.«PartialOrderingRelation»]))
axiom ax_658 : Holds (ap (Const.«instance») ([Const.«relatedEvent», Const.«BinaryPredicate»]))
axiom ax_659 : Holds (ap (Const.«instance») ([Const.«relatedEvent», Const.«SymmetricRelation»]))
axiom ax_660 : ∀ («?P» : Obj) («?S1» : Obj) («?S2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subProcess») ([«?S1», «?P»]), ap (Const.«subProcess») ([«?S2», «?P»])]) (ap (Const.«relatedEvent») ([«?S1», «?S2»])))
axiom ax_661 : Holds (ap (Const.«instance») ([Const.«causes», Const.«BinaryPredicate»]))
axiom ax_662 : Holds (ap (Const.«instance») ([Const.«causes», Const.«AsymmetricRelation»]))
axiom ax_663 : Holds (ap (Const.«relatedInternalConcept») ([Const.«causes», Const.«causesSubclass»]))
axiom ax_664 : ∀ («?P1» : Obj) («?P2» : Obj), Holds (mkImp (ap (Const.«causes») ([«?P1», «?P2»])) (ap (Const.«relatedEvent») ([«?P1», «?P2»])))
axiom ax_665 : ∀ («?PROC1» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC1», Const.«Process»])) (mkExists (fun («?PROC2» : Obj) => ap (Const.«causes») ([«?PROC2», «?PROC1»]))))
axiom ax_666 : ∀ («?P1» : Obj) («?P2» : Obj), Holds (mkImp (ap (Const.«causes») ([«?P1», «?P2»])) (ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?P1»]), ap (Const.«WhenFn») ([«?P2»])])))
axiom ax_667 : Holds (ap (Const.«instance») ([Const.«causesSubclass», Const.«BinaryPredicate»]))
axiom ax_668 : Holds (ap (Const.«instance») ([Const.«causesSubclass», Const.«AsymmetricRelation»]))
axiom ax_669 : ∀ («?PROC1» : Obj) («?PROC2» : Obj), Holds (mkImp (ap (Const.«causesSubclass») ([«?PROC1», «?PROC2»])) (mkExists (fun («?INST1» : Obj) => mkExists (fun («?INST2» : Obj) => mkAnd [ap (Const.«instance») ([«?INST2», «?PROC2»]), ap (Const.«instance») ([«?INST1», «?PROC1»]), ap (Const.«causes») ([«?INST1», «?INST2»])]))))
axiom ax_670 : Holds (ap (Const.«instance») ([Const.«causesProposition», Const.«BinaryPredicate»]))
axiom ax_671 : Holds (ap (Const.«instance») ([Const.«causesProposition», Const.«AsymmetricRelation»]))
axiom ax_672 : ∀ («?SIT1» : Obj) («?SIT2» : Obj) («?T1» : Obj) («?T2» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?T2», «?SIT2»]), ap (Const.«holdsDuring») ([«?T1», «?SIT1»]), ap (Const.«instance») ([«?T1», Const.«TimeInterval»]), ap (Const.«instance») ([«?T2», Const.«TimeInterval»]), ap (Const.«causesProposition») ([«?SIT1», «?SIT2»])]) (ap (Const.«beforeOrEqual») ([ap (Const.«BeginFn») ([«?T1»]), ap (Const.«BeginFn») ([«?T2»])])))
axiom ax_673 : Holds (ap (Const.«instance») ([Const.«copy», Const.«BinaryPredicate»]))
axiom ax_674 : Holds (ap (Const.«instance») ([Const.«copy», Const.«EquivalenceRelation»]))
axiom ax_675 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«copy») ([«?OBJ1», «?OBJ2»])) (mkForall (fun («?ATTR» : Obj) => mkImp (ap (Const.«attribute») ([«?OBJ1», «?ATTR»])) (ap (Const.«attribute») ([«?OBJ2», «?ATTR»])))))
axiom ax_676 : Holds (ap (Const.«instance») ([Const.«time», Const.«BinaryPredicate»]))
axiom ax_677 : Holds (ap (Const.«instance») ([Const.«time», Const.«TemporalRelation»]))
axiom ax_678 : Holds (ap (Const.«instance») ([Const.«time», Const.«AsymmetricRelation»]))
axiom ax_679 : Holds (ap (Const.«instance») ([Const.«time», Const.«TotalValuedRelation»]))
axiom ax_680 : Holds (ap (Const.«relatedInternalConcept») ([Const.«time», Const.«located»]))
axiom ax_681 : Holds (ap (Const.«relatedInternalConcept») ([Const.«time», Const.«holdsDuring»]))
axiom ax_682 : Holds (ap (Const.«instance») ([Const.«holdsDuring», Const.«BinaryPredicate»]))
axiom ax_683 : Holds (ap (Const.«instance») ([Const.«holdsDuring», Const.«AsymmetricRelation»]))
axiom ax_684 : ∀ («?SITUATION1» : Obj) («?SITUATION2» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME», «?SITUATION1»]), ap (Const.«entails») ([«?SITUATION1», «?SITUATION2»])]) (ap (Const.«holdsDuring») ([«?TIME», «?SITUATION2»])))
axiom ax_685 : ∀ («?SITUATION» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», mkNot («?SITUATION»)])) (mkNot (ap (Const.«holdsDuring») ([«?TIME», «?SITUATION»]))))
axiom ax_686 : Holds (ap (Const.«instance») ([Const.«capability», Const.«TernaryPredicate»]))
axiom ax_687 : ∀ («?ARG1» : Obj) («?ARG2» : Obj) («?PROC» : Obj) («?ROLE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ROLE», Const.«CaseRole»]), ap («?ROLE») ([«?ARG1», «?ARG2»]), ap (Const.«instance») ([«?ARG1», «?PROC»]), ap (Const.«subclass») ([«?PROC», Const.«Process»])]) (ap (Const.«capability») ([«?PROC», «?ROLE», «?ARG2»])))
axiom ax_688 : ∀ («?OBJ» : Obj) («?PROCESS» : Obj) («?ROLE» : Obj), Holds (mkImp (mkAnd [ap (Const.«capability») ([«?PROCESS», «?ROLE», «?OBJ»]), ap (Const.«instance») ([«?OBJ», Const.«Device»]), mkNot (ap (Const.«attribute») ([«?OBJ», Const.«DeviceDamaged»]))]) (ap (Const.«modalAttribute») ([mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?P», «?PROCESS»]), ap («?ROLE») ([«?P», «?OBJ»])]), Const.«Possibility»])))
axiom ax_689 : Holds (ap (Const.«instance») ([Const.«exploits», Const.«BinaryPredicate»]))
axiom ax_690 : Holds (ap (Const.«instance») ([Const.«exploits», Const.«AsymmetricRelation»]))
axiom ax_691 : ∀ («?AGENT» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«exploits») ([«?OBJ», «?AGENT»])) (mkExists (fun («?PROCESS» : Obj) => mkAnd [ap (Const.«agent») ([«?PROCESS», «?AGENT»]), ap (Const.«resource») ([«?PROCESS», «?OBJ»])])))
axiom ax_692 : Holds (ap (Const.«instance») ([Const.«hasPurpose», Const.«BinaryPredicate»]))
axiom ax_693 : Holds (ap (Const.«instance») ([Const.«hasPurpose», Const.«AsymmetricRelation»]))
axiom ax_694 : Holds (ap (Const.«instance») ([Const.«hasPurposeForAgent», Const.«TernaryPredicate»]))
axiom ax_695 : ∀ («?PURPOSE» : Obj) («?THING» : Obj), Holds (mkImp (ap (Const.«hasPurpose») ([«?THING», «?PURPOSE»])) (mkExists (fun («?AGENT» : Obj) => ap (Const.«hasPurposeForAgent») ([«?THING», «?PURPOSE», «?AGENT»]))))
axiom ax_696 : Holds (ap (Const.«instance») ([Const.«hasSkill», Const.«BinaryPredicate»]))
axiom ax_697 : ∀ («?AGENT» : Obj) («?PROC» : Obj), Holds (mkImp (ap (Const.«hasSkill») ([«?PROC», «?AGENT»])) (ap (Const.«capability») ([«?PROC», Const.«agent», «?AGENT»])))
axiom ax_698 : Holds (ap (Const.«instance») ([Const.«confersNorm», Const.«TernaryPredicate»]))
axiom ax_699 : ∀ («?ENTITY» : Obj) («?FORMULA» : Obj) («?NORM» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«confersNorm») ([«?ENTITY», «?FORMULA», «?NORM»])])) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«ImmediatePastFn») ([«?TIME»]), mkNot (ap (Const.«modalAttribute») ([«?FORMULA», «?NORM»]))]), ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([«?TIME»]), ap (Const.«modalAttribute») ([«?FORMULA», «?NORM»])])]))
axiom ax_700 : Holds (ap (Const.«instance») ([Const.«deprivesNorm», Const.«TernaryPredicate»]))
axiom ax_701 : Holds (ap (Const.«disjointRelation») ([Const.«deprivesNorm», Const.«confersNorm»]))
axiom ax_702 : ∀ («?ENTITY» : Obj) («?FORMULA» : Obj) («?NORM» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«deprivesNorm») ([«?ENTITY», «?FORMULA», «?NORM»])])) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«ImmediatePastFn») ([«?TIME»]), ap (Const.«modalAttribute») ([«?FORMULA», «?NORM»])]), ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([«?TIME»]), mkNot (ap (Const.«modalAttribute») ([«?FORMULA», «?NORM»]))])]))
axiom ax_703 : Holds (ap (Const.«subrelation») ([Const.«overlapsSpatially», Const.«connected»]))
axiom ax_704 : Holds (ap (Const.«instance») ([Const.«overlapsSpatially», Const.«ReflexiveRelation»]))
axiom ax_705 : Holds (ap (Const.«instance») ([Const.«overlapsSpatially», Const.«SymmetricRelation»]))
axiom ax_706 : Holds (ap (Const.«instance») ([Const.«partlyLocated», Const.«SpatialRelation»]))
axiom ax_707 : Holds (ap (Const.«instance») ([Const.«partlyLocated», Const.«BinaryPredicate»]))
axiom ax_708 : Holds (ap (Const.«instance») ([Const.«partlyLocated», Const.«TotalValuedRelation»]))
axiom ax_709 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?OBJ1», Const.«Object»]), ap (Const.«partlyLocated») ([«?OBJ1», «?OBJ2»])]) (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])))
axiom ax_710 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?OBJ1», Const.«Object»]), ap (Const.«partlyLocated») ([«?OBJ1», «?OBJ2»])]) (mkExists (fun («?SUB» : Obj) => mkAnd [ap (Const.«part») ([«?SUB», «?OBJ1»]), ap (Const.«located») ([«?SUB», «?OBJ2»])])))
axiom ax_711 : Holds (ap (Const.«instance») ([Const.«located», Const.«AntisymmetricRelation»]))
axiom ax_712 : Holds (ap (Const.«instance») ([Const.«located», Const.«TransitiveRelation»]))
axiom ax_713 : Holds (ap (Const.«instance») ([Const.«located», Const.«TotalValuedRelation»]))
axiom ax_714 : Holds (ap (Const.«subrelation») ([Const.«located», Const.«partlyLocated»]))
axiom ax_715 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«located») ([«?OBJ1», «?OBJ2»])) (mkForall (fun («?SUB» : Obj) => mkImp (ap (Const.«part») ([«?SUB», «?OBJ1»])) (ap (Const.«located») ([«?SUB», «?OBJ2»])))))
axiom ax_716 : Holds (ap (Const.«instance») ([Const.«eventPartlyLocated», Const.«CaseRole»]))
axiom ax_717 : Holds (ap (Const.«instance») ([Const.«eventPartlyLocated», Const.«PartialValuedRelation»]))
axiom ax_718 : ∀ («?OJB» : Obj) («?PROC» : Obj), Holds (mkImp (ap (Const.«eventPartlyLocated») ([«?PROC», «?OJB»])) (ap (Const.«partlyLocated») ([«?PROC», «?OJB»])))
axiom ax_719 : ∀ («?OBJ» : Obj) («?PROC» : Obj), Holds (mkImp (ap (Const.«eventPartlyLocated») ([«?PROC», «?OBJ»])) (mkExists (fun («?SUB» : Obj) => mkAnd [ap (Const.«subProcess») ([«?SUB», «?PROC»]), ap (Const.«eventLocated») ([«?SUB», «?OBJ»])])))
axiom ax_720 : ∀ («?LOC» : Obj) («?PROCESS» : Obj), Holds (mkImp (ap (Const.«origin») ([«?PROCESS», «?LOC»])) (ap (Const.«eventPartlyLocated») ([«?PROCESS», «?LOC»])))
axiom ax_721 : ∀ («?LOC» : Obj) («?PROCESS» : Obj), Holds (mkImp (ap (Const.«destination») ([«?PROCESS», «?LOC»])) (ap (Const.«eventPartlyLocated») ([«?PROCESS», «?LOC»])))
axiom ax_722 : Holds (ap (Const.«subrelation») ([Const.«eventPartlyLocated», Const.«involvedInEvent»]))
axiom ax_723 : Holds (ap (Const.«subrelation») ([Const.«eventLocated», Const.«eventPartlyLocated»]))
axiom ax_724 : Holds (ap (Const.«instance») ([Const.«eventLocated», Const.«CaseRole»]))
axiom ax_725 : Holds (ap (Const.«instance») ([Const.«eventLocated», Const.«TotalValuedRelation»]))
axiom ax_726 : ∀ («?OBJ» : Obj) («?PROCESS» : Obj), Holds (mkImp (ap (Const.«eventLocated») ([«?PROCESS», «?OBJ»])) (mkForall (fun («?SUB» : Obj) => mkImp (ap (Const.«subProcess») ([«?SUB», «?PROCESS»])) (ap (Const.«eventLocated») ([«?SUB», «?OBJ»])))))
axiom ax_727 : Holds (ap (Const.«subrelation») ([Const.«exactlyLocated», Const.«located»]))
axiom ax_728 : Holds (ap (Const.«instance») ([Const.«exactlyLocated», Const.«BinaryPredicate»]))
axiom ax_729 : ∀ («?OBJ» : Obj) («?REGION» : Obj), Holds (mkImp (ap (Const.«exactlyLocated») ([«?OBJ», «?REGION»])) (mkNot (mkExists (fun («?OTHEROBJ» : Obj) => mkAnd [ap (Const.«exactlyLocated») ([«?OTHEROBJ», «?REGION»]), mkNot (ap (Const.«equal») ([«?OTHEROBJ», «?OBJ»]))]))))
axiom ax_730 : Holds (ap (Const.«instance») ([Const.«between», Const.«SpatialRelation»]))
axiom ax_731 : Holds (ap (Const.«instance») ([Const.«between», Const.«TernaryPredicate»]))
axiom ax_732 : ∀ («?END1» : Obj) («?END2» : Obj) («?MID» : Obj), Holds (mkImp (ap (Const.«between») ([«?END1», «?MID», «?END2»])) (ap (Const.«between») ([«?END2», «?MID», «?END1»])))
axiom ax_733 : Holds (ap (Const.«instance») ([Const.«betweenOnPath», Const.«SpatialRelation»]))
axiom ax_734 : Holds (ap (Const.«instance») ([Const.«betweenOnPath», Const.«QuaternaryPredicate»]))
axiom ax_735 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj) («?PATH» : Obj), Holds (mkImp (ap (Const.«betweenOnPath») ([«?OBJ1», «?OBJ2», «?OBJ3», «?PATH»])) (ap (Const.«between») ([«?OBJ1», «?OBJ2», «?OBJ3»])))
axiom ax_736 : Holds (ap (Const.«instance») ([Const.«traverses», Const.«BinaryPredicate»]))
axiom ax_737 : Holds (ap (Const.«instance») ([Const.«traverses», Const.«SpatialRelation»]))
axiom ax_738 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«traverses») ([«?OBJ1», «?OBJ2»])) (mkOr [ap (Const.«crosses») ([«?OBJ1», «?OBJ2»]), ap (Const.«penetrates») ([«?OBJ1», «?OBJ2»])]))
axiom ax_739 : Holds (ap (Const.«subrelation») ([Const.«crosses», Const.«traverses»]))
axiom ax_740 : Holds (ap (Const.«instance») ([Const.«crosses», Const.«AsymmetricRelation»]))
axiom ax_741 : Holds (ap (Const.«instance») ([Const.«crosses», Const.«TransitiveRelation»]))
axiom ax_742 : Holds (ap (Const.«disjointRelation») ([Const.«crosses», Const.«connected»]))
axiom ax_743 : Holds (ap (Const.«subrelation») ([Const.«penetrates», Const.«traverses»]))
axiom ax_744 : Holds (ap (Const.«instance») ([Const.«penetrates», Const.«AsymmetricRelation»]))
axiom ax_745 : Holds (ap (Const.«instance») ([Const.«penetrates», Const.«IntransitiveRelation»]))
axiom ax_746 : Holds (ap (Const.«instance») ([Const.«penetrates», Const.«PartialValuedRelation»]))
axiom ax_747 : ∀ («?X» : Obj) («?Y» : Obj), Holds (mkImp (ap (Const.«penetrates») ([«?X», «?Y»])) (ap (Const.«meetsSpatially») ([«?X», «?Y»])))
axiom ax_748 : Holds (ap (Const.«instance») ([Const.«WhereFn», Const.«BinaryFunction»]))
axiom ax_749 : Holds (ap (Const.«instance») ([Const.«WhereFn», Const.«SpatialRelation»]))
axiom ax_750 : Holds (ap (Const.«instance») ([Const.«WhereFn», Const.«TotalValuedRelation»]))
axiom ax_751 : Holds (ap (Const.«relatedInternalConcept») ([Const.«WhereFn», Const.«WhenFn»]))
axiom ax_752 : ∀ («?REGION» : Obj) («?THING» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«WhereFn») ([«?THING», «?TIME»]), «?REGION»])) (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«exactlyLocated») ([«?THING», «?REGION»])])))
axiom ax_753 : ∀ («?REGION» : Obj) («?THING» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«exactlyLocated») ([«?THING», «?REGION»])])) (ap (Const.«equal») ([ap (Const.«WhereFn») ([«?THING», «?TIME»]), «?REGION»])))
axiom ax_754 : Holds (ap (Const.«instance») ([Const.«possesses», Const.«BinaryPredicate»]))
axiom ax_755 : Holds (ap (Const.«instance») ([Const.«possesses», Const.«AsymmetricRelation»]))
axiom ax_756 : ∀ («?OBJ» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«possesses») ([«?PERSON», «?OBJ»])) (ap (Const.«modalAttribute») ([ap (Const.«uses») ([«?OBJ», «?PERSON»]), Const.«Permission»])))
axiom ax_757 : ∀ («?OBJ» : Obj) («?P» : Obj) («?PERSON» : Obj) («?T» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?T», ap (Const.«possesses») ([«?PERSON», «?OBJ»])]), ap (Const.«part») ([«?P», «?OBJ»])]) (ap (Const.«holdsDuring») ([«?T», ap (Const.«possesses») ([«?PERSON», «?P»])])))
axiom ax_758 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?OBJ» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TIME», Const.«TimePosition»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«possesses») ([«?AGENT1», «?OBJ»])]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«possesses») ([«?AGENT2», «?OBJ»])])]) (ap (Const.«equal») ([«?AGENT1», «?AGENT2»])))
axiom ax_759 : Holds (ap (Const.«instance») ([Const.«PropertyFn», Const.«UnaryFunction»]))
axiom ax_760 : Holds (ap (Const.«instance») ([Const.«PropertyFn», Const.«TotalValuedRelation»]))
axiom ax_761 : ∀ («?OBJ» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«element») ([«?OBJ», ap (Const.«PropertyFn») ([«?PERSON»])])) (ap (Const.«possesses») ([«?PERSON», «?OBJ»])))
axiom ax_762 : ∀ («?OBJ» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«possesses») ([«?PERSON», «?OBJ»])) (ap (Const.«element») ([«?OBJ», ap (Const.«PropertyFn») ([«?PERSON»])])))
axiom ax_763 : Holds (ap (Const.«instance») ([Const.«precondition», Const.«BinaryPredicate»]))
axiom ax_764 : Holds (ap (Const.«instance») ([Const.«precondition», Const.«AsymmetricRelation»]))
axiom ax_765 : Holds (ap (Const.«instance») ([Const.«precondition», Const.«TransitiveRelation»]))
axiom ax_766 : ∀ («?PROC1» : Obj) («?PROC2» : Obj), Holds (mkImp (ap (Const.«precondition») ([«?PROC1», «?PROC2»])) (mkImp (mkExists (fun («?INST2» : Obj) => ap (Const.«instance») ([«?INST2», «?PROC2»]))) (mkExists (fun («?INST1» : Obj) => ap (Const.«instance») ([«?INST1», «?PROC1»])))))
axiom ax_767 : Holds (ap (Const.«instance») ([Const.«hindersSubclass», Const.«BinaryPredicate»]))
axiom ax_768 : Holds (ap (Const.«instance») ([Const.«hindersSubclass», Const.«IrreflexiveRelation»]))
axiom ax_769 : Holds (ap (Const.«instance») ([Const.«hindersSubclass», Const.«PartialValuedRelation»]))
axiom ax_770 : ∀ («?PROC1» : Obj) («?PROC2» : Obj), Holds (mkImp (ap (Const.«hindersSubclass») ([«?PROC1», «?PROC2»])) (mkForall (fun («?TIME» : Obj) => mkForall (fun («?PLACE» : Obj) => ap (Const.«decreasesLikelihood») ([ap (Const.«holdsDuring») ([«?TIME», mkExists (fun («?INST1» : Obj) => mkAnd [ap (Const.«instance») ([«?INST1», «?PROC1»]), ap (Const.«eventLocated») ([«?INST1», «?PLACE»])])]), ap (Const.«holdsDuring») ([«?TIME», mkExists (fun («?INST2» : Obj) => mkAnd [ap (Const.«instance») ([«?INST2», «?PROC2»]), ap (Const.«eventLocated») ([«?INST2», «?PLACE»])])])])))))
axiom ax_771 : Holds (ap (Const.«instance») ([Const.«preventsSubclass», Const.«BinaryPredicate»]))
axiom ax_772 : Holds (ap (Const.«instance») ([Const.«preventsSubclass», Const.«IrreflexiveRelation»]))
axiom ax_773 : Holds (ap (Const.«instance») ([Const.«preventsSubclass», Const.«PartialValuedRelation»]))
axiom ax_774 : Holds (ap (Const.«relatedInternalConcept») ([Const.«preventsSubclass», Const.«hindersSubclass»]))
axiom ax_775 : ∀ («?PROC1» : Obj) («?PROC2» : Obj), Holds (mkImp (ap (Const.«preventsSubclass») ([«?PROC1», «?PROC2»])) (mkForall (fun («?TIME» : Obj) => mkForall (fun («?PLACE» : Obj) => mkImp (ap (Const.«holdsDuring») ([«?TIME», mkExists (fun («?INST1» : Obj) => mkAnd [ap (Const.«instance») ([«?INST1», «?PROC1»]), ap (Const.«eventLocated») ([«?INST1», «?PLACE»])])])) (mkNot (ap (Const.«holdsDuring») ([«?TIME», mkExists (fun («?INST2» : Obj) => mkAnd [ap (Const.«instance») ([«?INST2», «?PROC2»]), ap (Const.«eventLocated») ([«?INST2», «?PLACE»])])])))))))
axiom ax_776 : Holds (ap (Const.«instance») ([Const.«prevents», Const.«BinaryPredicate»]))
axiom ax_777 : Holds (ap (Const.«instance») ([Const.«prevents», Const.«PartialValuedRelation»]))
axiom ax_778 : Holds (ap (Const.«relatedInternalConcept») ([Const.«prevents», Const.«preventsSubclass»]))
axiom ax_779 : Holds (ap (Const.«relatedInternalConcept») ([Const.«prevents», Const.«hinders»]))
axiom ax_780 : ∀ («?L» : Obj) («?P» : Obj) («?T» : Obj) («?X» : Obj), Holds (mkImp (mkAnd [ap (Const.«prevents») ([«?X», «?P»]), ap (Const.«equal») ([ap (Const.«WhenFn») ([«?X»]), «?T»]), ap (Const.«eventLocated») ([«?X», «?L»])]) (mkNot (ap (Const.«holdsDuring») ([«?T», mkExists (fun («?Y» : Obj) => mkAnd [ap (Const.«instance») ([«?Y», «?P»]), ap (Const.«eventLocated») ([«?Y», «?L»])])]))))
axiom ax_781 : Holds (ap (Const.«instance») ([Const.«hinders», Const.«BinaryPredicate»]))
axiom ax_782 : Holds (ap (Const.«instance») ([Const.«hinders», Const.«PartialValuedRelation»]))
axiom ax_783 : Holds (ap (Const.«relatedInternalConcept») ([Const.«hinders», Const.«hindersSubclass»]))
axiom ax_784 : ∀ («?PROC» : Obj) («?X» : Obj), Holds (mkImp (ap (Const.«hinders») ([«?X», «?PROC»])) (mkExists (fun («?L» : Obj) => mkExists (fun («?T» : Obj) => ap (Const.«decreasesLikelihood») ([mkAnd [ap (Const.«equal») ([ap (Const.«WhenFn») ([«?X»]), «?T»]), ap (Const.«eventLocated») ([«?X», «?L»])], ap (Const.«holdsDuring») ([«?T», mkExists (fun («?Y» : Obj) => mkAnd [ap (Const.«instance») ([«?Y», «?PROC»]), ap (Const.«eventLocated») ([«?Y», «?L»])])])])))))
axiom ax_785 : Holds (ap (Const.«instance») ([Const.«refers», Const.«BinaryPredicate»]))
axiom ax_786 : Holds (ap (Const.«subrelation») ([Const.«names», Const.«refers»]))
axiom ax_787 : Holds (ap (Const.«instance») ([Const.«names», Const.«BinaryPredicate»]))
axiom ax_788 : Holds (ap (Const.«subrelation») ([Const.«uniqueIdentifier», Const.«names»]))
axiom ax_789 : Holds (ap (Const.«instance») ([Const.«uniqueIdentifier», Const.«BinaryPredicate»]))
axiom ax_790 : Holds (ap (Const.«instance») ([Const.«uniqueIdentifier», Const.«SingleValuedRelation»]))
axiom ax_791 : Holds (ap (Const.«instance») ([Const.«uniqueIdentifier», Const.«PartialValuedRelation»]))
axiom ax_792 : Holds (ap (Const.«subrelation») ([Const.«represents», Const.«refers»]))
axiom ax_793 : Holds (ap (Const.«instance») ([Const.«represents», Const.«BinaryPredicate»]))
axiom ax_794 : Holds (ap (Const.«instance») ([Const.«representsForAgent», Const.«TernaryPredicate»]))
axiom ax_795 : ∀ («?AGENT» : Obj) («?ENTITY» : Obj) («?REP» : Obj), Holds (mkImp (ap (Const.«representsForAgent») ([«?REP», «?ENTITY», «?AGENT»])) (ap (Const.«represents») ([«?REP», «?ENTITY»])))
axiom ax_796 : Holds (ap (Const.«instance») ([Const.«representsInLanguage», Const.«TernaryPredicate»]))
axiom ax_797 : ∀ («?ENTITY» : Obj) («?LANGUAGE» : Obj) («?REP» : Obj), Holds (mkImp (ap (Const.«representsInLanguage») ([«?REP», «?ENTITY», «?LANGUAGE»])) (mkExists (fun («?AGENT» : Obj) => ap (Const.«representsForAgent») ([«?REP», «?ENTITY», «?AGENT»]))))
axiom ax_798 : Holds (ap (Const.«instance») ([Const.«equivalentContentClass», Const.«EquivalenceRelation»]))
axiom ax_799 : Holds (ap (Const.«instance») ([Const.«equivalentContentClass», Const.«BinaryPredicate»]))
axiom ax_800 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subsumesContentClass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subsumesContentClass») ([«?CLASS2», «?CLASS1»])]) (ap (Const.«equivalentContentClass») ([«?CLASS1», «?CLASS2»])))
axiom ax_801 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (ap (Const.«equivalentContentClass») ([«?CLASS1», «?CLASS2»])) (mkAnd [ap (Const.«subsumesContentClass») ([«?CLASS1», «?CLASS2»]), ap (Const.«subsumesContentClass») ([«?CLASS2», «?CLASS1»])]))
axiom ax_802 : Holds (ap (Const.«instance») ([Const.«subsumesContentClass», Const.«BinaryPredicate»]))
axiom ax_803 : Holds (ap (Const.«instance») ([Const.«subsumesContentClass», Const.«PartialOrderingRelation»]))
axiom ax_804 : ∀ («?CLASS1» : Obj) («?CLASS2» : Obj), Holds (mkImp (ap (Const.«subsumesContentClass») ([«?CLASS1», «?CLASS2»])) (mkForall (fun («?OBJ2» : Obj) => mkForall (fun («?INFO» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?OBJ2», «?CLASS2»]), ap (Const.«containsInformation») ([«?OBJ2», «?INFO»])]) (mkExists (fun («?OBJ1» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ1», «?CLASS1»]), ap (Const.«containsInformation») ([«?OBJ1», «?INFO»])]))))))
axiom ax_805 : Holds (ap (Const.«instance») ([Const.«equivalentContentInstance», Const.«EquivalenceRelation»]))
axiom ax_806 : Holds (ap (Const.«instance») ([Const.«equivalentContentInstance», Const.«BinaryPredicate»]))
axiom ax_807 : Holds (ap (Const.«relatedInternalConcept») ([Const.«equivalentContentInstance», Const.«equivalentContentClass»]))
axiom ax_808 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subsumesContentInstance») ([«?OBJ1», «?OBJ2»]), ap (Const.«subsumesContentInstance») ([«?OBJ2», «?OBJ1»])]) (ap (Const.«equivalentContentInstance») ([«?OBJ1», «?OBJ2»])))
axiom ax_809 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«equivalentContentInstance») ([«?OBJ1», «?OBJ2»])) (mkAnd [ap (Const.«subsumesContentInstance») ([«?OBJ1», «?OBJ2»]), ap (Const.«subsumesContentInstance») ([«?OBJ2», «?OBJ1»])]))
axiom ax_810 : Holds (ap (Const.«instance») ([Const.«subsumesContentInstance», Const.«BinaryPredicate»]))
axiom ax_811 : Holds (ap (Const.«instance») ([Const.«subsumesContentInstance», Const.«PartialOrderingRelation»]))
axiom ax_812 : Holds (ap (Const.«relatedInternalConcept») ([Const.«subsumesContentInstance», Const.«subsumesContentClass»]))
axiom ax_813 : ∀ («?INFO» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subsumesContentInstance») ([«?OBJ1», «?OBJ2»]), ap (Const.«containsInformation») ([«?OBJ2», «?INFO»])]) (ap (Const.«containsInformation») ([«?OBJ1», «?INFO»])))
axiom ax_814 : Holds (ap (Const.«subrelation») ([Const.«realization», Const.«represents»]))
axiom ax_815 : Holds (ap (Const.«instance») ([Const.«realization», Const.«AsymmetricRelation»]))
axiom ax_816 : Holds (ap (Const.«relatedInternalConcept») ([Const.«realization», Const.«equivalentContentInstance»]))
axiom ax_817 : Holds (ap (Const.«relatedInternalConcept») ([Const.«realization», Const.«containsInformation»]))
axiom ax_818 : ∀ («?PROCESS» : Obj) («?PROP» : Obj), Holds (mkImp (ap (Const.«realization») ([«?PROCESS», «?PROP»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«ContentBearingObject»]), ap (Const.«containsInformation») ([«?OBJ», «?PROP»])])))
axiom ax_819 : Holds (ap (Const.«instance») ([Const.«expressedInLanguage», Const.«BinaryPredicate»]))
axiom ax_820 : Holds (ap (Const.«instance») ([Const.«expressedInLanguage», Const.«AsymmetricRelation»]))
axiom ax_821 : ∀ («?EXPRESS» : Obj) («?LANGUAGE» : Obj), Holds (mkImp (ap (Const.«expressedInLanguage») ([«?EXPRESS», «?LANGUAGE»])) (mkExists (fun («?PROP» : Obj) => ap (Const.«representsInLanguage») ([«?EXPRESS», «?PROP», «?LANGUAGE»]))))
axiom ax_822 : ∀ («?EXPRESS» : Obj) («?LANGUAGE» : Obj) («?PROP» : Obj), Holds (mkImp (ap (Const.«representsInLanguage») ([«?EXPRESS», «?PROP», «?LANGUAGE»])) (ap (Const.«expressedInLanguage») ([«?EXPRESS», «?LANGUAGE»])))
axiom ax_823 : Holds (ap (Const.«instance») ([Const.«subProposition», Const.«BinaryPredicate»]))
axiom ax_824 : Holds (ap (Const.«instance») ([Const.«subProposition», Const.«TransitiveRelation»]))
axiom ax_825 : Holds (ap (Const.«instance») ([Const.«subProposition», Const.«IrreflexiveRelation»]))
axiom ax_826 : Holds (ap (Const.«instance») ([Const.«subProposition», Const.«PartialValuedRelation»]))
axiom ax_827 : ∀ («?PROP1» : Obj) («?PROP2» : Obj), Holds (mkImp (ap (Const.«subProposition») ([«?PROP1», «?PROP2»])) (mkForall (fun («?OBJ1» : Obj) => mkForall (fun («?OBJ2» : Obj) => mkImp (mkAnd [ap (Const.«containsInformation») ([«?OBJ1», «?PROP1»]), ap (Const.«containsInformation») ([«?OBJ2», «?PROP2»])]) (ap (Const.«subsumesContentInstance») ([«?OBJ2», «?OBJ1»]))))))
axiom ax_828 : Holds (ap (Const.«subrelation») ([Const.«subPlan», Const.«subProposition»]))
axiom ax_829 : Holds (ap (Const.«instance») ([Const.«subPlan», Const.«TransitiveRelation»]))
axiom ax_830 : Holds (ap (Const.«instance») ([Const.«subPlan», Const.«IrreflexiveRelation»]))
axiom ax_831 : Holds (ap (Const.«instance») ([Const.«subPlan», Const.«PartialValuedRelation»]))
axiom ax_832 : Holds (ap (Const.«instance») ([Const.«uses», Const.«BinaryPredicate»]))
axiom ax_833 : Holds (ap (Const.«instance») ([Const.«uses», Const.«AsymmetricRelation»]))
axiom ax_834 : ∀ («?AGENT» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«uses») ([«?OBJ», «?AGENT»])) (mkExists (fun («?PROC» : Obj) => mkAnd [ap (Const.«agent») ([«?PROC», «?AGENT»]), ap (Const.«instrument») ([«?PROC», «?OBJ»])])))
axiom ax_835 : Holds (ap (Const.«instance») ([Const.«MultiplicationFn», Const.«BinaryFunction»]))
axiom ax_836 : Holds (ap (Const.«instance») ([Const.«MultiplicationFn», Const.«AssociativeFunction»]))
axiom ax_837 : Holds (ap (Const.«instance») ([Const.«MultiplicationFn», Const.«CommutativeFunction»]))
axiom ax_838 : Holds (ap (Const.«instance») ([Const.«MultiplicationFn», Const.«TotalValuedRelation»]))
axiom ax_839 : Holds (ap (Const.«instance») ([Const.«AdditionFn», Const.«BinaryFunction»]))
axiom ax_840 : Holds (ap (Const.«instance») ([Const.«AdditionFn», Const.«AssociativeFunction»]))
axiom ax_841 : Holds (ap (Const.«instance») ([Const.«AdditionFn», Const.«CommutativeFunction»]))
axiom ax_842 : Holds (ap (Const.«instance») ([Const.«AdditionFn», Const.«TotalValuedRelation»]))
axiom ax_843 : Holds (mkForall (fun («?NUMBER» : Obj) => ap (Const.«equal») ([ap (Const.«SuccessorFn») ([«?NUMBER»]), ap (Const.«AdditionFn») ([«?NUMBER», numLit "1"])])))
axiom ax_844 : Holds (ap (Const.«instance») ([Const.«SubtractionFn», Const.«BinaryFunction»]))
axiom ax_845 : Holds (ap (Const.«instance») ([Const.«SubtractionFn», Const.«TotalValuedRelation»]))
axiom ax_846 : Holds (mkForall (fun («?NUMBER» : Obj) => ap (Const.«equal») ([ap (Const.«PredecessorFn») ([«?NUMBER»]), ap (Const.«SubtractionFn») ([«?NUMBER», numLit "1"])])))
axiom ax_847 : Holds (ap (Const.«instance») ([Const.«DivisionFn», Const.«BinaryFunction»]))
axiom ax_848 : Holds (ap (Const.«instance») ([Const.«DivisionFn», Const.«PartialValuedRelation»]))
axiom ax_849 : Holds (ap (Const.«instance») ([Const.«AbsoluteValueFn», Const.«UnaryFunction»]))
axiom ax_850 : Holds (ap (Const.«instance») ([Const.«AbsoluteValueFn», Const.«TotalValuedRelation»]))
axiom ax_851 : ∀ («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkIff (mkAnd [ap (Const.«equal») ([ap (Const.«AbsoluteValueFn») ([«?NUMBER1»]), «?NUMBER2»]), ap (Const.«instance») ([«?NUMBER1», Const.«RealNumber»]), ap (Const.«instance») ([«?NUMBER2», Const.«RealNumber»])]) (mkOr [mkAnd [ap (Const.«instance») ([«?NUMBER1», Const.«NonnegativeRealNumber»]), ap (Const.«equal») ([«?NUMBER1», «?NUMBER2»])], mkAnd [ap (Const.«instance») ([«?NUMBER1», Const.«NegativeRealNumber»]), ap (Const.«equal») ([«?NUMBER2», ap (Const.«SubtractionFn») ([numLit "0.0", «?NUMBER1»])])]]))
axiom ax_852 : Holds (ap (Const.«instance») ([Const.«CeilingFn», Const.«UnaryFunction»]))
axiom ax_853 : Holds (ap (Const.«instance») ([Const.«CeilingFn», Const.«TotalValuedRelation»]))
axiom ax_854 : Holds (ap (Const.«instance») ([Const.«CosineFn», Const.«UnaryFunction»]))
axiom ax_855 : Holds (ap (Const.«instance») ([Const.«CosineFn», Const.«TotalValuedRelation»]))
axiom ax_856 : Holds (ap (Const.«instance») ([Const.«DenominatorFn», Const.«UnaryFunction»]))
axiom ax_857 : Holds (ap (Const.«instance») ([Const.«DenominatorFn», Const.«TotalValuedRelation»]))
axiom ax_858 : Holds (ap (Const.«instance») ([Const.«ExponentiationFn», Const.«BinaryFunction»]))
axiom ax_859 : Holds (ap (Const.«instance») ([Const.«ExponentiationFn», Const.«TotalValuedRelation»]))
axiom ax_860 : Holds (ap (Const.«instance») ([Const.«FloorFn», Const.«UnaryFunction»]))
axiom ax_861 : Holds (ap (Const.«instance») ([Const.«FloorFn», Const.«TotalValuedRelation»]))
axiom ax_862 : Holds (ap (Const.«instance») ([Const.«GreatestCommonDivisorFn», Const.«Function»]))
axiom ax_863 : Holds (ap (Const.«instance») ([Const.«GreatestCommonDivisorFn», Const.«VariableArityRelation»]))
axiom ax_864 : Holds (ap (Const.«instance») ([Const.«GreatestCommonDivisorFn», Const.«PartialValuedRelation»]))
axiom ax_865 : ∀ («?ELEMENT» : Obj) («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«GreatestCommonDivisorFn») («@ROW»), «?NUMBER»])) (mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«instance») ([«?ELEMENT», Const.«Number»]))))
axiom ax_866 : ∀ («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«GreatestCommonDivisorFn») («@ROW»), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (mkForall (fun («?ELEMENT» : Obj) => mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?ELEMENT», «?NUMBER»]), numLit "0"])))))
axiom ax_867 : ∀ («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«GreatestCommonDivisorFn») («@ROW»), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (mkNot (mkExists (fun («?GREATER» : Obj) => mkAnd [ap (Const.«greaterThan») ([«?GREATER», «?NUMBER»]), mkForall (fun («?ELEMENT» : Obj) => mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?ELEMENT», «?GREATER»]), numLit "0"])))]))))
axiom ax_868 : Holds (ap (Const.«instance») ([Const.«multiplicativeFactor», Const.«BinaryPredicate»]))
axiom ax_869 : Holds (ap (Const.«instance») ([Const.«multiplicativeFactor», Const.«TransitiveRelation»]))
axiom ax_870 : ∀ («?N1» : Obj) («?N2» : Obj), Holds (mkImp (ap (Const.«multiplicativeFactor») ([«?N1», «?N2»])) (mkExists (fun («?I» : Obj) => mkAnd [ap (Const.«instance») ([«?I», Const.«Integer»]), ap (Const.«equal») ([«?N2», ap (Const.«MultiplicationFn») ([«?N1», «?I»])])])))
axiom ax_871 : Holds (ap (Const.«instance») ([Const.«ImaginaryPartFn», Const.«UnaryFunction»]))
axiom ax_872 : Holds (ap (Const.«instance») ([Const.«ImaginaryPartFn», Const.«TotalValuedRelation»]))
axiom ax_873 : Holds (ap (Const.«instance») ([Const.«IntegerSquareRootFn», Const.«UnaryFunction»]))
axiom ax_874 : Holds (ap (Const.«instance») ([Const.«IntegerSquareRootFn», Const.«PartialValuedRelation»]))
axiom ax_875 : Holds (ap (Const.«instance») ([Const.«LeastCommonMultipleFn», Const.«Function»]))
axiom ax_876 : Holds (ap (Const.«instance») ([Const.«LeastCommonMultipleFn», Const.«PartialValuedRelation»]))
axiom ax_877 : Holds (ap (Const.«instance») ([Const.«LeastCommonMultipleFn», Const.«VariableArityRelation»]))
axiom ax_878 : ∀ («?ELEMENT» : Obj) («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«LeastCommonMultipleFn») («@ROW»), «?NUMBER»])) (mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«instance») ([«?ELEMENT», Const.«Number»]))))
axiom ax_879 : ∀ («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«LeastCommonMultipleFn») («@ROW»), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (mkForall (fun («?ELEMENT» : Obj) => mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», «?ELEMENT»]), numLit "0"])))))
axiom ax_880 : ∀ («?NUMBER» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«LeastCommonMultipleFn») («@ROW»), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (mkNot (mkExists (fun («?LESS» : Obj) => mkAnd [ap (Const.«lessThan») ([«?LESS», «?NUMBER»]), mkForall (fun («?ELEMENT» : Obj) => mkImp (ap (Const.«inList») ([«?ELEMENT», ap (Const.«ListFn») («@ROW»)])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?LESS», «?ELEMENT»]), numLit "0"])))]))))
axiom ax_881 : Holds (ap (Const.«instance») ([Const.«LogFn», Const.«BinaryFunction»]))
axiom ax_882 : Holds (ap (Const.«instance») ([Const.«MaxFn», Const.«BinaryFunction»]))
axiom ax_883 : Holds (ap (Const.«instance») ([Const.«MaxFn», Const.«AssociativeFunction»]))
axiom ax_884 : Holds (ap (Const.«instance») ([Const.«MaxFn», Const.«CommutativeFunction»]))
axiom ax_885 : Holds (ap (Const.«instance») ([Const.«MaxFn», Const.«TotalValuedRelation»]))
axiom ax_886 : ∀ («?NUMBER» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MaxFn») ([«?NUMBER1», «?NUMBER2»]), «?NUMBER»])) (mkOr [mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER1»]), ap (Const.«greaterThan») ([«?NUMBER1», «?NUMBER2»])], mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER2»]), ap (Const.«greaterThan») ([«?NUMBER2», «?NUMBER1»])], mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER1»]), ap (Const.«equal») ([«?NUMBER», «?NUMBER2»])]]))
axiom ax_887 : Holds (ap (Const.«instance») ([Const.«MinFn», Const.«BinaryFunction»]))
axiom ax_888 : Holds (ap (Const.«instance») ([Const.«MinFn», Const.«AssociativeFunction»]))
axiom ax_889 : Holds (ap (Const.«instance») ([Const.«MinFn», Const.«CommutativeFunction»]))
axiom ax_890 : Holds (ap (Const.«instance») ([Const.«MinFn», Const.«TotalValuedRelation»]))
axiom ax_891 : ∀ («?NUMBER» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MinFn») ([«?NUMBER1», «?NUMBER2»]), «?NUMBER»])) (mkOr [mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER1»]), ap (Const.«lessThan») ([«?NUMBER1», «?NUMBER2»])], mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER2»]), ap (Const.«lessThan») ([«?NUMBER2», «?NUMBER1»])], mkAnd [ap (Const.«equal») ([«?NUMBER», «?NUMBER1»]), ap (Const.«equal») ([«?NUMBER», «?NUMBER2»])]]))
axiom ax_892 : Holds (ap (Const.«instance») ([Const.«NumeratorFn», Const.«UnaryFunction»]))
axiom ax_893 : Holds (ap (Const.«instance») ([Const.«NumeratorFn», Const.«TotalValuedRelation»]))
axiom ax_894 : Holds (ap (Const.«instance») ([Const.«Pi», Const.«PositiveRealNumber»]))
axiom ax_895 : Holds (ap (Const.«instance») ([Const.«NumberE», Const.«PositiveRealNumber»]))
axiom ax_896 : Holds (ap (Const.«instance») ([Const.«RationalNumberFn», Const.«UnaryFunction»]))
axiom ax_897 : Holds (ap (Const.«instance») ([Const.«RealNumberFn», Const.«UnaryFunction»]))
axiom ax_898 : Holds (ap (Const.«instance») ([Const.«ReciprocalFn», Const.«UnaryFunction»]))
axiom ax_899 : Holds (ap (Const.«instance») ([Const.«ReciprocalFn», Const.«TotalValuedRelation»]))
axiom ax_900 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«Integer»])) (ap (Const.«equal») ([ap (Const.«ReciprocalFn») ([«?NUMBER»]), ap (Const.«ExponentiationFn») ([«?NUMBER», numLit "-1"])])))
axiom ax_901 : ∀ («?NUMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?NUMBER», Const.«Integer»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (ap (Const.«equal») ([numLit "1", ap (Const.«MultiplicationFn») ([«?NUMBER», ap (Const.«ReciprocalFn») ([«?NUMBER»])])])))
axiom ax_902 : Holds (ap (Const.«instance») ([Const.«RemainderFn», Const.«BinaryFunction»]))
axiom ax_903 : Holds (ap (Const.«instance») ([Const.«RemainderFn», Const.«PartialValuedRelation»]))
axiom ax_904 : ∀ («?NUMBER» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER1», «?NUMBER2»]), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER2», numLit "0"]))]) (ap (Const.«equal») ([ap (Const.«AdditionFn») ([ap (Const.«MultiplicationFn») ([ap (Const.«FloorFn») ([ap (Const.«DivisionFn») ([«?NUMBER1», «?NUMBER2»])]), «?NUMBER2»]), «?NUMBER»]), «?NUMBER1»])))
axiom ax_905 : ∀ («?NUMBER» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [mkNot (ap (Const.«equal») ([«?NUMBER2», numLit "0"])), ap (Const.«equal») ([ap (Const.«AdditionFn») ([ap (Const.«MultiplicationFn») ([ap (Const.«FloorFn») ([ap (Const.«DivisionFn») ([«?NUMBER1», «?NUMBER2»])]), «?NUMBER2»]), «?NUMBER»]), «?NUMBER1»])]) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER1», «?NUMBER2»]), «?NUMBER»])))
axiom ax_906 : ∀ («?NUMBER» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER1», «?NUMBER2»]), «?NUMBER»]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"])), mkNot (ap (Const.«equal») ([«?NUMBER1», numLit "0"])), mkNot (ap (Const.«equal») ([«?NUMBER2», numLit "0"]))]) (ap (Const.«equal») ([ap (Const.«SignumFn») ([«?NUMBER2»]), ap (Const.«SignumFn») ([«?NUMBER»])])))
axiom ax_907 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«EvenInteger»])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», numLit "2"]), numLit "0"])))
axiom ax_908 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«OddInteger»])) (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», numLit "2"]), numLit "1"])))
axiom ax_909 : ∀ («?PRIME» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PRIME», Const.«PrimeNumber»])) (mkForall (fun («?NUMBER» : Obj) => mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?PRIME», «?NUMBER»]), numLit "0"]), mkNot (ap (Const.«equal») ([«?NUMBER», numLit "0"]))]) (mkOr [ap (Const.«equal») ([«?NUMBER», numLit "1"]), ap (Const.«equal») ([«?NUMBER», «?PRIME»])]))))
axiom ax_910 : Holds (ap (Const.«instance») ([Const.«RoundFn», Const.«UnaryFunction»]))
axiom ax_911 : Holds (ap (Const.«instance») ([Const.«RoundFn», Const.«TotalValuedRelation»]))
axiom ax_912 : Holds (ap (Const.«instance») ([Const.«SignumFn», Const.«UnaryFunction»]))
axiom ax_913 : Holds (ap (Const.«instance») ([Const.«SignumFn», Const.«TotalValuedRelation»]))
axiom ax_914 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«NonnegativeRealNumber»])) (mkOr [ap (Const.«equal») ([ap (Const.«SignumFn») ([«?NUMBER»]), numLit "1"]), ap (Const.«equal») ([ap (Const.«SignumFn») ([«?NUMBER»]), numLit "0"])]))
axiom ax_915 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«PositiveRealNumber»])) (ap (Const.«equal») ([ap (Const.«SignumFn») ([«?NUMBER»]), numLit "1"])))
axiom ax_916 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NUMBER», Const.«NegativeRealNumber»])) (ap (Const.«equal») ([ap (Const.«SignumFn») ([«?NUMBER»]), numLit "-1"])))
axiom ax_917 : Holds (ap (Const.«instance») ([Const.«SineFn», Const.«UnaryFunction»]))
axiom ax_918 : Holds (ap (Const.«instance») ([Const.«SineFn», Const.«TotalValuedRelation»]))
axiom ax_919 : Holds (ap (Const.«instance») ([Const.«SquareRootFn», Const.«UnaryFunction»]))
axiom ax_920 : ∀ («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«SquareRootFn») ([«?NUMBER1»]), «?NUMBER2»])) (ap (Const.«equal») ([ap (Const.«MultiplicationFn») ([«?NUMBER2», «?NUMBER2»]), «?NUMBER1»])))
axiom ax_921 : Holds (ap (Const.«instance») ([Const.«TangentFn», Const.«UnaryFunction»]))
axiom ax_922 : Holds (ap (Const.«instance») ([Const.«TangentFn», Const.«TotalValuedRelation»]))
axiom ax_923 : ∀ («?DEGREE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEGREE», Const.«RealNumber»])) (ap (Const.«equal») ([ap (Const.«TangentFn») ([«?DEGREE»]), ap (Const.«DivisionFn») ([ap (Const.«SineFn») ([«?DEGREE»]), ap (Const.«CosineFn») ([«?DEGREE»])])])))
axiom ax_924 : Holds (ap (Const.«instance») ([Const.«ArcTangentFn», Const.«UnaryFunction»]))
axiom ax_925 : Holds (ap (Const.«instance») ([Const.«ArcTangentFn», Const.«TotalValuedRelation»]))
axiom ax_926 : ∀ («?X» : Obj), Holds (ap (Const.«equal») ([ap (Const.«ArcTangentFn») ([ap (Const.«TangentFn») ([«?X»])]), «?X»]))
axiom ax_927 : Holds (ap (Const.«instance») ([Const.«ArcCosineFn», Const.«UnaryFunction»]))
axiom ax_928 : Holds (ap (Const.«instance») ([Const.«ArcCosineFn», Const.«TotalValuedRelation»]))
axiom ax_929 : ∀ («?X» : Obj), Holds (ap (Const.«equal») ([ap (Const.«ArcCosineFn») ([ap (Const.«CosineFn») ([«?X»])]), «?X»]))
axiom ax_930 : Holds (ap (Const.«instance») ([Const.«ArcSineFn», Const.«UnaryFunction»]))
axiom ax_931 : Holds (ap (Const.«instance») ([Const.«ArcSineFn», Const.«TotalValuedRelation»]))
axiom ax_932 : ∀ («?X» : Obj), Holds (ap (Const.«equal») ([ap (Const.«ArcSineFn») ([ap (Const.«SineFn») ([«?X»])]), «?X»]))
axiom ax_933 : Holds (ap (Const.«instance») ([Const.«identityElement», Const.«BinaryPredicate»]))
axiom ax_934 : Holds (ap (Const.«identityElement») ([Const.«MultiplicationFn», numLit "1"]))
axiom ax_935 : Holds (ap (Const.«identityElement») ([Const.«AdditionFn», numLit "0"]))
axiom ax_936 : Holds (ap (Const.«identityElement») ([Const.«SubtractionFn», numLit "0"]))
axiom ax_937 : Holds (ap (Const.«identityElement») ([Const.«DivisionFn», numLit "1"]))
axiom ax_938 : Holds (ap (Const.«instance») ([Const.«SuccessorFn», Const.«UnaryFunction»]))
axiom ax_939 : Holds (ap (Const.«instance») ([Const.«SuccessorFn», Const.«TotalValuedRelation»]))
axiom ax_940 : ∀ («?INT1» : Obj) («?INT2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«SuccessorFn») ([«?INT1»]), ap (Const.«SuccessorFn») ([«?INT2»])])) (ap (Const.«equal») ([«?INT1», «?INT2»])))
axiom ax_941 : ∀ («?INT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INT», Const.«Integer»])) (ap (Const.«lessThan») ([«?INT», ap (Const.«SuccessorFn») ([«?INT»])])))
axiom ax_942 : ∀ («?INT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INT», Const.«Integer»])) (ap (Const.«equal») ([«?INT», ap (Const.«SuccessorFn») ([ap (Const.«PredecessorFn») ([«?INT»])])])))
axiom ax_943 : ∀ («?INT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INT», Const.«Integer»])) (ap (Const.«equal») ([«?INT», ap (Const.«PredecessorFn») ([ap (Const.«SuccessorFn») ([«?INT»])])])))
axiom ax_944 : Holds (ap (Const.«instance») ([Const.«PredecessorFn», Const.«UnaryFunction»]))
axiom ax_945 : Holds (ap (Const.«instance») ([Const.«PredecessorFn», Const.«TotalValuedRelation»]))
axiom ax_946 : ∀ («?INT1» : Obj) («?INT2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«PredecessorFn») ([«?INT1»]), ap (Const.«PredecessorFn») ([«?INT2»])])) (ap (Const.«equal») ([«?INT1», «?INT2»])))
axiom ax_947 : ∀ («?INT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INT», Const.«Integer»])) (ap (Const.«greaterThan») ([«?INT», ap (Const.«PredecessorFn») ([«?INT»])])))
axiom ax_948 : Holds (ap (Const.«instance») ([Const.«average», Const.«PartialValuedRelation»]))
axiom ax_949 : Holds (ap (Const.«instance») ([Const.«average», Const.«BinaryPredicate»]))
axiom ax_950 : Holds (ap (Const.«instance») ([Const.«average», Const.«SingleValuedRelation»]))
axiom ax_951 : ∀ («?AVERAGE» : Obj) («?LIST» : Obj), Holds (mkImp (ap (Const.«average») ([«?LIST», «?AVERAGE»])) (mkForall (fun («?LISTITEM» : Obj) => mkImp (ap (Const.«inList») ([«?LISTITEM», «?LIST»])) (ap (Const.«instance») ([«?LISTITEM», Const.«RealNumber»])))))
axiom ax_952 : Holds (ap (Const.«instance») ([Const.«subset», Const.«BinaryPredicate»]))
axiom ax_953 : ∀ («?ELEMENT» : Obj) («?SET» : Obj) («?SUBSET» : Obj), Holds (mkImp (mkAnd [ap (Const.«subset») ([«?SUBSET», «?SET»]), ap (Const.«element») ([«?ELEMENT», «?SUBSET»])]) (ap (Const.«element») ([«?ELEMENT», «?SET»])))
axiom ax_954 : ∀ («?ELEMENT» : Obj) («?SET» : Obj) («?SUBSET» : Obj), Holds (mkImp (mkImp (ap (Const.«element») ([«?ELEMENT», «?SUBSET»])) (ap (Const.«element») ([«?ELEMENT», «?SET»]))) (ap (Const.«subset») ([«?SUBSET», «?SET»])))
axiom ax_955 : Holds (ap (Const.«instance») ([Const.«element», Const.«BinaryPredicate»]))
axiom ax_956 : ∀ («?ELEMENT» : Obj) («?SET1» : Obj) («?SET2» : Obj), Holds (mkImp (mkIff (ap (Const.«element») ([«?ELEMENT», «?SET1»])) (ap (Const.«element») ([«?ELEMENT», «?SET2»]))) (ap (Const.«equal») ([«?SET1», «?SET2»])))
axiom ax_957 : Holds (ap (Const.«instance») ([Const.«UnionFn», Const.«BinaryFunction»]))
axiom ax_958 : Holds (ap (Const.«instance») ([Const.«UnionFn», Const.«TotalValuedRelation»]))
axiom ax_959 : Holds (ap (Const.«instance») ([Const.«IntersectionFn», Const.«BinaryFunction»]))
axiom ax_960 : Holds (ap (Const.«instance») ([Const.«IntersectionFn», Const.«TotalValuedRelation»]))
axiom ax_961 : Holds (ap (Const.«instance») ([Const.«RelativeComplementFn», Const.«BinaryFunction»]))
axiom ax_962 : Holds (ap (Const.«instance») ([Const.«RelativeComplementFn», Const.«TotalValuedRelation»]))
axiom ax_963 : Holds (ap (Const.«instance») ([Const.«ComplementFn», Const.«UnaryFunction»]))
axiom ax_964 : Holds (ap (Const.«instance») ([Const.«ComplementFn», Const.«TotalValuedRelation»]))
axiom ax_965 : Holds (ap (Const.«instance») ([Const.«GeneralizedUnionFn», Const.«UnaryFunction»]))
axiom ax_966 : Holds (ap (Const.«instance») ([Const.«GeneralizedUnionFn», Const.«TotalValuedRelation»]))
axiom ax_967 : Holds (ap (Const.«instance») ([Const.«GeneralizedIntersectionFn», Const.«UnaryFunction»]))
axiom ax_968 : Holds (ap (Const.«instance») ([Const.«GeneralizedIntersectionFn», Const.«TotalValuedRelation»]))
axiom ax_969 : Holds (ap (Const.«instance») ([Const.«CardinalityFn», Const.«UnaryFunction»]))
axiom ax_970 : Holds (ap (Const.«subclass») ([Const.«NullSet», Const.«Set»]))
axiom ax_971 : ∀ («?SET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SET», Const.«NullSet»])) (mkNot (mkExists (fun («?INST» : Obj) => ap (Const.«element») ([«?INST», «?SET»])))))
axiom ax_972 : Holds (ap (Const.«subclass») ([Const.«NonNullSet», Const.«Set»]))
axiom ax_973 : ∀ («?SET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SET», Const.«NonNullSet»])) (mkExists (fun («?INST» : Obj) => ap (Const.«element») ([«?INST», «?SET»]))))
axiom ax_974 : Holds (ap (Const.«subclass») ([Const.«FiniteSet», Const.«Set»]))
axiom ax_975 : ∀ («?SET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SET», Const.«FiniteSet»])) (mkExists (fun («?NUMBER» : Obj) => mkAnd [ap (Const.«instance») ([«?NUMBER», Const.«NonnegativeInteger»]), ap (Const.«equal») ([«?NUMBER», ap (Const.«CardinalityFn») ([«?SET»])])])))
axiom ax_976 : Holds (ap (Const.«instance») ([Const.«KappaFn», Const.«BinaryFunction»]))
axiom ax_977 : Holds (ap (Const.«instance») ([Const.«KappaFn», Const.«PartialValuedRelation»]))
axiom ax_978 : Holds (ap (Const.«subclass») ([Const.«Graph», Const.«Proposition»]))
axiom ax_979 : ∀ («?GRAPH» : Obj) («?NODE1» : Obj) («?NODE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAPH», Const.«Graph»]), ap (Const.«instance») ([«?NODE1», Const.«GraphNode»]), ap (Const.«instance») ([«?NODE2», Const.«GraphNode»]), ap (Const.«graphPart») ([«?NODE1», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE2», «?GRAPH»]), mkNot (ap (Const.«equal») ([«?NODE1», «?NODE2»]))]) (mkExists (fun («?ARC» : Obj) => mkExists (fun («?PATH» : Obj) => mkOr [ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC»]), mkAnd [ap (Const.«subGraph») ([«?PATH», «?GRAPH»]), ap (Const.«instance») ([«?PATH», Const.«GraphPath»]), mkOr [mkAnd [ap (Const.«equal») ([ap (Const.«BeginNodeFn») ([«?PATH»]), «?NODE1»]), ap (Const.«equal») ([ap (Const.«EndNodeFn») ([«?PATH»]), «?NODE2»])], mkAnd [ap (Const.«equal») ([ap (Const.«BeginNodeFn») ([«?PATH»]), «?NODE2»]), ap (Const.«equal») ([ap (Const.«EndNodeFn») ([«?PATH»]), «?NODE1»])]]]]))))
axiom ax_980 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«Graph»])) (mkExists (fun («?NODE1» : Obj) => mkExists (fun («?NODE2» : Obj) => mkExists (fun («?NODE3» : Obj) => mkExists (fun («?ARC1» : Obj) => mkExists (fun («?ARC2» : Obj) => mkAnd [ap (Const.«graphPart») ([«?NODE1», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE2», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE3», «?GRAPH»]), ap (Const.«graphPart») ([«?ARC1», «?GRAPH»]), ap (Const.«graphPart») ([«?ARC2», «?GRAPH»]), ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC1»]), ap (Const.«links») ([«?NODE2», «?NODE3», «?ARC2»]), mkNot (ap (Const.«equal») ([«?NODE1», «?NODE2»])), mkNot (ap (Const.«equal») ([«?NODE2», «?NODE3»])), mkNot (ap (Const.«equal») ([«?NODE1», «?NODE3»])), mkNot (ap (Const.«equal») ([«?ARC1», «?ARC2»]))])))))))
axiom ax_981 : Holds (ap (Const.«subclass») ([Const.«DirectedGraph», Const.«Graph»]))
axiom ax_982 : ∀ («?ARC» : Obj) («?GRAPH» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAPH», Const.«DirectedGraph»]), ap (Const.«instance») ([«?ARC», Const.«GraphArc»]), ap (Const.«graphPart») ([«?ARC», «?GRAPH»])]) (mkExists (fun («?NODE1» : Obj) => mkExists (fun («?NODE2» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«InitialNodeFn») ([«?ARC»]), «?NODE1»]), ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?ARC»]), «?NODE2»])]))))
axiom ax_983 : Holds (ap (Const.«subclass») ([Const.«Tree», Const.«DirectedGraph»]))
axiom ax_984 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«Tree»])) (mkNot (mkExists (fun («?LOOP» : Obj) => mkAnd [ap (Const.«instance») ([«?LOOP», Const.«GraphLoop»]), ap (Const.«graphPart») ([«?LOOP», «?GRAPH»])]))))
axiom ax_985 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«Tree»])) (mkNot (mkExists (fun («?LOOP» : Obj) => mkAnd [ap (Const.«instance») ([«?LOOP», Const.«GraphCircuit»]), ap (Const.«graphPart») ([«?LOOP», «?GRAPH»])]))))
axiom ax_986 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«Tree»])) (mkNot (mkExists (fun («?ARC1» : Obj) => mkExists (fun («?ARC2» : Obj) => mkExists (fun («?NODE» : Obj) => mkAnd [ap (Const.«graphPart») ([«?ARC1», «?GRAPH»]), ap (Const.«graphPart») ([«?ARC2», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE», «?GRAPH»]), ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?ARC1»]), «?NODE»]), ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?ARC2»]), «?NODE»]), mkNot (ap (Const.«equal») ([«?ARC1», «?ARC2»]))]))))))
axiom ax_987 : Holds (ap (Const.«subclass») ([Const.«GraphPath», Const.«DirectedGraph»]))
axiom ax_988 : ∀ («?ARC» : Obj) («?GRAPH» : Obj) («?NODE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAPH», Const.«GraphPath»]), ap (Const.«instance») ([«?ARC», Const.«GraphArc»]), ap (Const.«graphPart») ([«?ARC», «?GRAPH»]), ap (Const.«equal») ([ap (Const.«InitialNodeFn») ([«?ARC»]), «?NODE»])]) (mkNot (mkExists (fun («?OTHER» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«InitialNodeFn») ([«?OTHER»]), «?NODE»]), mkNot (ap (Const.«equal») ([«?OTHER», «?ARC»]))]))))
axiom ax_989 : ∀ («?ARC» : Obj) («?GRAPH» : Obj) («?NODE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAPH», Const.«GraphPath»]), ap (Const.«instance») ([«?ARC», Const.«GraphArc»]), ap (Const.«graphPart») ([«?ARC», «?GRAPH»]), ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?ARC»]), «?NODE»])]) (mkNot (mkExists (fun («?OTHER» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?OTHER»]), «?NODE»]), mkNot (ap (Const.«equal») ([«?OTHER», «?ARC»]))]))))
axiom ax_990 : Holds (ap (Const.«subclass») ([Const.«GraphCircuit», Const.«GraphPath»]))
axiom ax_991 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«GraphCircuit»])) (mkExists (fun («?NODE» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«BeginNodeFn») ([«?GRAPH»]), «?NODE»]), ap (Const.«equal») ([ap (Const.«EndNodeFn») ([«?GRAPH»]), «?NODE»])])))
axiom ax_992 : ∀ («?GRAPH» : Obj) («?NODE» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«BeginNodeFn») ([«?GRAPH»]), «?NODE»]), ap (Const.«equal») ([ap (Const.«EndNodeFn») ([«?GRAPH»]), «?NODE»])]) (ap (Const.«instance») ([«?GRAPH», Const.«GraphCircuit»])))
axiom ax_993 : Holds (ap (Const.«subclass») ([Const.«MultiGraph», Const.«Graph»]))
axiom ax_994 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«MultiGraph»])) (mkExists (fun («?ARC1» : Obj) => mkExists (fun («?ARC2» : Obj) => mkExists (fun («?NODE1» : Obj) => mkExists (fun («?NODE2» : Obj) => mkAnd [ap (Const.«graphPart») ([«?ARC1», «?GRAPH»]), ap (Const.«graphPart») ([«?ARC2», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE1», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE2», «?GRAPH»]), ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC1»]), ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC2»]), mkNot (ap (Const.«equal») ([«?ARC1», «?ARC2»]))]))))))
axiom ax_995 : ∀ («?ARC1» : Obj) («?ARC2» : Obj) («?GRAPH» : Obj) («?NODE1» : Obj) («?NODE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«graphPart») ([«?ARC1», «?GRAPH»]), ap (Const.«graphPart») ([«?ARC2», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE1», «?GRAPH»]), ap (Const.«graphPart») ([«?NODE2», «?GRAPH»]), ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC1»]), ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC2»]), mkNot (ap (Const.«equal») ([«?ARC1», «?ARC2»]))]) (ap (Const.«instance») ([«?GRAPH», Const.«MultiGraph»])))
axiom ax_996 : Holds (ap (Const.«subclass») ([Const.«PseudoGraph», Const.«Graph»]))
axiom ax_997 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«PseudoGraph»])) (mkExists (fun («?LOOP» : Obj) => mkAnd [ap (Const.«instance») ([«?LOOP», Const.«GraphLoop»]), ap (Const.«graphPart») ([«?LOOP», «?GRAPH»])])))
axiom ax_998 : ∀ («?GRAPH» : Obj) («?LOOP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LOOP», Const.«GraphLoop»]), ap (Const.«graphPart») ([«?LOOP», «?GRAPH»])]) (ap (Const.«instance») ([«?GRAPH», Const.«PseudoGraph»])))
axiom ax_999 : Holds (ap (Const.«subclass») ([Const.«GraphElement», Const.«Proposition»]))
axiom ax_1000 : Holds (ap (Const.«partition») ([Const.«GraphElement», Const.«GraphNode», Const.«GraphArc»]))
axiom ax_1001 : ∀ («?PART» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PART», Const.«GraphElement»])) (mkExists (fun («?GRAPH» : Obj) => mkAnd [ap (Const.«instance») ([«?GRAPH», Const.«Graph»]), ap (Const.«graphPart») ([«?PART», «?GRAPH»])])))
axiom ax_1002 : Holds (ap (Const.«subclass») ([Const.«GraphNode», Const.«GraphElement»]))
axiom ax_1003 : ∀ («?NODE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NODE», Const.«GraphNode»])) (mkExists (fun («?OTHER» : Obj) => mkExists (fun («?ARC» : Obj) => ap (Const.«links») ([«?NODE», «?OTHER», «?ARC»])))))
axiom ax_1004 : Holds (ap (Const.«subclass») ([Const.«GraphArc», Const.«GraphElement»]))
axiom ax_1005 : ∀ («?ARC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ARC», Const.«GraphArc»])) (mkExists (fun («?NODE1» : Obj) => mkExists (fun («?NODE2» : Obj) => ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC»])))))
axiom ax_1006 : Holds (ap (Const.«subclass») ([Const.«GraphLoop», Const.«GraphArc»]))
axiom ax_1007 : ∀ («?LOOP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?LOOP», Const.«GraphLoop»])) (mkExists (fun («?NODE» : Obj) => ap (Const.«links») ([«?NODE», «?NODE», «?LOOP»]))))
axiom ax_1008 : ∀ («?LOOP» : Obj) («?NODE» : Obj), Holds (mkImp (ap (Const.«links») ([«?NODE», «?NODE», «?LOOP»])) (ap (Const.«instance») ([«?LOOP», Const.«GraphLoop»])))
axiom ax_1009 : ∀ («?ARC» : Obj) («?NODE» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«InitialNodeFn») ([«?ARC»]), «?NODE»]), ap (Const.«equal») ([ap (Const.«TerminalNodeFn») ([«?ARC»]), «?NODE»])]) (ap (Const.«instance») ([«?ARC», Const.«GraphLoop»])))
axiom ax_1010 : Holds (ap (Const.«instance») ([Const.«links», Const.«TernaryPredicate»]))
axiom ax_1011 : ∀ («?ARC» : Obj) («?NODE1» : Obj) («?NODE2» : Obj), Holds (mkImp (ap (Const.«links») ([«?NODE1», «?NODE2», «?ARC»])) (ap (Const.«links») ([«?NODE2», «?NODE1», «?ARC»])))
axiom ax_1012 : Holds (ap (Const.«instance») ([Const.«graphPart», Const.«BinaryPredicate»]))
axiom ax_1013 : Holds (ap (Const.«instance») ([Const.«graphPart», Const.«AsymmetricRelation»]))
axiom ax_1014 : Holds (ap (Const.«instance») ([Const.«graphPart», Const.«TotalValuedRelation»]))
axiom ax_1015 : Holds (ap (Const.«instance») ([Const.«graphPart», Const.«IrreflexiveRelation»]))
axiom ax_1016 : Holds (ap (Const.«instance») ([Const.«subGraph», Const.«BinaryPredicate»]))
axiom ax_1017 : Holds (ap (Const.«instance») ([Const.«subGraph», Const.«ReflexiveRelation»]))
axiom ax_1018 : Holds (ap (Const.«instance») ([Const.«subGraph», Const.«TransitiveRelation»]))
axiom ax_1019 : ∀ («?ELEMENT» : Obj) («?GRAPH1» : Obj) («?GRAPH2» : Obj), Holds (mkImp (mkAnd [ap (Const.«subGraph») ([«?GRAPH1», «?GRAPH2»]), ap (Const.«graphPart») ([«?ELEMENT», «?GRAPH1»])]) (ap (Const.«graphPart») ([«?ELEMENT», «?GRAPH2»])))
axiom ax_1020 : Holds (ap (Const.«instance») ([Const.«pathLength», Const.«BinaryPredicate»]))
axiom ax_1021 : Holds (ap (Const.«instance») ([Const.«InitialNodeFn», Const.«UnaryFunction»]))
axiom ax_1022 : Holds (ap (Const.«instance») ([Const.«InitialNodeFn», Const.«PartialValuedRelation»]))
axiom ax_1023 : Holds (ap (Const.«instance») ([Const.«TerminalNodeFn», Const.«UnaryFunction»]))
axiom ax_1024 : Holds (ap (Const.«instance») ([Const.«TerminalNodeFn», Const.«PartialValuedRelation»]))
axiom ax_1025 : Holds (ap (Const.«instance») ([Const.«BeginNodeFn», Const.«UnaryFunction»]))
axiom ax_1026 : Holds (ap (Const.«instance») ([Const.«BeginNodeFn», Const.«TotalValuedRelation»]))
axiom ax_1027 : Holds (ap (Const.«relatedInternalConcept») ([Const.«BeginNodeFn», Const.«InitialNodeFn»]))
axiom ax_1028 : Holds (ap (Const.«instance») ([Const.«EndNodeFn», Const.«UnaryFunction»]))
axiom ax_1029 : Holds (ap (Const.«instance») ([Const.«EndNodeFn», Const.«TotalValuedRelation»]))
axiom ax_1030 : Holds (ap (Const.«relatedInternalConcept») ([Const.«EndNodeFn», Const.«TerminalNodeFn»]))
axiom ax_1031 : Holds (ap (Const.«instance») ([Const.«arcWeight», Const.«BinaryPredicate»]))
axiom ax_1032 : Holds (ap (Const.«instance») ([Const.«arcWeight», Const.«SingleValuedRelation»]))
axiom ax_1033 : Holds (ap (Const.«instance») ([Const.«PathWeightFn», Const.«UnaryFunction»]))
axiom ax_1034 : ∀ («?ARC1» : Obj) («?NUMBER1» : Obj) («?PATH» : Obj) («?SUBPATH» : Obj) («?SUM» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH»]), «?SUM»]), ap (Const.«subGraph») ([«?SUBPATH», «?PATH»]), ap (Const.«graphPart») ([«?ARC1», «?PATH»]), ap (Const.«arcWeight») ([«?ARC1», «?NUMBER1»]), mkForall (fun («?ARC2» : Obj) => mkImp (ap (Const.«graphPart») ([«?ARC2», «?PATH»])) (mkOr [ap (Const.«graphPart») ([«?ARC2», «?SUBPATH»]), ap (Const.«equal») ([«?ARC2», «?ARC1»])]))]) (ap (Const.«equal») ([«?SUM», ap (Const.«AdditionFn») ([ap (Const.«PathWeightFn») ([«?SUBPATH»]), «?NUMBER1»])])))
axiom ax_1035 : ∀ («?ARC1» : Obj) («?ARC2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj) («?PATH» : Obj) («?SUM» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH»]), «?SUM»]), ap (Const.«graphPart») ([«?ARC1», «?PATH»]), ap (Const.«graphPart») ([«?ARC2», «?PATH»]), ap (Const.«arcWeight») ([«?ARC1», «?NUMBER1»]), ap (Const.«arcWeight») ([«?ARC2», «?NUMBER2»]), mkForall (fun («?ARC3» : Obj) => mkImp (ap (Const.«graphPart») ([«?ARC3», «?PATH»])) (mkOr [ap (Const.«equal») ([«?ARC3», «?ARC1»]), ap (Const.«equal») ([«?ARC3», «?ARC2»])]))]) (ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH»]), ap (Const.«AdditionFn») ([«?NUMBER1», «?NUMBER2»])])))
axiom ax_1036 : Holds (ap (Const.«instance») ([Const.«MinimalWeightedPathFn», Const.«BinaryFunction»]))
axiom ax_1037 : Holds (ap (Const.«instance») ([Const.«MinimalWeightedPathFn», Const.«TotalValuedRelation»]))
axiom ax_1038 : ∀ («?NODE1» : Obj) («?NODE2» : Obj) («?PATH» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MinimalWeightedPathFn») ([«?NODE1», «?NODE2»]), «?PATH»])) (ap (Const.«instance») ([«?PATH», ap (Const.«GraphPathFn») ([«?NODE1», «?NODE2»])])))
axiom ax_1039 : ∀ («?NODE1» : Obj) («?NODE2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj) («?PATH» : Obj) («?PATH2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MinimalWeightedPathFn») ([«?NODE1», «?NODE2»]), «?PATH»]), ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH»]), «?NUMBER1»]), ap (Const.«instance») ([«?PATH2», ap (Const.«GraphPathFn») ([«?NODE1», «?NODE2»])]), ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH2»]), «?NUMBER2»])]) (ap (Const.«greaterThanOrEqualTo») ([«?NUMBER2», «?NUMBER1»])))
axiom ax_1040 : Holds (ap (Const.«instance») ([Const.«MaximalWeightedPathFn», Const.«BinaryFunction»]))
axiom ax_1041 : Holds (ap (Const.«instance») ([Const.«MaximalWeightedPathFn», Const.«TotalValuedRelation»]))
axiom ax_1042 : ∀ («?NODE1» : Obj) («?NODE2» : Obj) («?PATH» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MaximalWeightedPathFn») ([«?NODE1», «?NODE2»]), «?PATH»])) (ap (Const.«instance») ([«?PATH», ap (Const.«GraphPathFn») ([«?NODE1», «?NODE2»])])))
axiom ax_1043 : ∀ («?NODE1» : Obj) («?NODE2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj) («?PATH» : Obj) («?PATH2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MaximalWeightedPathFn») ([«?NODE1», «?NODE2»]), «?PATH»]), ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH»]), «?NUMBER1»]), ap (Const.«instance») ([«?PATH2», ap (Const.«GraphPathFn») ([«?NODE1», «?NODE2»])]), ap (Const.«equal») ([ap (Const.«PathWeightFn») ([«?PATH2»]), «?NUMBER2»])]) (ap (Const.«lessThanOrEqualTo») ([«?NUMBER2», «?NUMBER1»])))
axiom ax_1044 : Holds (ap (Const.«instance») ([Const.«GraphPathFn», Const.«BinaryFunction»]))
axiom ax_1045 : Holds (ap (Const.«instance») ([Const.«GraphPathFn», Const.«TotalValuedRelation»]))
axiom ax_1046 : ∀ («?GRAPH» : Obj) («?NODE1» : Obj) («?NODE2» : Obj) («?PATH» : Obj), Holds (mkImp (mkAnd [ap (Const.«graphPart») ([«?PATH», «?GRAPH»]), mkNot (ap (Const.«instance») ([«?GRAPH», Const.«DirectedGraph»]))]) (mkIff (ap (Const.«instance») ([«?PATH», ap (Const.«GraphPathFn») ([«?NODE1», «?NODE2»])])) (ap (Const.«instance») ([«?PATH», ap (Const.«GraphPathFn») ([«?NODE2», «?NODE1»])]))))
axiom ax_1047 : Holds (ap (Const.«instance») ([Const.«CutSetFn», Const.«UnaryFunction»]))
axiom ax_1048 : Holds (ap (Const.«instance») ([Const.«MinimalCutSetFn», Const.«UnaryFunction»]))
axiom ax_1049 : Holds (ap (Const.«relatedInternalConcept») ([Const.«MinimalCutSetFn», Const.«CutSetFn»]))
axiom ax_1050 : ∀ («?GRAPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GRAPH», Const.«Graph»])) (ap (Const.«subclass») ([ap (Const.«MinimalCutSetFn») ([«?GRAPH»]), ap (Const.«CutSetFn») ([«?GRAPH»])])))
axiom ax_1051 : ∀ («?GRAPH» : Obj) («?PATHCLASS» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MinimalCutSetFn») ([«?GRAPH»]), «?PATHCLASS»])) (mkExists (fun («?NUMBER» : Obj) => mkForall (fun («?PATH» : Obj) => mkImp (ap (Const.«instance») ([«?PATH», «?PATHCLASS»])) (ap (Const.«pathLength») ([«?PATH», «?NUMBER»]))))))
axiom ax_1052 : ∀ («?GRAPH» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkNot (mkExists (fun («?PATH1» : Obj) => mkExists (fun («?PATH2» : Obj) => mkAnd [ap (Const.«instance») ([«?PATH1», ap (Const.«CutSetFn») ([«?GRAPH»])]), ap (Const.«instance») ([«?PATH2», ap (Const.«MinimalCutSetFn») ([«?GRAPH»])]), ap (Const.«pathLength») ([«?PATH1», «?NUMBER1»]), ap (Const.«pathLength») ([«?PATH2», «?NUMBER2»]), ap (Const.«lessThan») ([«?NUMBER1», «?NUMBER2»])]))))
axiom ax_1053 : Holds (ap (Const.«instance») ([Const.«abstractCounterpart», Const.«BinaryPredicate»]))
axiom ax_1054 : Holds (ap (Const.«subrelation») ([Const.«abstractCounterpart», Const.«represents»]))
axiom ax_1055 : Holds (ap (Const.«subclass») ([Const.«PhysicalSystem», Const.«Physical»]))
axiom ax_1056 : Holds (ap (Const.«instance») ([Const.«subSystem», Const.«BinaryPredicate»]))
axiom ax_1057 : Holds (ap (Const.«instance») ([Const.«systemPart», Const.«BinaryPredicate»]))
axiom ax_1058 : ∀ («?PART» : Obj) («?SUB» : Obj) («?SYSTEM» : Obj), Holds (mkImp (mkAnd [ap (Const.«subSystem») ([«?SUB», «?SYSTEM»]), ap (Const.«systemPart») ([«?PART», «?SUB»])]) (ap (Const.«systemPart») ([«?PART», «?SYSTEM»])))
axiom ax_1059 : Holds (ap (Const.«instance») ([Const.«graphMeasure», Const.«BinaryPredicate»]))
axiom ax_1060 : ∀ («?G» : Obj) («?M» : Obj), Holds (mkImp (ap (Const.«graphMeasure») ([«?G», «?M»])) (mkForall (fun («?AC» : Obj) => mkAnd [ap (Const.«graphPart») ([«?AC», «?G»]), mkExists (fun («?PC» : Obj) => ap (Const.«abstractCounterpart») ([«?AC», «?PC»]))])))
axiom ax_1061 : ∀ («?AA» : Obj) («?AN» : Obj) («?G» : Obj) («?M» : Obj) («?N» : Obj) («?PA» : Obj) («?PN» : Obj), Holds (mkImp (mkAnd [ap (Const.«graphMeasure») ([«?G», «?M»]), ap (Const.«instance») ([«?AN», Const.«GraphNode»]), ap (Const.«graphPart») ([«?AN», «?G»]), ap (Const.«graphPart») ([«?AA», «?G»]), ap (Const.«instance») ([«?AA», Const.«GraphArc»]), ap (Const.«abstractCounterpart») ([«?AN», «?PN»]), ap (Const.«abstractCounterpart») ([«?AA», «?PA»]), ap (Const.«arcWeight») ([«?AA», «?N»])]) (ap (Const.«measure») ([«?PA», ap (Const.«MeasureFn») ([«?N», «?M»])])))
axiom ax_1062 : Holds (ap (Const.«subclass») ([Const.«UnitOfMeasure», Const.«PhysicalQuantity»]))
axiom ax_1063 : Holds (ap (Const.«subclass») ([Const.«CompositeUnitOfMeasure», Const.«UnitOfMeasure»]))
axiom ax_1064 : Holds (ap (Const.«subclass») ([Const.«CompositeUnitOfMeasure», Const.«FunctionQuantity»]))
axiom ax_1065 : Holds (ap (Const.«subclass») ([Const.«NonCompositeUnitOfMeasure», Const.«UnitOfMeasure»]))
axiom ax_1066 : Holds (ap (Const.«subclass») ([Const.«NonCompositeUnitOfMeasure», Const.«ConstantQuantity»]))
axiom ax_1067 : Holds (ap (Const.«partition») ([Const.«UnitOfMeasure», Const.«CompositeUnitOfMeasure», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1068 : ∀ («?N» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?QUANT», ap (Const.«MeasureFn») ([«?N», «?UNIT»])]), ap (Const.«instance») ([«?UNIT», Const.«CompositeUnitOfMeasure»])]) (ap (Const.«instance») ([«?QUANT», Const.«FunctionQuantity»])))
axiom ax_1069 : ∀ («?N» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?QUANT», ap (Const.«MeasureFn») ([«?N», «?UNIT»])]), ap (Const.«instance») ([«?UNIT», Const.«NonCompositeUnitOfMeasure»])]) (ap (Const.«instance») ([«?QUANT», Const.«ConstantQuantity»])))
axiom ax_1070 : Holds (ap (Const.«subclass») ([Const.«SystemeInternationalUnit», Const.«UnitOfMeasure»]))
axiom ax_1071 : Holds (ap (Const.«subclass») ([Const.«LengthMeasure», Const.«ConstantQuantity»]))
axiom ax_1072 : Holds (ap (Const.«subclass») ([Const.«UnitOfLength», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1073 : Holds (ap (Const.«subclass») ([Const.«MassMeasure», Const.«ConstantQuantity»]))
axiom ax_1074 : Holds (ap (Const.«subclass») ([Const.«UnitOfMass», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1075 : Holds (ap (Const.«subclass») ([Const.«AreaMeasure», Const.«FunctionQuantity»]))
axiom ax_1076 : Holds (ap (Const.«subclass») ([Const.«UnitOfArea», Const.«CompositeUnitOfMeasure»]))
axiom ax_1077 : Holds (ap (Const.«subclass») ([Const.«VolumeMeasure», Const.«FunctionQuantity»]))
axiom ax_1078 : Holds (ap (Const.«subclass») ([Const.«UnitOfVolume», Const.«CompositeUnitOfMeasure»]))
axiom ax_1079 : Holds (ap (Const.«subclass») ([Const.«TemperatureMeasure», Const.«ConstantQuantity»]))
axiom ax_1080 : Holds (ap (Const.«subclass») ([Const.«UnitOfTemperature», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1081 : Holds (ap (Const.«subclass») ([Const.«CurrencyMeasure», Const.«ConstantQuantity»]))
axiom ax_1082 : Holds (ap (Const.«subclass») ([Const.«UnitOfCurrency», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1083 : Holds (ap (Const.«subclass») ([Const.«AngleMeasure», Const.«ConstantQuantity»]))
axiom ax_1084 : Holds (ap (Const.«subclass») ([Const.«UnitOfAngularMeasure», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1085 : Holds (ap (Const.«subclass») ([Const.«PlaneAngleMeasure», Const.«AngleMeasure»]))
axiom ax_1086 : Holds (ap (Const.«subclass») ([Const.«SolidAngleMeasure», Const.«AngleMeasure»]))
axiom ax_1087 : Holds (ap (Const.«disjoint») ([Const.«SolidAngleMeasure», Const.«PlaneAngleMeasure»]))
axiom ax_1088 : Holds (ap (Const.«subclass») ([Const.«UnitOfInformation», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1089 : Holds (ap (Const.«subclass») ([Const.«UnitOfDuration», Const.«NonCompositeUnitOfMeasure»]))
axiom ax_1090 : Holds (ap (Const.«instance») ([Const.«MeasureFn», Const.«BinaryFunction»]))
axiom ax_1091 : Holds (ap (Const.«instance») ([Const.«MeasureFn», Const.«TotalValuedRelation»]))
axiom ax_1092 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfLength»])]) (ap (Const.«instance») ([«?QUANT», Const.«LengthMeasure»])))
axiom ax_1093 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfMass»])]) (ap (Const.«instance») ([«?QUANT», Const.«MassMeasure»])))
axiom ax_1094 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfArea»])]) (ap (Const.«instance») ([«?QUANT», Const.«AreaMeasure»])))
axiom ax_1095 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfVolume»])]) (ap (Const.«instance») ([«?QUANT», Const.«VolumeMeasure»])))
axiom ax_1096 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfTemperature»])]) (ap (Const.«instance») ([«?QUANT», Const.«TemperatureMeasure»])))
axiom ax_1097 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfCurrency»])]) (ap (Const.«instance») ([«?QUANT», Const.«CurrencyMeasure»])))
axiom ax_1098 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfAngularMeasure»])]) (ap (Const.«instance») ([«?QUANT», Const.«AngleMeasure»])))
axiom ax_1099 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfDuration»])]) (ap (Const.«instance») ([«?QUANT», Const.«TimeDuration»])))
axiom ax_1100 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfInformation»])]) (ap (Const.«instance») ([«?QUANT», Const.«InformationMeasure»])))
axiom ax_1101 : Holds (ap (Const.«subclass») ([Const.«UnitOfMeasureMultiplier», Const.«UnaryFunction»]))
axiom ax_1102 : Holds (ap (Const.«subclass») ([Const.«UnitOfMeasureMultiplier», Const.«TotalValuedRelation»]))
axiom ax_1103 : ∀ («?FUNCTION» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FUNCTION», Const.«UnitOfMeasureMultiplier»]), ap (Const.«instance») ([«?UNIT», Const.«CompositeUnitOfMeasure»])]) (ap (Const.«instance») ([ap («?FUNCTION») ([«?UNIT»]), Const.«CompositeUnitOfMeasure»])))
axiom ax_1104 : ∀ («?FUNCTION» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FUNCTION», Const.«UnitOfMeasureMultiplier»]), ap (Const.«instance») ([«?UNIT», Const.«NonCompositeUnitOfMeasure»])]) (ap (Const.«instance») ([ap («?FUNCTION») ([«?UNIT»]), Const.«NonCompositeUnitOfMeasure»])))
axiom ax_1105 : Holds (ap (Const.«instance») ([Const.«KiloFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1106 : ∀ («?KILOUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?KILOUNIT», ap (Const.«KiloFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?KILOUNIT»]), ap (Const.«MeasureFn») ([numLit "1000", «?UNIT»])])))
axiom ax_1107 : Holds (ap (Const.«instance») ([Const.«MegaFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1108 : ∀ («?MEGAUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?MEGAUNIT», ap (Const.«MegaFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?MEGAUNIT»]), ap (Const.«MeasureFn») ([numLit "1000000", «?UNIT»])])))
axiom ax_1109 : Holds (ap (Const.«instance») ([Const.«GigaFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1110 : ∀ («?GIGAUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?GIGAUNIT», ap (Const.«GigaFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?GIGAUNIT»]), ap (Const.«MeasureFn») ([numLit "1000000", ap (Const.«KiloFn») ([«?UNIT»])])])))
axiom ax_1111 : Holds (ap (Const.«instance») ([Const.«TeraFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1112 : ∀ («?TERAUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?TERAUNIT», ap (Const.«TeraFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?TERAUNIT»]), ap (Const.«MeasureFn») ([numLit "1000000000", ap (Const.«KiloFn») ([«?UNIT»])])])))
axiom ax_1113 : Holds (ap (Const.«instance») ([Const.«MilliFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1114 : ∀ («?MILLIUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?MILLIUNIT», ap (Const.«MilliFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?MILLIUNIT»]), ap (Const.«MeasureFn») ([numLit "0.001", «?UNIT»])])))
axiom ax_1115 : Holds (ap (Const.«instance») ([Const.«MicroFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1116 : ∀ («?MICROUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?MICROUNIT», ap (Const.«MicroFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?MICROUNIT»]), ap (Const.«MeasureFn») ([numLit "0.000001", «?UNIT»])])))
axiom ax_1117 : Holds (ap (Const.«instance») ([Const.«NanoFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1118 : ∀ («?NANOUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?NANOUNIT», ap (Const.«NanoFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?NANOUNIT»]), ap (Const.«MeasureFn») ([numLit "0.000000001", «?UNIT»])])))
axiom ax_1119 : Holds (ap (Const.«instance») ([Const.«PicoFn», Const.«UnitOfMeasureMultiplier»]))
axiom ax_1120 : ∀ («?PICOUNIT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?PICOUNIT», ap (Const.«PicoFn») ([«?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", «?PICOUNIT»]), ap (Const.«MeasureFn») ([numLit "0.000000000001", «?UNIT»])])))
axiom ax_1121 : Holds (ap (Const.«instance») ([Const.«IntervalFn», Const.«BinaryFunction»]))
axiom ax_1122 : Holds (ap (Const.«instance») ([Const.«IntervalFn», Const.«TotalValuedRelation»]))
axiom ax_1123 : Holds (ap (Const.«relatedInternalConcept») ([Const.«IntervalFn», Const.«RecurrentTimeIntervalFn»]))
axiom ax_1124 : ∀ («?CLASS» : Obj) («?FROM» : Obj) («?QUANTITY» : Obj) («?TO» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?QUANTITY», ap (Const.«IntervalFn») ([«?FROM», «?TO»])]), ap (Const.«instance») ([«?FROM», «?CLASS»]), ap (Const.«instance») ([«?TO», «?CLASS»])]) (ap (Const.«instance») ([«?QUANTITY», «?CLASS»])))
axiom ax_1125 : Holds (ap (Const.«instance») ([Const.«UnitFn», Const.«UnaryFunction»]))
axiom ax_1126 : Holds (ap (Const.«instance») ([Const.«UnitFn», Const.«TotalValuedRelation»]))
axiom ax_1127 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?QUANT», Const.«PhysicalQuantity»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfMeasure»]), ap (Const.«equal») ([«?QUANT», ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»])])]) (ap (Const.«equal») ([ap (Const.«UnitFn») ([«?QUANT»]), «?UNIT»])))
axiom ax_1128 : Holds (ap (Const.«instance») ([Const.«PerFn», Const.«BinaryFunction»]))
axiom ax_1129 : Holds (ap (Const.«instance») ([Const.«PerFn», Const.«TotalValuedRelation»]))
axiom ax_1130 : Holds (ap (Const.«subrelation») ([Const.«DensityFn», Const.«PerFn»]))
axiom ax_1131 : Holds (ap (Const.«instance») ([Const.«DensityFn», Const.«TotalValuedRelation»]))
axiom ax_1132 : Holds (ap (Const.«instance») ([Const.«DensityFn», Const.«BinaryFunction»]))
axiom ax_1133 : Holds (ap (Const.«subrelation») ([Const.«SpeedFn», Const.«PerFn»]))
axiom ax_1134 : Holds (ap (Const.«instance») ([Const.«SpeedFn», Const.«TotalValuedRelation»]))
axiom ax_1135 : Holds (ap (Const.«instance») ([Const.«SpeedFn», Const.«BinaryFunction»]))
axiom ax_1136 : Holds (ap (Const.«instance») ([Const.«VelocityFn», Const.«QuaternaryFunction»]))
axiom ax_1137 : Holds (ap (Const.«instance») ([Const.«VelocityFn», Const.«TotalValuedRelation»]))
axiom ax_1138 : ∀ («?DIRECTION» : Obj) («?DISTANCE» : Obj) («?OBJECT» : Obj) («?REF» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«measure») ([«?OBJECT», ap (Const.«VelocityFn») ([«?DISTANCE», «?TIME», «?REF», «?DIRECTION»])])) (ap (Const.«measure») ([«?OBJECT», ap (Const.«SpeedFn») ([«?DISTANCE», «?TIME»])])))
axiom ax_1139 : Holds (ap (Const.«instance») ([Const.«Meter», Const.«UnitOfLength»]))
axiom ax_1140 : Holds (ap (Const.«instance») ([Const.«Meter», Const.«SystemeInternationalUnit»]))
axiom ax_1141 : Holds (ap (Const.«instance») ([Const.«Gram», Const.«UnitOfMass»]))
axiom ax_1142 : Holds (ap (Const.«instance») ([Const.«Gram», Const.«SystemeInternationalUnit»]))
axiom ax_1143 : Holds (ap (Const.«instance») ([Const.«SecondDuration», Const.«UnitOfDuration»]))
axiom ax_1144 : Holds (ap (Const.«instance») ([Const.«SecondDuration», Const.«TimeDuration»]))
axiom ax_1145 : Holds (ap (Const.«instance») ([Const.«SecondDuration», Const.«SystemeInternationalUnit»]))
axiom ax_1146 : Holds (ap (Const.«instance») ([Const.«Ampere», Const.«CompositeUnitOfMeasure»]))
axiom ax_1147 : Holds (ap (Const.«instance») ([Const.«Ampere», Const.«SystemeInternationalUnit»]))
axiom ax_1148 : Holds (ap (Const.«instance») ([Const.«KelvinDegree», Const.«UnitOfTemperature»]))
axiom ax_1149 : Holds (ap (Const.«instance») ([Const.«KelvinDegree», Const.«SystemeInternationalUnit»]))
axiom ax_1150 : Holds (ap (Const.«instance») ([Const.«Mole», Const.«UnitOfMass»]))
axiom ax_1151 : Holds (ap (Const.«instance») ([Const.«Mole», Const.«SystemeInternationalUnit»]))
axiom ax_1152 : Holds (ap (Const.«instance») ([Const.«Candela», Const.«CompositeUnitOfMeasure»]))
axiom ax_1153 : Holds (ap (Const.«instance») ([Const.«Candela», Const.«SystemeInternationalUnit»]))
axiom ax_1154 : Holds (ap (Const.«instance») ([Const.«Liter», Const.«UnitOfVolume»]))
axiom ax_1155 : Holds (ap (Const.«instance») ([Const.«Centimeter», Const.«UnitOfLength»]))
axiom ax_1156 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Centimeter»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.01"]), Const.«Meter»])]))
axiom ax_1157 : Holds (ap (Const.«instance») ([Const.«Millimeter», Const.«UnitOfLength»]))
axiom ax_1158 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Millimeter»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.001"]), Const.«Meter»])]))
axiom ax_1159 : Holds (ap (Const.«instance») ([Const.«Kilometer», Const.«UnitOfLength»]))
axiom ax_1160 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Kilometer»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1000"]), Const.«Meter»])]))
axiom ax_1161 : Holds (ap (Const.«instance») ([Const.«Radian», Const.«UnitOfAngularMeasure»]))
axiom ax_1162 : Holds (ap (Const.«instance») ([Const.«Radian», Const.«SystemeInternationalUnit»]))
axiom ax_1163 : Holds (ap (Const.«instance») ([Const.«Steradian», Const.«UnitOfAngularMeasure»]))
axiom ax_1164 : Holds (ap (Const.«instance») ([Const.«Steradian», Const.«SystemeInternationalUnit»]))
axiom ax_1165 : Holds (ap (Const.«subclass») ([Const.«FrequencyMeasure», Const.«TimeDependentQuantity»]))
axiom ax_1166 : Holds (ap (Const.«subclass») ([Const.«UnitOfFrequency», Const.«CompositeUnitOfMeasure»]))
axiom ax_1167 : ∀ («?NUMBER» : Obj) («?QUANT» : Obj) («?UNIT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», «?UNIT»]), «?QUANT»]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfFrequency»])]) (ap (Const.«instance») ([«?QUANT», Const.«FrequencyMeasure»])))
axiom ax_1168 : Holds (ap (Const.«instance») ([Const.«Hertz», Const.«UnitOfFrequency»]))
axiom ax_1169 : Holds (ap (Const.«instance») ([Const.«Hertz», Const.«SystemeInternationalUnit»]))
axiom ax_1170 : Holds (ap (Const.«instance») ([Const.«Newton», Const.«CompositeUnitOfMeasure»]))
axiom ax_1171 : Holds (ap (Const.«instance») ([Const.«Newton», Const.«SystemeInternationalUnit»]))
axiom ax_1172 : Holds (ap (Const.«instance») ([Const.«Pascal», Const.«CompositeUnitOfMeasure»]))
axiom ax_1173 : Holds (ap (Const.«instance») ([Const.«Pascal», Const.«SystemeInternationalUnit»]))
axiom ax_1174 : Holds (ap (Const.«instance») ([Const.«Joule», Const.«CompositeUnitOfMeasure»]))
axiom ax_1175 : Holds (ap (Const.«instance») ([Const.«Joule», Const.«SystemeInternationalUnit»]))
axiom ax_1176 : Holds (ap (Const.«instance») ([Const.«Watt», Const.«CompositeUnitOfMeasure»]))
axiom ax_1177 : Holds (ap (Const.«instance») ([Const.«Watt», Const.«SystemeInternationalUnit»]))
axiom ax_1178 : Holds (ap (Const.«instance») ([Const.«Horsepower», Const.«CompositeUnitOfMeasure»]))
axiom ax_1179 : ∀ («?N» : Obj), Holds (mkImp (ap (Const.«instance») ([«?N», Const.«RealNumber»])) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?N», Const.«Horsepower»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?N», numLit "746"]), Const.«Watt»])])))
axiom ax_1180 : Holds (ap (Const.«instance») ([Const.«Coulomb», Const.«CompositeUnitOfMeasure»]))
axiom ax_1181 : Holds (ap (Const.«instance») ([Const.«Coulomb», Const.«SystemeInternationalUnit»]))
axiom ax_1182 : ∀ («?NUMBER» : Obj) («?QUANTITY» : Obj), Holds (mkImp (ap (Const.«equal») ([«?QUANTITY», ap (Const.«MeasureFn») ([«?NUMBER», Const.«Coulomb»])])) (ap (Const.«instance») ([«?QUANTITY», Const.«TimeDependentQuantity»])))
axiom ax_1183 : Holds (ap (Const.«instance») ([Const.«Volt», Const.«CompositeUnitOfMeasure»]))
axiom ax_1184 : Holds (ap (Const.«instance») ([Const.«Volt», Const.«SystemeInternationalUnit»]))
axiom ax_1185 : Holds (ap (Const.«instance») ([Const.«Farad», Const.«CompositeUnitOfMeasure»]))
axiom ax_1186 : Holds (ap (Const.«instance») ([Const.«Farad», Const.«SystemeInternationalUnit»]))
axiom ax_1187 : Holds (ap (Const.«instance») ([Const.«Ohm», Const.«CompositeUnitOfMeasure»]))
axiom ax_1188 : Holds (ap (Const.«instance») ([Const.«Ohm», Const.«SystemeInternationalUnit»]))
axiom ax_1189 : Holds (ap (Const.«instance») ([Const.«Siemens», Const.«CompositeUnitOfMeasure»]))
axiom ax_1190 : Holds (ap (Const.«instance») ([Const.«Siemens», Const.«SystemeInternationalUnit»]))
axiom ax_1191 : Holds (ap (Const.«instance») ([Const.«Weber», Const.«CompositeUnitOfMeasure»]))
axiom ax_1192 : Holds (ap (Const.«instance») ([Const.«Weber», Const.«SystemeInternationalUnit»]))
axiom ax_1193 : Holds (ap (Const.«instance») ([Const.«Tesla», Const.«CompositeUnitOfMeasure»]))
axiom ax_1194 : Holds (ap (Const.«instance») ([Const.«Tesla», Const.«SystemeInternationalUnit»]))
axiom ax_1195 : Holds (ap (Const.«instance») ([Const.«Henry», Const.«CompositeUnitOfMeasure»]))
axiom ax_1196 : Holds (ap (Const.«instance») ([Const.«Henry», Const.«SystemeInternationalUnit»]))
axiom ax_1197 : Holds (ap (Const.«instance») ([Const.«CelsiusDegree», Const.«UnitOfTemperature»]))
axiom ax_1198 : Holds (ap (Const.«instance») ([Const.«CelsiusDegree», Const.«SystemeInternationalUnit»]))
axiom ax_1199 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«CelsiusDegree»]), ap (Const.«MeasureFn») ([ap (Const.«SubtractionFn») ([«?NUMBER», numLit "273.15"]), Const.«KelvinDegree»])]))
axiom ax_1200 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«CelsiusDegree»]), ap (Const.«MeasureFn») ([ap (Const.«DivisionFn») ([ap (Const.«SubtractionFn») ([«?NUMBER», numLit "32.0"]), numLit "1.8"]), Const.«FahrenheitDegree»])]))
axiom ax_1201 : Holds (ap (Const.«instance») ([Const.«Lumen», Const.«CompositeUnitOfMeasure»]))
axiom ax_1202 : Holds (ap (Const.«instance») ([Const.«Lumen», Const.«SystemeInternationalUnit»]))
axiom ax_1203 : Holds (ap (Const.«instance») ([Const.«Lux», Const.«CompositeUnitOfMeasure»]))
axiom ax_1204 : Holds (ap (Const.«instance») ([Const.«Lux», Const.«SystemeInternationalUnit»]))
axiom ax_1205 : Holds (ap (Const.«instance») ([Const.«Becquerel», Const.«CompositeUnitOfMeasure»]))
axiom ax_1206 : Holds (ap (Const.«instance») ([Const.«Becquerel», Const.«SystemeInternationalUnit»]))
axiom ax_1207 : ∀ («?NUMBER» : Obj) («?QUANTITY» : Obj), Holds (mkImp (ap (Const.«equal») ([«?QUANTITY», ap (Const.«MeasureFn») ([«?NUMBER», Const.«Becquerel»])])) (ap (Const.«instance») ([«?QUANTITY», Const.«TimeDependentQuantity»])))
axiom ax_1208 : Holds (ap (Const.«instance») ([Const.«Gray», Const.«CompositeUnitOfMeasure»]))
axiom ax_1209 : Holds (ap (Const.«instance») ([Const.«Gray», Const.«SystemeInternationalUnit»]))
axiom ax_1210 : Holds (ap (Const.«instance») ([Const.«Sievert», Const.«CompositeUnitOfMeasure»]))
axiom ax_1211 : Holds (ap (Const.«instance») ([Const.«Sievert», Const.«SystemeInternationalUnit»]))
axiom ax_1212 : Holds (ap (Const.«instance») ([Const.«DayDuration», Const.«UnitOfDuration»]))
axiom ax_1213 : Holds (ap (Const.«instance») ([Const.«DayDuration», Const.«TimeDuration»]))
axiom ax_1214 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«DayDuration»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "24"]), Const.«HourDuration»])]))
axiom ax_1215 : Holds (ap (Const.«instance») ([Const.«HourDuration», Const.«UnitOfDuration»]))
axiom ax_1216 : Holds (ap (Const.«instance») ([Const.«HourDuration», Const.«TimeDuration»]))
axiom ax_1217 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«HourDuration»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "60"]), Const.«MinuteDuration»])]))
axiom ax_1218 : Holds (ap (Const.«instance») ([Const.«MinuteDuration», Const.«UnitOfDuration»]))
axiom ax_1219 : Holds (ap (Const.«instance») ([Const.«MinuteDuration», Const.«TimeDuration»]))
axiom ax_1220 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«MinuteDuration»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "60"]), Const.«SecondDuration»])]))
axiom ax_1221 : Holds (ap (Const.«instance») ([Const.«WeekDuration», Const.«UnitOfDuration»]))
axiom ax_1222 : Holds (ap (Const.«instance») ([Const.«WeekDuration», Const.«TimeDuration»]))
axiom ax_1223 : Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", Const.«WeekDuration»]), ap (Const.«MeasureFn») ([numLit "7", Const.«DayDuration»])]))
axiom ax_1224 : Holds (ap (Const.«instance») ([Const.«MonthDuration», Const.«UnitOfDuration»]))
axiom ax_1225 : Holds (ap (Const.«instance») ([Const.«MonthDuration», Const.«TimeDuration»]))
axiom ax_1226 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", Const.«MonthDuration»]), ap (Const.«MeasureFn») ([«?NUMBER», Const.«DayDuration»])])) (ap (Const.«greaterThanOrEqualTo») ([«?NUMBER», numLit "28"])))
axiom ax_1227 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", Const.«MonthDuration»]), ap (Const.«MeasureFn») ([«?NUMBER», Const.«DayDuration»])])) (ap (Const.«lessThanOrEqualTo») ([«?NUMBER», numLit "31"])))
axiom ax_1228 : Holds (ap (Const.«instance») ([Const.«YearDuration», Const.«UnitOfDuration»]))
axiom ax_1229 : Holds (ap (Const.«instance») ([Const.«YearDuration», Const.«TimeDuration»]))
axiom ax_1230 : Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([numLit "1", Const.«YearDuration»]), ap (Const.«MeasureFn») ([numLit "365", Const.«DayDuration»])]))
axiom ax_1231 : Holds (ap (Const.«instance») ([Const.«Amu», Const.«UnitOfMass»]))
axiom ax_1232 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Amu»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([numLit "1.6605402", numLit "1000000.0"]), numLit "1000000.0"]), numLit "1000000.0"]), numLit "1000000.0"])]), Const.«Gram»])]))
axiom ax_1233 : Holds (ap (Const.«instance») ([Const.«ElectronVolt», Const.«CompositeUnitOfMeasure»]))
axiom ax_1234 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«ElectronVolt»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([numLit "1.60217733", numLit "1000000.0"]), numLit "1000000.0"]), numLit "10000000.0"])]), Const.«Joule»])]))
axiom ax_1235 : Holds (ap (Const.«instance») ([Const.«Angstrom», Const.«UnitOfLength»]))
axiom ax_1236 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Angstrom»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», ap (Const.«DivisionFn») ([ap (Const.«DivisionFn») ([numLit "1.0", numLit "100000.0"]), numLit "100000.0"])]), Const.«Meter»])]))
axiom ax_1237 : Holds (ap (Const.«instance») ([Const.«FootLength», Const.«UnitOfLength»]))
axiom ax_1238 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«FootLength»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.3048"]), Const.«Meter»])]))
axiom ax_1239 : Holds (ap (Const.«instance») ([Const.«Inch», Const.«UnitOfLength»]))
axiom ax_1240 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Inch»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.0254"]), Const.«Meter»])]))
axiom ax_1241 : Holds (ap (Const.«instance») ([Const.«Mile», Const.«UnitOfLength»]))
axiom ax_1242 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Mile»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1609.344"]), Const.«Meter»])]))
axiom ax_1243 : Holds (ap (Const.«instance») ([Const.«UnitedStatesGallon», Const.«UnitOfVolume»]))
axiom ax_1244 : Holds (ap (Const.«relatedInternalConcept») ([Const.«UnitedStatesGallon», Const.«UnitedKingdomGallon»]))
axiom ax_1245 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«UnitedStatesGallon»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "3.785411784"]), Const.«Liter»])]))
axiom ax_1246 : Holds (ap (Const.«instance») ([Const.«Quart», Const.«UnitOfVolume»]))
axiom ax_1247 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Quart»]), ap (Const.«MeasureFn») ([ap (Const.«DivisionFn») ([«?NUMBER», numLit "4"]), Const.«UnitedStatesGallon»])]))
axiom ax_1248 : Holds (ap (Const.«instance») ([Const.«Pint», Const.«UnitOfVolume»]))
axiom ax_1249 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Pint»]), ap (Const.«MeasureFn») ([ap (Const.«DivisionFn») ([«?NUMBER», numLit "2"]), Const.«Quart»])]))
axiom ax_1250 : Holds (ap (Const.«instance») ([Const.«Cup», Const.«UnitOfVolume»]))
axiom ax_1251 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Cup»]), ap (Const.«MeasureFn») ([ap (Const.«DivisionFn») ([«?NUMBER», numLit "2"]), Const.«Pint»])]))
axiom ax_1252 : Holds (ap (Const.«instance») ([Const.«Ounce», Const.«UnitOfVolume»]))
axiom ax_1253 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Ounce»]), ap (Const.«MeasureFn») ([ap (Const.«DivisionFn») ([«?NUMBER», numLit "8"]), Const.«Cup»])]))
axiom ax_1254 : Holds (ap (Const.«instance») ([Const.«UnitedKingdomGallon», Const.«UnitOfVolume»]))
axiom ax_1255 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«UnitedKingdomGallon»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "4.54609"]), Const.«Liter»])]))
axiom ax_1256 : Holds (ap (Const.«instance») ([Const.«AtomGram», Const.«UnitOfMass»]))
axiom ax_1257 : Holds (ap (Const.«instance») ([Const.«Kilogram», Const.«SystemeInternationalUnit»]))
axiom ax_1258 : Holds (ap (Const.«instance») ([Const.«Kilogram», Const.«UnitOfMass»]))
axiom ax_1259 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Kilogram»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1000"]), Const.«Gram»])]))
axiom ax_1260 : Holds (ap (Const.«instance») ([Const.«weight», Const.«BinaryPredicate»]))
axiom ax_1261 : Holds (ap (Const.«subrelation») ([Const.«weight», Const.«measure»]))
axiom ax_1262 : Holds (ap (Const.«instance») ([Const.«PoundMass», Const.«UnitOfMass»]))
axiom ax_1263 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«PoundMass»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "453.59237"]), Const.«Gram»])]))
axiom ax_1264 : Holds (ap (Const.«instance») ([Const.«Slug», Const.«UnitOfMass»]))
axiom ax_1265 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Slug»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "14593.90"]), Const.«Gram»])]))
axiom ax_1266 : Holds (ap (Const.«instance») ([Const.«RankineDegree», Const.«UnitOfTemperature»]))
axiom ax_1267 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«RankineDegree»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1.8"]), Const.«KelvinDegree»])]))
axiom ax_1268 : Holds (ap (Const.«instance») ([Const.«FahrenheitDegree», Const.«UnitOfTemperature»]))
axiom ax_1269 : Holds (ap (Const.«instance») ([Const.«PoundForce», Const.«CompositeUnitOfMeasure»]))
axiom ax_1270 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«PoundForce»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "4.448222"]), Const.«Newton»])]))
axiom ax_1271 : Holds (ap (Const.«instance») ([Const.«Calorie», Const.«CompositeUnitOfMeasure»]))
axiom ax_1272 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Calorie»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "4.1868"]), Const.«Joule»])]))
axiom ax_1273 : Holds (ap (Const.«instance») ([Const.«BritishThermalUnit», Const.«CompositeUnitOfMeasure»]))
axiom ax_1274 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«BritishThermalUnit»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1055.05585262"]), Const.«Joule»])]))
axiom ax_1275 : Holds (ap (Const.«instance») ([Const.«AngularDegree», Const.«UnitOfAngularMeasure»]))
axiom ax_1276 : ∀ («?N» : Obj) («?QUANT» : Obj), Holds (mkImp (ap (Const.«equal») ([«?QUANT», ap (Const.«MeasureFn») ([«?N», Const.«AngularDegree»])])) (ap (Const.«instance») ([«?QUANT», Const.«PlaneAngleMeasure»])))
axiom ax_1277 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«AngularDegree»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», ap (Const.«DivisionFn») ([Const.«Pi», numLit "180.0"])]), Const.«Radian»])]))
axiom ax_1278 : ∀ («?ANGLE» : Obj) («?NUMBER» : Obj), Holds (mkImp (ap (Const.«measure») ([«?ANGLE», ap (Const.«MeasureFn») ([«?NUMBER», Const.«AngularDegree»])])) (mkAnd [ap (Const.«greaterThanOrEqualTo») ([«?NUMBER», numLit "0.0"]), ap (Const.«lessThanOrEqualTo») ([«?NUMBER», numLit "360.0"])]))
axiom ax_1279 : Holds (ap (Const.«instance») ([Const.«UnitedStatesDollar», Const.«UnitOfCurrency»]))
axiom ax_1280 : Holds (ap (Const.«instance») ([Const.«UnitedStatesCent», Const.«UnitOfCurrency»]))
axiom ax_1281 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«UnitedStatesCent»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.01"]), Const.«UnitedStatesDollar»])]))
axiom ax_1282 : Holds (ap (Const.«instance») ([Const.«EuroDollar», Const.«UnitOfCurrency»]))
axiom ax_1283 : Holds (ap (Const.«instance») ([Const.«EuroCent», Const.«UnitOfCurrency»]))
axiom ax_1284 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«EuroCent»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "0.01"]), Const.«EuroDollar»])]))
axiom ax_1285 : Holds (ap (Const.«subclass») ([Const.«InformationMeasure», Const.«ConstantQuantity»]))
axiom ax_1286 : Holds (ap (Const.«instance») ([Const.«Bit», Const.«UnitOfInformation»]))
axiom ax_1287 : Holds (ap (Const.«instance») ([Const.«Byte», Const.«UnitOfInformation»]))
axiom ax_1288 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«Byte»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "8"]), Const.«Bit»])]))
axiom ax_1289 : Holds (ap (Const.«instance») ([Const.«KiloByte», Const.«UnitOfInformation»]))
axiom ax_1290 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«KiloByte»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1024"]), Const.«Byte»])]))
axiom ax_1291 : Holds (ap (Const.«instance») ([Const.«MegaByte», Const.«UnitOfInformation»]))
axiom ax_1292 : ∀ («?NUMBER» : Obj), Holds (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«MegaByte»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "1024"]), Const.«KiloByte»])]))
axiom ax_1293 : Holds (ap (Const.«subclass») ([Const.«SoundPressureLevelUnit», Const.«UnitOfMeasure»]))
axiom ax_1294 : Holds (ap (Const.«instance») ([Const.«Decibel», Const.«SoundPressureLevelUnit»]))
axiom ax_1295 : Holds (ap (Const.«instance») ([Const.«DecibelA», Const.«SoundPressureLevelUnit»]))
axiom ax_1296 : Holds (ap (Const.«instance») ([Const.«measure», Const.«BinaryPredicate»]))
axiom ax_1297 : Holds (ap (Const.«instance») ([Const.«measure», Const.«AsymmetricRelation»]))
axiom ax_1298 : ∀ («?P» : Obj) («?Q» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?P», Const.«Process»]), ap (Const.«measure») ([«?P», «?Q»])]) (ap (Const.«instance») ([«?Q», Const.«TimeDependentQuantity»])))
axiom ax_1299 : Holds (ap (Const.«instance») ([Const.«age», Const.«SingleValuedRelation»]))
axiom ax_1300 : Holds (ap (Const.«subrelation») ([Const.«age», Const.«measure»]))
axiom ax_1301 : Holds (ap (Const.«instance») ([Const.«age», Const.«BinaryPredicate»]))
axiom ax_1302 : ∀ («?DURATION» : Obj) («?OBJ» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TIME», Const.«TimePoint»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«age») ([«?OBJ», «?DURATION»])])]) (ap (Const.«duration») ([ap (Const.«TimeIntervalFn») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?OBJ»])]), «?TIME»]), «?DURATION»])))
axiom ax_1303 : Holds (ap (Const.«subrelation») ([Const.«linearExtent», Const.«measure»]))
axiom ax_1304 : Holds (ap (Const.«instance») ([Const.«linearExtent», Const.«BinaryPredicate»]))
axiom ax_1305 : Holds (ap (Const.«instance») ([Const.«width», Const.«SingleValuedRelation»]))
axiom ax_1306 : Holds (ap (Const.«instance») ([Const.«width», Const.«BinaryPredicate»]))
axiom ax_1307 : Holds (ap (Const.«subrelation») ([Const.«width», Const.«linearExtent»]))
axiom ax_1308 : Holds (ap (Const.«subrelation») ([Const.«height», Const.«linearExtent»]))
axiom ax_1309 : Holds (ap (Const.«instance») ([Const.«height», Const.«BinaryPredicate»]))
axiom ax_1310 : Holds (ap (Const.«instance») ([Const.«length», Const.«SingleValuedRelation»]))
axiom ax_1311 : Holds (ap (Const.«subrelation») ([Const.«length», Const.«linearExtent»]))
axiom ax_1312 : Holds (ap (Const.«instance») ([Const.«length», Const.«BinaryPredicate»]))
axiom ax_1313 : ∀ («?M» : Obj) («?O» : Obj) («?U» : Obj), Holds (mkImp (ap (Const.«length») ([«?O», ap (Const.«MeasureFn») ([«?M», «?U»])])) (mkNot (mkExists (fun («?M2» : Obj) => mkAnd [ap (Const.«linearExtent») ([«?O», ap (Const.«MeasureFn») ([«?M2», «?U»])]), ap (Const.«greaterThan») ([«?M2», «?M»])]))))
axiom ax_1314 : Holds (ap (Const.«instance») ([Const.«AmountsFn», Const.«TernaryFunction»]))
axiom ax_1315 : Holds (ap (Const.«instance») ([Const.«amount», Const.«TernaryPredicate»]))
axiom ax_1316 : ∀ («?CO» : Obj) («?N» : Obj) («?N2» : Obj) («?S» : Obj) («?SI» : Obj) («?U» : Obj), Holds (mkImp (mkAnd [ap (Const.«amount») ([«?S», «?CO», ap (Const.«MeasureFn») ([«?N», «?U»])]), ap (Const.«instance») ([«?SI», «?S»]), ap (Const.«measure») ([«?SI», ap (Const.«MeasureFn») ([«?N2», «?U»])]), ap (Const.«part») ([«?SI», «?CO»])]) (mkExists (fun («?L» : Obj) => mkAnd [ap (Const.«inList») ([ap (Const.«MeasureFn») ([«?N2», «?U»]), «?L»]), ap (Const.«equal») ([«?L», ap (Const.«AmountsFn») ([«?S», «?CO», «?U»])]), ap (Const.«equal») ([«?N», ap (Const.«ListSumFn») ([«?L»])])])))
axiom ax_1317 : Holds (ap (Const.«instance») ([Const.«shape», Const.«BinaryPredicate»]))
axiom ax_1318 : Holds (ap (Const.«subrelation») ([Const.«shape», Const.«property»]))
axiom ax_1319 : ∀ («?OBJ» : Obj) («?SHAPE» : Obj), Holds (mkImp (mkAnd [ap (Const.«property») ([«?OBJ», «?SHAPE»]), ap (Const.«instance») ([«?OBJ», Const.«Physical»]), ap (Const.«instance») ([«?SHAPE», Const.«ShapeAttribute»])]) (ap (Const.«shape») ([«?OBJ», «?SHAPE»])))
axiom ax_1320 : Holds (ap (Const.«instance») ([Const.«Oval», Const.«ClosedTwoDimensionalFigure»]))
axiom ax_1321 : Holds (ap (Const.«subAttribute») ([Const.«Circle», Const.«Oval»]))
axiom ax_1322 : ∀ («?C» : Obj), Holds (mkImp (ap (Const.«equal») ([«?C», Const.«Circle»])) (mkExists (fun («?R» : Obj) => ap (Const.«radius») ([«?C», «?R»]))))
axiom ax_1323 : ∀ («?C» : Obj), Holds (mkImp (ap (Const.«equal») ([«?C», Const.«Circle»])) (mkExists (fun («?P» : Obj) => ap (Const.«equal») ([ap (Const.«CenterOfCircleFn») ([«?C»]), «?P»]))))
axiom ax_1324 : Holds (ap (Const.«instance») ([Const.«CenterOfCircleFn», Const.«UnaryFunction»]))
axiom ax_1325 : Holds (ap (Const.«instance») ([Const.«CenterOfCircleFn», Const.«TotalValuedRelation»]))
axiom ax_1326 : ∀ («?C» : Obj) («?P» : Obj), Holds (mkImp (ap (Const.«equal») ([«?P», ap (Const.«CenterOfCircleFn») ([«?C»])])) (ap (Const.«equal») ([«?C», Const.«Circle»])))
axiom ax_1327 : Holds (ap (Const.«instance») ([Const.«radius», Const.«BinaryPredicate»]))
axiom ax_1328 : Holds (ap (Const.«instance») ([Const.«radius», Const.«SingleValuedRelation»]))
axiom ax_1329 : Holds (ap (Const.«instance») ([Const.«radius», Const.«TotalValuedRelation»]))
axiom ax_1330 : ∀ («?CIRCLE» : Obj) («?RADIUS» : Obj), Holds (mkImp (ap (Const.«radius») ([«?CIRCLE», «?RADIUS»])) (mkExists (fun («?POINT» : Obj) => mkForall (fun («?PART» : Obj) => mkImp (ap (Const.«pointOfFigure») ([«?PART», «?CIRCLE»])) (ap (Const.«geometricDistance») ([«?PART», «?POINT», «?RADIUS»]))))))
axiom ax_1331 : ∀ («?CIRCLE» : Obj) («?RADIUS» : Obj), Holds (mkImp (ap (Const.«radius») ([«?CIRCLE», «?RADIUS»])) (ap (Const.«equal») ([«?CIRCLE», Const.«Circle»])))
axiom ax_1332 : Holds (ap (Const.«instance») ([Const.«diameter», Const.«BinaryPredicate»]))
axiom ax_1333 : Holds (ap (Const.«instance») ([Const.«diameter», Const.«SingleValuedRelation»]))
axiom ax_1334 : Holds (ap (Const.«instance») ([Const.«diameter», Const.«TotalValuedRelation»]))
axiom ax_1335 : ∀ («?CIRCLE» : Obj) («?LENGTH» : Obj), Holds (mkImp (ap (Const.«diameter») ([«?CIRCLE», «?LENGTH»])) (mkExists (fun («?NHALF» : Obj) => mkExists (fun («?UHALF» : Obj) => mkAnd [ap (Const.«radius») ([«?CIRCLE», ap (Const.«MeasureFn») ([«?NHALF», «?UHALF»])]), ap (Const.«equal») ([ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NHALF», numLit "2"]), «?UHALF»]), «?LENGTH»])]))))
axiom ax_1336 : ∀ («?CIRCLE» : Obj) («?LENGTH» : Obj), Holds (mkImp (ap (Const.«diameter») ([«?CIRCLE», «?LENGTH»])) (ap (Const.«equal») ([«?CIRCLE», Const.«Circle»])))
axiom ax_1337 : Holds (ap (Const.«instance») ([Const.«distance», Const.«SingleValuedRelation»]))
axiom ax_1338 : Holds (ap (Const.«instance») ([Const.«distance», Const.«SpatialRelation»]))
axiom ax_1339 : Holds (ap (Const.«instance») ([Const.«distance», Const.«TernaryPredicate»]))
axiom ax_1340 : Holds (ap (Const.«instance») ([Const.«distance», Const.«TotalValuedRelation»]))
axiom ax_1341 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?QUANT» : Obj), Holds (mkImp (ap (Const.«distance») ([«?OBJ1», «?OBJ2», «?QUANT»])) (ap (Const.«distance») ([«?OBJ2», «?OBJ1», «?QUANT»])))
axiom ax_1342 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?Q» : Obj), Holds (mkImp (ap (Const.«altitude») ([«?OBJ1», «?OBJ2», «?Q»])) (ap (Const.«distance») ([«?OBJ1», «?OBJ2», «?Q»])))
axiom ax_1343 : Holds (ap (Const.«instance») ([Const.«altitude», Const.«SingleValuedRelation»]))
axiom ax_1344 : Holds (ap (Const.«instance») ([Const.«altitude», Const.«TernaryPredicate»]))
axiom ax_1345 : Holds (ap (Const.«instance») ([Const.«altitude», Const.«PartialValuedRelation»]))
axiom ax_1346 : ∀ («?HEIGHT» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«altitude») ([«?OBJ1», «?OBJ2», «?HEIGHT»])) (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Above»])))
axiom ax_1347 : ∀ («?HEIGHT» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«altitude») ([«?OBJ1», «?OBJ2», «?HEIGHT»])) (mkExists (fun («?TOP» : Obj) => mkAnd [ap (Const.«top») ([«?TOP», «?OBJ1»]), ap (Const.«distance») ([«?TOP», «?OBJ2», «?HEIGHT»])])))
axiom ax_1348 : Holds (ap (Const.«subrelation») ([Const.«depth», Const.«distance»]))
axiom ax_1349 : Holds (ap (Const.«instance») ([Const.«depth», Const.«SingleValuedRelation»]))
axiom ax_1350 : Holds (ap (Const.«instance») ([Const.«depth», Const.«TernaryPredicate»]))
axiom ax_1351 : ∀ («?DEPTH» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«depth») ([«?OBJ1», «?OBJ2», «?DEPTH»])) (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Below»])))
axiom ax_1352 : ∀ («?DEPTH» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«depth») ([«?OBJ1», «?OBJ2», «?DEPTH»])) (mkExists (fun («?BOTTOM» : Obj) => mkAnd [ap (Const.«bottom») ([«?BOTTOM», «?OBJ1»]), ap (Const.«distance») ([«?BOTTOM», «?OBJ2», «?DEPTH»])])))
axiom ax_1353 : Holds (ap (Const.«instance») ([Const.«larger», Const.«BinaryPredicate»]))
axiom ax_1354 : Holds (ap (Const.«instance») ([Const.«larger», Const.«SpatialRelation»]))
axiom ax_1355 : Holds (ap (Const.«instance») ([Const.«larger», Const.«TransitiveRelation»]))
axiom ax_1356 : Holds (ap (Const.«instance») ([Const.«larger», Const.«IrreflexiveRelation»]))
axiom ax_1357 : Holds (ap (Const.«instance») ([Const.«larger», Const.«TotalValuedRelation»]))
axiom ax_1358 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«larger») ([«?OBJ1», «?OBJ2»])) (mkForall (fun («?QUANT1» : Obj) => mkForall (fun («?QUANT2» : Obj) => mkForall (fun («?UNIT» : Obj) => mkImp (mkAnd [ap (Const.«measure») ([«?OBJ1», ap (Const.«MeasureFn») ([«?QUANT1», «?UNIT»])]), ap (Const.«measure») ([«?OBJ2», ap (Const.«MeasureFn») ([«?QUANT2», «?UNIT»])]), ap (Const.«instance») ([«?UNIT», Const.«UnitOfLength»])]) (ap (Const.«greaterThan») ([«?QUANT1», «?QUANT2»])))))))
axiom ax_1359 : Holds (ap (Const.«instance») ([Const.«smaller», Const.«BinaryPredicate»]))
axiom ax_1360 : Holds (ap (Const.«instance») ([Const.«smaller», Const.«SpatialRelation»]))
axiom ax_1361 : Holds (ap (Const.«instance») ([Const.«smaller», Const.«TotalValuedRelation»]))
axiom ax_1362 : Holds (ap (Const.«instance») ([Const.«smaller», Const.«TransitiveRelation»]))
axiom ax_1363 : Holds (ap (Const.«instance») ([Const.«smaller», Const.«IrreflexiveRelation»]))
axiom ax_1364 : Holds (ap (Const.«inverse») ([Const.«smaller», Const.«larger»]))
axiom ax_1365 : Holds (ap (Const.«instance») ([Const.«monetaryValue», Const.«SingleValuedRelation»]))
axiom ax_1366 : Holds (ap (Const.«instance») ([Const.«monetaryValue», Const.«AsymmetricRelation»]))
axiom ax_1367 : Holds (ap (Const.«instance») ([Const.«monetaryValue», Const.«BinaryPredicate»]))
axiom ax_1368 : Holds (ap (Const.«instance») ([Const.«WealthFn», Const.«UnaryFunction»]))
axiom ax_1369 : Holds (ap (Const.«instance») ([Const.«WealthFn», Const.«TotalValuedRelation»]))
axiom ax_1370 : ∀ («?AMOUNT» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«WealthFn») ([«?PERSON»]), «?AMOUNT»])) (ap (Const.«monetaryValue») ([ap (Const.«PropertyFn») ([«?PERSON»]), «?AMOUNT»])))
axiom ax_1371 : ∀ («?AMOUNT» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«monetaryValue») ([ap (Const.«PropertyFn») ([«?PERSON»]), «?AMOUNT»])) (ap (Const.«equal») ([ap (Const.«WealthFn») ([«?PERSON»]), «?AMOUNT»])))
axiom ax_1372 : Holds (ap (Const.«instance») ([Const.«barometricPressure», Const.«BinaryPredicate»]))
axiom ax_1373 : Holds (ap (Const.«instance») ([Const.«barometricPressure», Const.«AsymmetricRelation»]))
axiom ax_1374 : Holds (ap (Const.«subrelation») ([Const.«barometricPressure», Const.«measure»]))
axiom ax_1375 : Holds (ap (Const.«subclass») ([Const.«UnitOfAtmosphericPressure», Const.«CompositeUnitOfMeasure»]))
axiom ax_1376 : Holds (ap (Const.«instance») ([Const.«InchMercury», Const.«UnitOfAtmosphericPressure»]))
axiom ax_1377 : Holds (ap (Const.«instance») ([Const.«MmMercury», Const.«UnitOfAtmosphericPressure»]))
axiom ax_1378 : Holds (ap (Const.«instance») ([Const.«PositiveInfinity», Const.«TimePoint»]))
axiom ax_1379 : ∀ («?POINT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT», Const.«TimePoint»]), mkNot (ap (Const.«equal») ([«?POINT», Const.«PositiveInfinity»]))]) (ap (Const.«before») ([«?POINT», Const.«PositiveInfinity»])))
axiom ax_1380 : ∀ («?POINT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT», Const.«TimePoint»]), mkNot (ap (Const.«equal») ([«?POINT», Const.«PositiveInfinity»]))]) (mkExists (fun («?OTHERPOINT» : Obj) => ap (Const.«temporallyBetween») ([«?POINT», «?OTHERPOINT», Const.«PositiveInfinity»]))))
axiom ax_1381 : Holds (ap (Const.«instance») ([Const.«NegativeInfinity», Const.«TimePoint»]))
axiom ax_1382 : ∀ («?POINT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT», Const.«TimePoint»]), mkNot (ap (Const.«equal») ([«?POINT», Const.«NegativeInfinity»]))]) (ap (Const.«before») ([Const.«NegativeInfinity», «?POINT»])))
axiom ax_1383 : ∀ («?POINT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT», Const.«TimePoint»]), mkNot (ap (Const.«equal») ([«?POINT», Const.«NegativeInfinity»]))]) (mkExists (fun («?OTHERPOINT» : Obj) => ap (Const.«temporallyBetween») ([Const.«NegativeInfinity», «?OTHERPOINT», «?POINT»]))))
axiom ax_1384 : Holds (ap (Const.«instance») ([Const.«duration», Const.«BinaryPredicate»]))
axiom ax_1385 : Holds (ap (Const.«instance») ([Const.«duration», Const.«TotalValuedRelation»]))
axiom ax_1386 : Holds (ap (Const.«instance») ([Const.«frequency», Const.«BinaryPredicate»]))
axiom ax_1387 : ∀ («?PROC» : Obj) («?TIME1» : Obj), Holds (mkImp (ap (Const.«frequency») ([«?PROC», «?TIME1»])) (mkForall (fun («?TIME2» : Obj) => mkImp (ap (Const.«duration») ([«?TIME2», «?TIME1»])) (mkExists (fun («?POSITION» : Obj) => mkAnd [ap (Const.«temporalPart») ([«?POSITION», «?TIME2»]), ap (Const.«holdsDuring») ([«?POSITION», mkExists (fun («?INST» : Obj) => ap (Const.«instance») ([«?INST», «?PROC»]))])])))))
axiom ax_1388 : Holds (ap (Const.«instance») ([Const.«temporalPart», Const.«BinaryPredicate»]))
axiom ax_1389 : Holds (ap (Const.«instance») ([Const.«temporalPart», Const.«TemporalRelation»]))
axiom ax_1390 : Holds (ap (Const.«instance») ([Const.«temporalPart», Const.«PartialOrderingRelation»]))
axiom ax_1391 : ∀ («?POINT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?POINT», Const.«TimePoint»])) (mkExists (fun («?INTERVAL» : Obj) => mkAnd [ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»]), ap (Const.«temporalPart») ([«?POINT», «?INTERVAL»])])))
axiom ax_1392 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (mkExists (fun («?POINT» : Obj) => mkAnd [ap (Const.«instance») ([«?POINT», Const.«TimePoint»]), ap (Const.«temporalPart») ([«?POINT», «?INTERVAL»])])))
axiom ax_1393 : ∀ («?SITUATION» : Obj) («?TIME1» : Obj) («?TIME2» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME1», «?SITUATION»]), ap (Const.«temporalPart») ([«?TIME2», «?TIME1»])]) (ap (Const.«holdsDuring») ([«?TIME2», «?SITUATION»])))
axiom ax_1394 : ∀ («?INST1» : Obj) («?INST2» : Obj) («?INTERVAL» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?INTERVAL», ap («?REL») ([«?INST1», «?INST2»])]), ap (Const.«instance») ([«?INST1», Const.«Physical»]), ap (Const.«instance») ([«?INST2», Const.«Physical»])]) (mkAnd [ap (Const.«time») ([«?INST1», «?INTERVAL»]), ap (Const.«time») ([«?INST2», «?INTERVAL»])]))
axiom ax_1395 : ∀ («?POS» : Obj) («?THING» : Obj), Holds (mkImp (ap (Const.«temporalPart») ([«?POS», ap (Const.«WhenFn») ([«?THING»])])) (ap (Const.«time») ([«?THING», «?POS»])))
axiom ax_1396 : ∀ («?POS» : Obj) («?THING» : Obj), Holds (mkImp (ap (Const.«time») ([«?THING», «?POS»])) (ap (Const.«temporalPart») ([«?POS», ap (Const.«WhenFn») ([«?THING»])])))
axiom ax_1397 : Holds (ap (Const.«instance») ([Const.«BeginFn», Const.«TemporalRelation»]))
axiom ax_1398 : Holds (ap (Const.«instance») ([Const.«BeginFn», Const.«UnaryFunction»]))
axiom ax_1399 : Holds (ap (Const.«instance») ([Const.«BeginFn», Const.«TotalValuedRelation»]))
axiom ax_1400 : ∀ («?OBJ» : Obj) («?PROCESS» : Obj), Holds (mkImp (ap (Const.«origin») ([«?PROCESS», «?OBJ»])) (ap (Const.«eventLocated») ([ap (Const.«WhereFn») ([«?PROCESS», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]), ap (Const.«WhereFn») ([«?OBJ», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?OBJ»])])])])))
axiom ax_1401 : ∀ («?INTERVAL» : Obj) («?POINT» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«BeginFn») ([«?INTERVAL»]), «?POINT»])) (mkForall (fun («?OTHERPOINT» : Obj) => mkImp (mkAnd [ap (Const.«temporalPart») ([«?OTHERPOINT», «?INTERVAL»]), mkNot (ap (Const.«equal») ([«?OTHERPOINT», «?POINT»]))]) (ap (Const.«before») ([«?POINT», «?OTHERPOINT»])))))
axiom ax_1402 : Holds (ap (Const.«instance») ([Const.«EndFn», Const.«TemporalRelation»]))
axiom ax_1403 : Holds (ap (Const.«instance») ([Const.«EndFn», Const.«UnaryFunction»]))
axiom ax_1404 : Holds (ap (Const.«instance») ([Const.«EndFn», Const.«TotalValuedRelation»]))
axiom ax_1405 : ∀ («?INTERVAL» : Obj) («?POINT» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL»]), «?POINT»])) (mkForall (fun («?OTHERPOINT» : Obj) => mkImp (mkAnd [ap (Const.«temporalPart») ([«?OTHERPOINT», «?INTERVAL»]), mkNot (ap (Const.«equal») ([«?OTHERPOINT», «?POINT»]))]) (ap (Const.«before») ([«?OTHERPOINT», «?POINT»])))))
axiom ax_1406 : ∀ («?OBJ» : Obj) («?PROC» : Obj) («?QUANT1» : Obj) («?QUANT2» : Obj), Holds (mkImp (mkAnd [ap (Const.«resource») ([«?PROC», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROC»])]), ap (Const.«measure») ([«?OBJ», «?QUANT1»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROC»])]), ap (Const.«measure») ([«?OBJ», «?QUANT2»])])]) (ap (Const.«greaterThan») ([«?QUANT1», «?QUANT2»])))
axiom ax_1407 : Holds (ap (Const.«subrelation») ([Const.«starts», Const.«temporalPart»]))
axiom ax_1408 : Holds (ap (Const.«instance») ([Const.«starts», Const.«TemporalRelation»]))
axiom ax_1409 : Holds (ap (Const.«instance») ([Const.«starts», Const.«TransitiveRelation»]))
axiom ax_1410 : Holds (ap (Const.«instance») ([Const.«starts», Const.«IrreflexiveRelation»]))
axiom ax_1411 : Holds (ap (Const.«instance») ([Const.«starts», Const.«TotalValuedRelation»]))
axiom ax_1412 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«starts») ([«?INTERVAL1», «?INTERVAL2»])) (mkAnd [ap (Const.«equal») ([ap (Const.«BeginFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])]), ap (Const.«before») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])])]))
axiom ax_1413 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«BeginFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])]), ap (Const.«before») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])])]) (ap (Const.«starts») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1414 : Holds (ap (Const.«subrelation») ([Const.«finishes», Const.«temporalPart»]))
axiom ax_1415 : Holds (ap (Const.«instance») ([Const.«finishes», Const.«TemporalRelation»]))
axiom ax_1416 : Holds (ap (Const.«instance») ([Const.«finishes», Const.«TransitiveRelation»]))
axiom ax_1417 : Holds (ap (Const.«instance») ([Const.«finishes», Const.«IrreflexiveRelation»]))
axiom ax_1418 : Holds (ap (Const.«instance») ([Const.«finishes», Const.«TotalValuedRelation»]))
axiom ax_1419 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«finishes») ([«?INTERVAL1», «?INTERVAL2»])) (mkAnd [ap (Const.«before») ([ap (Const.«BeginFn») ([«?INTERVAL2»]), ap (Const.«BeginFn») ([«?INTERVAL1»])]), ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL2»]), ap (Const.«EndFn») ([«?INTERVAL1»])])]))
axiom ax_1420 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«before») ([ap (Const.«BeginFn») ([«?INTERVAL2»]), ap (Const.«BeginFn») ([«?INTERVAL1»])]), ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL2»]), ap (Const.«EndFn») ([«?INTERVAL1»])])]) (ap (Const.«finishes») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1421 : Holds (ap (Const.«instance») ([Const.«finishesDuring», Const.«BinaryPredicate»]))
axiom ax_1422 : Holds (ap (Const.«instance») ([Const.«finishesDuring», Const.«IrreflexiveRelation»]))
axiom ax_1423 : Holds (ap (Const.«instance») ([Const.«finishesDuring», Const.«TemporalRelation»]))
axiom ax_1424 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«finishesDuring») ([«?INTERVAL1», «?INTERVAL2»])) (ap (Const.«temporallyBetween») ([ap (Const.«BeginFn») ([«?INTERVAL2»]), ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])])))
axiom ax_1425 : Holds (ap (Const.«instance») ([Const.«startsDuring», Const.«BinaryPredicate»]))
axiom ax_1426 : Holds (ap (Const.«instance») ([Const.«startsDuring», Const.«IrreflexiveRelation»]))
axiom ax_1427 : Holds (ap (Const.«instance») ([Const.«startsDuring», Const.«TemporalRelation»]))
axiom ax_1428 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«startsDuring») ([«?INTERVAL1», «?INTERVAL2»])) (ap (Const.«temporallyBetween») ([ap (Const.«BeginFn») ([«?INTERVAL2»]), ap (Const.«BeginFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])])))
axiom ax_1429 : Holds (ap (Const.«instance») ([Const.«before», Const.«TemporalRelation»]))
axiom ax_1430 : Holds (ap (Const.«instance») ([Const.«before», Const.«IrreflexiveRelation»]))
axiom ax_1431 : Holds (ap (Const.«instance») ([Const.«before», Const.«TransitiveRelation»]))
axiom ax_1432 : Holds (ap (Const.«subrelation») ([Const.«before», Const.«beforeOrEqual»]))
axiom ax_1433 : Holds (ap (Const.«relatedInternalConcept») ([Const.«before», Const.«earlier»]))
axiom ax_1434 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«Object»])) (mkExists (fun («?TIME1» : Obj) => mkExists (fun («?TIME2» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME1», Const.«TimePoint»]), ap (Const.«instance») ([«?TIME2», Const.«TimePoint»]), ap (Const.«before») ([«?TIME1», «?TIME2»]), mkForall (fun («?TIME» : Obj) => mkImp (mkAnd [ap (Const.«beforeOrEqual») ([«?TIME1», «?TIME»]), ap (Const.«beforeOrEqual») ([«?TIME», «?TIME2»])]) (ap (Const.«time») ([«?OBJ», «?TIME»])))]))))
axiom ax_1435 : ∀ («?OBJ» : Obj) («?PROC» : Obj), Holds (mkImp (ap (Const.«result») ([«?PROC», «?OBJ»])) (mkForall (fun («?TIME» : Obj) => mkImp (ap (Const.«before») ([«?TIME», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROC»])])])) (mkNot (ap (Const.«time») ([«?OBJ», «?TIME»]))))))
axiom ax_1436 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«before») ([ap (Const.«BeginFn») ([«?INTERVAL»]), ap (Const.«EndFn») ([«?INTERVAL»])])))
axiom ax_1437 : Holds (ap (Const.«instance») ([Const.«beforeOrEqual», Const.«BinaryPredicate»]))
axiom ax_1438 : Holds (ap (Const.«instance») ([Const.«beforeOrEqual», Const.«TemporalRelation»]))
axiom ax_1439 : Holds (ap (Const.«instance») ([Const.«beforeOrEqual», Const.«PartialOrderingRelation»]))
axiom ax_1440 : ∀ («?POINT1» : Obj) («?POINT2» : Obj), Holds (mkImp (ap (Const.«beforeOrEqual») ([«?POINT1», «?POINT2»])) (mkOr [ap (Const.«before») ([«?POINT1», «?POINT2»]), ap (Const.«equal») ([«?POINT1», «?POINT2»])]))
axiom ax_1441 : ∀ («?POINT1» : Obj) («?POINT2» : Obj), Holds (mkImp (mkOr [ap (Const.«before») ([«?POINT1», «?POINT2»]), ap (Const.«equal») ([«?POINT1», «?POINT2»])]) (ap (Const.«beforeOrEqual») ([«?POINT1», «?POINT2»])))
axiom ax_1442 : Holds (ap (Const.«instance») ([Const.«temporallyBetween», Const.«TemporalRelation»]))
axiom ax_1443 : Holds (ap (Const.«instance») ([Const.«temporallyBetween», Const.«TernaryPredicate»]))
axiom ax_1444 : Holds (ap (Const.«instance») ([Const.«temporallyBetween», Const.«PartialValuedRelation»]))
axiom ax_1445 : Holds (ap (Const.«subrelation») ([Const.«temporallyBetween», Const.«temporallyBetweenOrEqual»]))
axiom ax_1446 : ∀ («?POINT1» : Obj) («?POINT2» : Obj) («?POINT3» : Obj), Holds (mkImp (ap (Const.«temporallyBetween») ([«?POINT1», «?POINT2», «?POINT3»])) (mkAnd [ap (Const.«before») ([«?POINT1», «?POINT2»]), ap (Const.«before») ([«?POINT2», «?POINT3»])]))
axiom ax_1447 : ∀ («?POINT1» : Obj) («?POINT2» : Obj) («?POINT3» : Obj), Holds (mkImp (mkAnd [ap (Const.«before») ([«?POINT1», «?POINT2»]), ap (Const.«before») ([«?POINT2», «?POINT3»])]) (ap (Const.«temporallyBetween») ([«?POINT1», «?POINT2», «?POINT3»])))
axiom ax_1448 : Holds (ap (Const.«instance») ([Const.«temporallyBetweenOrEqual», Const.«TemporalRelation»]))
axiom ax_1449 : Holds (ap (Const.«instance») ([Const.«temporallyBetweenOrEqual», Const.«TernaryPredicate»]))
axiom ax_1450 : Holds (ap (Const.«instance») ([Const.«temporallyBetweenOrEqual», Const.«PartialValuedRelation»]))
axiom ax_1451 : ∀ («?POINT1» : Obj) («?POINT2» : Obj) («?POINT3» : Obj), Holds (mkImp (ap (Const.«temporallyBetweenOrEqual») ([«?POINT1», «?POINT2», «?POINT3»])) (mkAnd [ap (Const.«beforeOrEqual») ([«?POINT1», «?POINT2»]), ap (Const.«beforeOrEqual») ([«?POINT2», «?POINT3»])]))
axiom ax_1452 : ∀ («?POINT1» : Obj) («?POINT2» : Obj) («?POINT3» : Obj), Holds (mkImp (mkAnd [ap (Const.«beforeOrEqual») ([«?POINT1», «?POINT2»]), ap (Const.«beforeOrEqual») ([«?POINT2», «?POINT3»])]) (ap (Const.«temporallyBetweenOrEqual») ([«?POINT1», «?POINT2», «?POINT3»])))
axiom ax_1453 : ∀ («?PHYS» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«time») ([«?PHYS», «?TIME»]), ap (Const.«instance») ([«?TIME», Const.«TimePoint»])]) (ap (Const.«temporallyBetweenOrEqual») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PHYS»])]), «?TIME», ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PHYS»])])])))
axiom ax_1454 : ∀ («?PHYS» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«temporallyBetweenOrEqual») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PHYS»])]), «?TIME», ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PHYS»])])])) (mkAnd [ap (Const.«time») ([«?PHYS», «?TIME»]), ap (Const.«instance») ([«?TIME», Const.«TimePoint»])]))
axiom ax_1455 : Holds (ap (Const.«instance») ([Const.«overlapsTemporally», Const.«BinaryPredicate»]))
axiom ax_1456 : Holds (ap (Const.«instance») ([Const.«overlapsTemporally», Const.«TemporalRelation»]))
axiom ax_1457 : Holds (ap (Const.«instance») ([Const.«overlapsTemporally», Const.«ReflexiveRelation»]))
axiom ax_1458 : Holds (ap (Const.«instance») ([Const.«overlapsTemporally», Const.«SymmetricRelation»]))
axiom ax_1459 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«overlapsTemporally») ([«?INTERVAL1», «?INTERVAL2»])) (mkExists (fun («?INTERVAL3» : Obj) => mkAnd [ap (Const.«instance») ([«?INTERVAL3», Const.«TimeInterval»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL1»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL2»])])))
axiom ax_1460 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj) («?INTERVAL3» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INTERVAL3», Const.«TimeInterval»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL1»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL2»])]) (ap (Const.«overlapsTemporally») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1461 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«BinaryPredicate»]), ap (Const.«instance») ([«?REL», Const.«SpatialRelation»]), ap (Const.«instance») ([«?OBJ1», Const.«Physical»]), ap (Const.«instance») ([«?OBJ2», Const.«Physical»]), ap («?REL») ([«?OBJ1», «?OBJ2»])]) (ap (Const.«overlapsTemporally») ([ap (Const.«WhenFn») ([«?OBJ1»]), ap (Const.«WhenFn») ([«?OBJ2»])])))
axiom ax_1462 : ∀ («?BIG» : Obj) («?SMALL» : Obj), Holds (mkImp (ap (Const.«during») ([«?SMALL», «?BIG»])) (ap (Const.«temporalPart») ([«?SMALL», «?BIG»])))
axiom ax_1463 : ∀ («?E» : Obj) («?S» : Obj) («?TI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TI», Const.«TimeInterval»]), ap (Const.«equal») ([«?S», ap (Const.«BeginFn») ([«?TI»])]), ap (Const.«equal») ([«?E», ap (Const.«EndFn») ([«?TI»])])]) (ap (Const.«before») ([«?S», «?E»])))
axiom ax_1464 : ∀ («?TI1» : Obj) («?TI2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TI1», Const.«TimeInterval»]), ap (Const.«instance») ([«?TI2», Const.«TimeInterval»]), ap (Const.«beforeOrEqual») ([ap (Const.«BeginFn») ([«?TI2»]), ap (Const.«BeginFn») ([«?TI1»])]), ap (Const.«before») ([ap (Const.«BeginFn») ([«?TI1»]), ap (Const.«EndFn») ([«?TI2»])])]) (ap (Const.«overlapsTemporally») ([«?TI2», «?TI1»])))
axiom ax_1465 : ∀ («?P1» : Obj) («?P2» : Obj) («?TI1» : Obj) («?TI2» : Obj), Holds (mkImp (mkAnd [ap (Const.«earlier») ([«?TI1», «?TI2»]), ap (Const.«instance») ([«?P1», Const.«TimePoint»]), ap (Const.«instance») ([«?P2», Const.«TimePoint»]), ap (Const.«temporalPart») ([«?P1», «?TI1»]), ap (Const.«temporalPart») ([«?P2», «?TI2»])]) (ap (Const.«before») ([«?P1», «?P2»])))
axiom ax_1466 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«overlapsTemporally») ([«?INTERVAL1», «?INTERVAL2»])) (mkExists (fun («?INTERVAL3» : Obj) => mkAnd [ap (Const.«instance») ([«?INTERVAL3», Const.«TimePosition»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL1»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL2»])])))
axiom ax_1467 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj) («?INTERVAL3» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INTERVAL3», Const.«TimePosition»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL1»]), ap (Const.«temporalPart») ([«?INTERVAL3», «?INTERVAL2»])]) (ap (Const.«overlapsTemporally») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1468 : Holds (ap (Const.«instance») ([Const.«during», Const.«TransitiveRelation»]))
axiom ax_1469 : Holds (ap (Const.«instance») ([Const.«during», Const.«BinaryPredicate»]))
axiom ax_1470 : Holds (ap (Const.«instance») ([Const.«during», Const.«IrreflexiveRelation»]))
axiom ax_1471 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«during») ([«?INTERVAL1», «?INTERVAL2»])) (mkAnd [ap (Const.«before») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])]), ap (Const.«before») ([ap (Const.«BeginFn») ([«?INTERVAL2»]), ap (Const.«BeginFn») ([«?INTERVAL1»])])]))
axiom ax_1472 : Holds (ap (Const.«instance») ([Const.«meetsTemporally», Const.«BinaryPredicate»]))
axiom ax_1473 : Holds (ap (Const.«instance») ([Const.«meetsTemporally», Const.«TemporalRelation»]))
axiom ax_1474 : Holds (ap (Const.«instance») ([Const.«meetsTemporally», Const.«AsymmetricRelation»]))
axiom ax_1475 : Holds (ap (Const.«instance») ([Const.«meetsTemporally», Const.«IntransitiveRelation»]))
axiom ax_1476 : Holds (ap (Const.«instance») ([Const.«meetsTemporally», Const.«TotalValuedRelation»]))
axiom ax_1477 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«meetsTemporally») ([«?INTERVAL1», «?INTERVAL2»])) (ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])])))
axiom ax_1478 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])])) (ap (Const.«meetsTemporally») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1479 : ∀ («?T1» : Obj) («?T2» : Obj), Holds (mkImp (ap (Const.«meetsTemporally») ([«?T1», «?T2»])) (mkNot (mkExists (fun («?T3» : Obj) => mkAnd [ap (Const.«instance») ([«?T3», Const.«TimeInterval»]), ap (Const.«temporalPart») ([«?T3», «?T1»]), ap (Const.«temporalPart») ([«?T3», «?T2»])]))))
axiom ax_1480 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INTERVAL1», Const.«TimeInterval»]), ap (Const.«instance») ([«?INTERVAL2», Const.«TimeInterval»]), ap (Const.«equal») ([ap (Const.«BeginFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])]), ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«EndFn») ([«?INTERVAL2»])])]) (ap (Const.«equal») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1481 : Holds (ap (Const.«instance») ([Const.«earlier», Const.«BinaryPredicate»]))
axiom ax_1482 : Holds (ap (Const.«instance») ([Const.«earlier», Const.«TemporalRelation»]))
axiom ax_1483 : Holds (ap (Const.«instance») ([Const.«earlier», Const.«TransitiveRelation»]))
axiom ax_1484 : Holds (ap (Const.«instance») ([Const.«earlier», Const.«IrreflexiveRelation»]))
axiom ax_1485 : Holds (ap (Const.«instance») ([Const.«earlier», Const.«TotalValuedRelation»]))
axiom ax_1486 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«earlier») ([«?INTERVAL1», «?INTERVAL2»])) (ap (Const.«before») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])])))
axiom ax_1487 : ∀ («?INTERVAL1» : Obj) («?INTERVAL2» : Obj), Holds (mkImp (ap (Const.«before») ([ap (Const.«EndFn») ([«?INTERVAL1»]), ap (Const.«BeginFn») ([«?INTERVAL2»])])) (ap (Const.«earlier») ([«?INTERVAL1», «?INTERVAL2»])))
axiom ax_1488 : Holds (ap (Const.«instance») ([Const.«cooccur», Const.«BinaryPredicate»]))
axiom ax_1489 : Holds (ap (Const.«instance») ([Const.«cooccur», Const.«TemporalRelation»]))
axiom ax_1490 : Holds (ap (Const.«instance») ([Const.«cooccur», Const.«EquivalenceRelation»]))
axiom ax_1491 : ∀ («?PHYS1» : Obj) («?PHYS2» : Obj), Holds (mkImp (ap (Const.«cooccur») ([«?PHYS1», «?PHYS2»])) (ap (Const.«equal») ([ap (Const.«WhenFn») ([«?PHYS1»]), ap (Const.«WhenFn») ([«?PHYS2»])])))
axiom ax_1492 : ∀ («?PHYS1» : Obj) («?PHYS2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«WhenFn») ([«?PHYS1»]), ap (Const.«WhenFn») ([«?PHYS2»])])) (ap (Const.«cooccur») ([«?PHYS1», «?PHYS2»])))
axiom ax_1493 : Holds (ap (Const.«instance») ([Const.«TimeIntervalFn», Const.«BinaryFunction»]))
axiom ax_1494 : Holds (ap (Const.«instance») ([Const.«TimeIntervalFn», Const.«TemporalRelation»]))
axiom ax_1495 : Holds (ap (Const.«instance») ([Const.«TimeIntervalFn», Const.«PartialValuedRelation»]))
axiom ax_1496 : ∀ («?INTERVAL» : Obj) («?POINT1» : Obj) («?POINT2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT1», Const.«TimePoint»]), ap (Const.«instance») ([«?POINT2», Const.«TimePoint»]), ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»]), ap (Const.«equal») ([ap (Const.«TimeIntervalFn») ([«?POINT1», «?POINT2»]), «?INTERVAL»])]) (mkAnd [ap (Const.«equal») ([ap (Const.«BeginFn») ([«?INTERVAL»]), «?POINT1»]), ap (Const.«equal») ([ap (Const.«EndFn») ([«?INTERVAL»]), «?POINT2»])]))
axiom ax_1497 : ∀ («?INTERVAL» : Obj) («?POINT1» : Obj) («?POINT2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POINT1», Const.«TimePoint»]), ap (Const.«instance») ([«?POINT2», Const.«TimePoint»]), ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»]), ap (Const.«equal») ([ap (Const.«TimeIntervalFn») ([«?POINT1», «?POINT2»]), «?INTERVAL»])]) (mkForall (fun («?POINT» : Obj) => mkIff (ap (Const.«temporallyBetweenOrEqual») ([«?POINT1», «?POINT», «?POINT2»])) (ap (Const.«temporalPart») ([«?POINT», «?INTERVAL»])))))
axiom ax_1498 : Holds (ap (Const.«instance») ([Const.«RecurrentTimeIntervalFn», Const.«TemporalRelation»]))
axiom ax_1499 : Holds (ap (Const.«instance») ([Const.«RecurrentTimeIntervalFn», Const.«BinaryFunction»]))
axiom ax_1500 : Holds (ap (Const.«instance») ([Const.«RecurrentTimeIntervalFn», Const.«PartialValuedRelation»]))
axiom ax_1501 : ∀ («?INTERVAL» : Obj) («?TIMECLASS1» : Obj) («?TIMECLASS2» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», ap (Const.«RecurrentTimeIntervalFn») ([«?TIMECLASS1», «?TIMECLASS2»])])) (mkExists (fun («?TIME1» : Obj) => mkExists (fun («?TIME2» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME1», «?TIMECLASS1»]), ap (Const.«instance») ([«?TIME2», «?TIMECLASS2»]), ap (Const.«starts») ([«?TIME1», «?INTERVAL»]), ap (Const.«finishes») ([«?TIME2», «?INTERVAL»])]))))
axiom ax_1502 : Holds (ap (Const.«instance») ([Const.«WhenFn», Const.«TemporalRelation»]))
axiom ax_1503 : Holds (ap (Const.«instance») ([Const.«WhenFn», Const.«UnaryFunction»]))
axiom ax_1504 : Holds (ap (Const.«instance») ([Const.«WhenFn», Const.«TotalValuedRelation»]))
axiom ax_1505 : Holds (ap (Const.«instance») ([Const.«PastFn», Const.«TemporalRelation»]))
axiom ax_1506 : Holds (ap (Const.«instance») ([Const.«PastFn», Const.«UnaryFunction»]))
axiom ax_1507 : Holds (ap (Const.«instance») ([Const.«PastFn», Const.«TotalValuedRelation»]))
axiom ax_1508 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«meetsTemporally») ([ap (Const.«PastFn») ([«?INTERVAL»]), «?INTERVAL»])))
axiom ax_1509 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«equal») ([ap (Const.«PastFn») ([«?INTERVAL»]), ap (Const.«TimeIntervalFn») ([Const.«NegativeInfinity», ap (Const.«BeginFn») ([«?INTERVAL»])])])))
axiom ax_1510 : Holds (ap (Const.«instance») ([Const.«ImmediatePastFn», Const.«TemporalRelation»]))
axiom ax_1511 : Holds (ap (Const.«instance») ([Const.«ImmediatePastFn», Const.«UnaryFunction»]))
axiom ax_1512 : Holds (ap (Const.«instance») ([Const.«ImmediatePastFn», Const.«TotalValuedRelation»]))
axiom ax_1513 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«finishes») ([ap (Const.«ImmediatePastFn») ([«?INTERVAL»]), ap (Const.«PastFn») ([«?INTERVAL»])])))
axiom ax_1514 : Holds (ap (Const.«instance») ([Const.«FutureFn», Const.«TemporalRelation»]))
axiom ax_1515 : Holds (ap (Const.«instance») ([Const.«FutureFn», Const.«UnaryFunction»]))
axiom ax_1516 : Holds (ap (Const.«instance») ([Const.«FutureFn», Const.«TotalValuedRelation»]))
axiom ax_1517 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«meetsTemporally») ([«?INTERVAL», ap (Const.«FutureFn») ([«?INTERVAL»])])))
axiom ax_1518 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«equal») ([ap (Const.«FutureFn») ([«?INTERVAL»]), ap (Const.«TimeIntervalFn») ([ap (Const.«EndFn») ([«?INTERVAL»]), Const.«PositiveInfinity»])])))
axiom ax_1519 : Holds (ap (Const.«instance») ([Const.«ImmediateFutureFn», Const.«TemporalRelation»]))
axiom ax_1520 : Holds (ap (Const.«instance») ([Const.«ImmediateFutureFn», Const.«UnaryFunction»]))
axiom ax_1521 : Holds (ap (Const.«instance») ([Const.«ImmediateFutureFn», Const.«TotalValuedRelation»]))
axiom ax_1522 : ∀ («?INTERVAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERVAL», Const.«TimeInterval»])) (ap (Const.«starts») ([ap (Const.«ImmediateFutureFn») ([«?INTERVAL»]), ap (Const.«FutureFn») ([«?INTERVAL»])])))
axiom ax_1523 : Holds (ap (Const.«instance») ([Const.«date», Const.«BinaryPredicate»]))
axiom ax_1524 : Holds (ap (Const.«instance») ([Const.«date», Const.«SingleValuedRelation»]))
axiom ax_1525 : Holds (ap (Const.«subrelation») ([Const.«date», Const.«time»]))
axiom ax_1526 : Holds (ap (Const.«instance») ([Const.«YearFn», Const.«TemporalRelation»]))
axiom ax_1527 : Holds (ap (Const.«instance») ([Const.«YearFn», Const.«UnaryFunction»]))
axiom ax_1528 : Holds (ap (Const.«instance») ([Const.«YearFn», Const.«TotalValuedRelation»]))
axiom ax_1529 : Holds (ap (Const.«instance») ([Const.«MonthFn», Const.«TemporalRelation»]))
axiom ax_1530 : Holds (ap (Const.«instance») ([Const.«MonthFn», Const.«BinaryFunction»]))
axiom ax_1531 : Holds (ap (Const.«instance») ([Const.«MonthFn», Const.«PartialValuedRelation»]))
axiom ax_1532 : Holds (ap (Const.«instance») ([Const.«DayFn», Const.«TemporalRelation»]))
axiom ax_1533 : Holds (ap (Const.«instance») ([Const.«DayFn», Const.«BinaryFunction»]))
axiom ax_1534 : Holds (ap (Const.«instance») ([Const.«DayFn», Const.«PartialValuedRelation»]))
axiom ax_1535 : ∀ («?DAY» : Obj) («?MONTH» : Obj) («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DAY», ap (Const.«DayFn») ([«?NUMBER», «?MONTH»])])) (ap (Const.«lessThanOrEqualTo») ([«?NUMBER», numLit "31"])))
axiom ax_1536 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?MONTH» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», ap (Const.«DayFn») ([«?NUMBER1», «?MONTH»])]), ap (Const.«instance») ([«?DAY2», ap (Const.«DayFn») ([«?NUMBER2», «?MONTH»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?NUMBER2», «?NUMBER1»]), numLit "1"])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1537 : Holds (ap (Const.«instance») ([Const.«HourFn», Const.«TemporalRelation»]))
axiom ax_1538 : Holds (ap (Const.«instance») ([Const.«HourFn», Const.«BinaryFunction»]))
axiom ax_1539 : Holds (ap (Const.«instance») ([Const.«HourFn», Const.«PartialValuedRelation»]))
axiom ax_1540 : ∀ («?DAY» : Obj) («?HOUR» : Obj) («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HOUR», ap (Const.«HourFn») ([«?NUMBER», «?DAY»])])) (ap (Const.«lessThan») ([«?NUMBER», numLit "24"])))
axiom ax_1541 : ∀ («?DAY» : Obj) («?HOUR1» : Obj) («?HOUR2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HOUR1», ap (Const.«HourFn») ([«?NUMBER1», «?DAY»])]), ap (Const.«instance») ([«?HOUR2», ap (Const.«HourFn») ([«?NUMBER2», «?DAY»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?NUMBER2», «?NUMBER1»]), numLit "1"])]) (ap (Const.«meetsTemporally») ([«?HOUR1», «?HOUR2»])))
axiom ax_1542 : Holds (ap (Const.«instance») ([Const.«MinuteFn», Const.«TemporalRelation»]))
axiom ax_1543 : Holds (ap (Const.«instance») ([Const.«MinuteFn», Const.«BinaryFunction»]))
axiom ax_1544 : Holds (ap (Const.«instance») ([Const.«MinuteFn», Const.«PartialValuedRelation»]))
axiom ax_1545 : ∀ («?HOUR» : Obj) («?MINUTE» : Obj) («?NUMBER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MINUTE», ap (Const.«MinuteFn») ([«?NUMBER», «?HOUR»])])) (ap (Const.«lessThan») ([«?NUMBER», numLit "60"])))
axiom ax_1546 : ∀ («?HOUR» : Obj) («?MINUTE1» : Obj) («?MINUTE2» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MINUTE1», ap (Const.«MinuteFn») ([«?NUMBER1», «?HOUR»])]), ap (Const.«instance») ([«?MINUTE2», ap (Const.«MinuteFn») ([«?NUMBER2», «?HOUR»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?NUMBER2», «?NUMBER1»]), numLit "1"])]) (ap (Const.«meetsTemporally») ([«?MINUTE1», «?MINUTE2»])))
axiom ax_1547 : Holds (ap (Const.«instance») ([Const.«SecondFn», Const.«TemporalRelation»]))
axiom ax_1548 : Holds (ap (Const.«instance») ([Const.«SecondFn», Const.«BinaryFunction»]))
axiom ax_1549 : Holds (ap (Const.«instance») ([Const.«SecondFn», Const.«PartialValuedRelation»]))
axiom ax_1550 : ∀ («?MINUTE» : Obj) («?NUMBER» : Obj) («?SECOND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SECOND», ap (Const.«SecondFn») ([«?NUMBER», «?MINUTE»])])) (ap (Const.«lessThan») ([«?NUMBER», numLit "60"])))
axiom ax_1551 : ∀ («?MINUTE» : Obj) («?NUMBER1» : Obj) («?NUMBER2» : Obj) («?SECOND1» : Obj) («?SECOND2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SECOND1», ap (Const.«SecondFn») ([«?NUMBER1», «?MINUTE»])]), ap (Const.«instance») ([«?SECOND2», ap (Const.«SecondFn») ([«?NUMBER2», «?MINUTE»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?NUMBER2», «?NUMBER1»]), numLit "1"])]) (ap (Const.«meetsTemporally») ([«?SECOND1», «?SECOND2»])))
axiom ax_1552 : ∀ («?N1» : Obj) («?N2» : Obj) («?T1» : Obj) («?T2» : Obj) («?Y1» : Obj) («?Y2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?Y1», ap (Const.«YearFn») ([«?N1»])]), ap (Const.«instance») ([«?Y2», ap (Const.«YearFn») ([«?N2»])]), ap (Const.«equal») ([«?T1», ap (Const.«BeginFn») ([«?Y1»])]), ap (Const.«equal») ([«?T2», ap (Const.«BeginFn») ([«?Y2»])]), ap (Const.«greaterThan») ([«?N2», «?N1»])]) (ap (Const.«before») ([«?T1», «?T2»])))
axiom ax_1553 : ∀ («?N1» : Obj) («?N2» : Obj) («?Y1» : Obj) («?Y2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?Y1», ap (Const.«YearFn») ([«?N1»])]), ap (Const.«instance») ([«?Y2», ap (Const.«YearFn») ([«?N2»])]), ap (Const.«greaterThan») ([«?N2», «?N1»])]) (ap (Const.«earlier») ([«?Y1», «?Y2»])))
axiom ax_1554 : ∀ («?M1» : Obj) («?M2» : Obj) («?N1» : Obj) («?N2» : Obj) («?T1» : Obj) («?T2» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?M1», ap (Const.«MonthFn») ([«?N1», ap (Const.«YearFn») ([«?Y»])])]), ap (Const.«instance») ([«?M2», ap (Const.«MonthFn») ([«?N2», ap (Const.«YearFn») ([«?Y»])])]), ap (Const.«equal») ([«?T1», ap (Const.«BeginFn») ([«?M1»])]), ap (Const.«equal») ([«?T2», ap (Const.«BeginFn») ([«?M2»])]), ap (Const.«successorClass») ([«?N1», «?N2»])]) (ap (Const.«before») ([«?T1», «?T2»])))
axiom ax_1555 : ∀ («?M1» : Obj) («?M2» : Obj) («?N1» : Obj) («?N2» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?M1», ap (Const.«MonthFn») ([«?N1», ap (Const.«YearFn») ([«?Y»])])]), ap (Const.«instance») ([«?M2», ap (Const.«MonthFn») ([«?N2», ap (Const.«YearFn») ([«?Y»])])]), ap (Const.«successorClass») ([«?N1», «?N2»])]) (ap (Const.«earlier») ([«?M1», «?M2»])))
axiom ax_1556 : ∀ («?D1» : Obj) («?D2» : Obj) («?M» : Obj) («?N1» : Obj) («?N2» : Obj) («?T1» : Obj) («?T2» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D1», ap (Const.«DayFn») ([«?N1», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])]), ap (Const.«instance») ([«?D2», ap (Const.«DayFn») ([«?N2», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])]), ap (Const.«equal») ([«?T1», ap (Const.«BeginFn») ([«?D1»])]), ap (Const.«equal») ([«?T2», ap (Const.«BeginFn») ([«?D2»])]), ap (Const.«greaterThan») ([«?N2», «?N1»])]) (ap (Const.«before») ([«?T1», «?T2»])))
axiom ax_1557 : ∀ («?D1» : Obj) («?D2» : Obj) («?M» : Obj) («?N1» : Obj) («?N2» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D1», ap (Const.«DayFn») ([«?N1», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])]), ap (Const.«instance») ([«?D2», ap (Const.«DayFn») ([«?N2», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])]), ap (Const.«greaterThan») ([«?N2», «?N1»])]) (ap (Const.«earlier») ([«?D1», «?D2»])))
axiom ax_1558 : Holds (ap (Const.«subclass») ([Const.«Year», Const.«TimeInterval»]))
axiom ax_1559 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Year», Const.«YearFn»]))
axiom ax_1560 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Year», Const.«YearDuration»]))
axiom ax_1561 : ∀ («?YEAR» : Obj), Holds (mkImp (ap (Const.«instance») ([«?YEAR», Const.«Year»])) (ap (Const.«duration») ([«?YEAR», ap (Const.«MeasureFn») ([numLit "1", Const.«YearDuration»])])))
axiom ax_1562 : ∀ («?N1» : Obj) («?N2» : Obj) («?Y1» : Obj) («?Y2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?Y1», ap (Const.«YearFn») ([«?N1»])]), ap (Const.«instance») ([«?Y2», ap (Const.«YearFn») ([«?N2»])]), ap (Const.«equal») ([ap (Const.«SubtractionFn») ([«?N2», «?N1»]), numLit "1"])]) (ap (Const.«meetsTemporally») ([«?Y1», «?Y2»])))
axiom ax_1563 : Holds (ap (Const.«instance») ([Const.«DecadeDuration», Const.«UnitOfDuration»]))
axiom ax_1564 : Holds (ap (Const.«instance») ([Const.«DecadeDuration», Const.«TimeDuration»]))
axiom ax_1565 : ∀ («?NUMBER» : Obj), Holds (mkImp (ap (Const.«equal») ([«?NUMBER», ap (Const.«MultiplicationFn») ([numLit "1", «?NUMBER»])])) (ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?NUMBER», Const.«DecadeDuration»]), ap (Const.«MeasureFn») ([ap (Const.«MultiplicationFn») ([«?NUMBER», numLit "10"]), Const.«YearDuration»])])))
axiom ax_1566 : Holds (ap (Const.«subclass») ([Const.«Decade», Const.«TimeInterval»]))
axiom ax_1567 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Decade», Const.«DecadeDuration»]))
axiom ax_1568 : ∀ («?D» : Obj), Holds (mkImp (ap (Const.«instance») ([«?D», Const.«Decade»])) (ap (Const.«duration») ([«?D», ap (Const.«MeasureFn») ([numLit "1", Const.«DecadeDuration»])])))
axiom ax_1569 : ∀ («?D» : Obj), Holds (mkImp (ap (Const.«instance») ([«?D», Const.«Decade»])) (ap (Const.«duration») ([«?D», ap (Const.«MeasureFn») ([numLit "10", Const.«YearDuration»])])))
axiom ax_1570 : Holds (ap (Const.«subclass») ([Const.«Midnight», Const.«TimePoint»]))
axiom ax_1571 : ∀ («?M» : Obj), Holds (mkImp (ap (Const.«instance») ([«?M», Const.«Midnight»])) (mkExists (fun («?D» : Obj) => mkAnd [ap (Const.«instance») ([«?D», Const.«Day»]), ap (Const.«equal») ([«?M», ap (Const.«EndFn») ([«?D»])])])))
axiom ax_1572 : Holds (ap (Const.«subclass») ([Const.«Afternoon», Const.«DayTime»]))
axiom ax_1573 : Holds (ap (Const.«disjoint») ([Const.«Morning», Const.«Afternoon»]))
axiom ax_1574 : Holds (ap (Const.«disjoint») ([Const.«Afternoon», Const.«Evening»]))
axiom ax_1575 : Holds (ap (Const.«disjoint») ([Const.«Morning», Const.«Evening»]))
axiom ax_1576 : ∀ («?AFTERNOON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AFTERNOON», Const.«Afternoon»])) (mkExists (fun («?HOUR» : Obj) => mkExists (fun («?DAY» : Obj) => mkAnd [ap (Const.«instance») ([«?HOUR», ap (Const.«HourFn») ([numLit "12", «?DAY»])]), ap (Const.«starts») ([«?HOUR», «?AFTERNOON»])]))))
axiom ax_1577 : Holds (ap (Const.«subclass») ([Const.«Morning», Const.«DayTime»]))
axiom ax_1578 : ∀ («?MORNING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MORNING», Const.«Morning»])) (mkExists (fun («?HOUR» : Obj) => mkExists (fun («?DAY» : Obj) => mkAnd [ap (Const.«instance») ([«?HOUR», ap (Const.«HourFn») ([numLit "12", «?DAY»])]), ap (Const.«finishes») ([«?HOUR», «?MORNING»])]))))
axiom ax_1579 : Holds (ap (Const.«instance») ([Const.«MorningFn», Const.«TemporalRelation»]))
axiom ax_1580 : Holds (ap (Const.«instance») ([Const.«MorningFn», Const.«UnaryFunction»]))
axiom ax_1581 : Holds (ap (Const.«instance») ([Const.«MorningFn», Const.«PartialValuedRelation»]))
axiom ax_1582 : ∀ («?D» : Obj) («?E» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?E», Const.«Morning»]), ap (Const.«instance») ([«?D», Const.«Day»]), ap (Const.«equal») ([«?E», ap (Const.«MorningFn») ([«?D»])])]) (ap (Const.«during») ([«?E», «?D»])))
axiom ax_1583 : Holds (ap (Const.«instance») ([Const.«AfternoonFn», Const.«TemporalRelation»]))
axiom ax_1584 : Holds (ap (Const.«instance») ([Const.«AfternoonFn», Const.«UnaryFunction»]))
axiom ax_1585 : Holds (ap (Const.«instance») ([Const.«AfternoonFn», Const.«PartialValuedRelation»]))
axiom ax_1586 : ∀ («?D» : Obj) («?E» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?E», Const.«Afternoon»]), ap (Const.«instance») ([«?D», Const.«Day»]), ap (Const.«equal») ([«?E», ap (Const.«AfternoonFn») ([«?D»])])]) (ap (Const.«during») ([«?E», «?D»])))
axiom ax_1587 : ∀ («?A» : Obj), Holds (mkImp (ap (Const.«instance») ([«?A», Const.«Afternoon»])) (mkExists (fun («?N» : Obj) => mkAnd [ap (Const.«instance») ([«?N», Const.«Noon»]), ap (Const.«equal») ([ap (Const.«BeginFn») ([«?A»]), «?N»])])))
axiom ax_1588 : Holds (ap (Const.«subclass») ([Const.«Noon», Const.«TimePoint»]))
axiom ax_1589 : Holds (ap (Const.«subclass») ([Const.«DayTime», Const.«TimeInterval»]))
axiom ax_1590 : Holds (ap (Const.«disjoint») ([Const.«DayTime», Const.«NightTime»]))
axiom ax_1591 : Holds (ap (Const.«subclass») ([Const.«Sunrise», Const.«TimeInterval»]))
axiom ax_1592 : Holds (ap (Const.«subclass») ([Const.«Sunset», Const.«TimeInterval»]))
axiom ax_1593 : ∀ («?DAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DAY», Const.«DayTime»])) (mkExists (fun («?NIGHT1» : Obj) => mkExists (fun («?NIGHT2» : Obj) => mkAnd [ap (Const.«instance») ([«?NIGHT1», Const.«NightTime»]), ap (Const.«instance») ([«?NIGHT2», Const.«NightTime»]), ap (Const.«meetsTemporally») ([«?DAY», «?NIGHT1»]), ap (Const.«meetsTemporally») ([«?NIGHT2», «?DAY»])]))))
axiom ax_1594 : ∀ («?DAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DAY», Const.«DayTime»])) (mkExists (fun («?RISE» : Obj) => mkExists (fun («?SET» : Obj) => mkAnd [ap (Const.«instance») ([«?RISE», Const.«Sunrise»]), ap (Const.«instance») ([«?SET», Const.«Sunset»]), ap (Const.«starts») ([«?RISE», «?DAY»]), ap (Const.«finishes») ([«?SET», «?DAY»])]))))
axiom ax_1595 : Holds (ap (Const.«subclass») ([Const.«NightTime», Const.«TimeInterval»]))
axiom ax_1596 : ∀ («?NIGHT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NIGHT», Const.«NightTime»])) (mkExists (fun («?DAY1» : Obj) => mkExists (fun («?DAY2» : Obj) => mkAnd [ap (Const.«instance») ([«?DAY1», Const.«DayTime»]), ap (Const.«instance») ([«?DAY2», Const.«DayTime»]), ap (Const.«meetsTemporally») ([«?NIGHT», «?DAY1»]), ap (Const.«meetsTemporally») ([«?DAY2», «?NIGHT»])]))))
axiom ax_1597 : ∀ («?NIGHT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NIGHT», Const.«NightTime»])) (mkExists (fun («?RISE» : Obj) => mkExists (fun («?SET» : Obj) => mkAnd [ap (Const.«instance») ([«?RISE», Const.«Sunrise»]), ap (Const.«instance») ([«?SET», Const.«Sunset»]), ap (Const.«starts») ([«?SET», «?NIGHT»]), ap (Const.«finishes») ([«?RISE», «?NIGHT»])]))))
axiom ax_1598 : Holds (ap (Const.«subclass») ([Const.«Evening», Const.«NightTime»]))
axiom ax_1599 : ∀ («?EVE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?EVE», Const.«Evening»])) (mkExists (fun («?MID» : Obj) => mkAnd [ap (Const.«instance») ([«?MID», Const.«Midnight»]), ap (Const.«equal») ([ap (Const.«EndFn») ([«?EVE»]), «?MID»])])))
axiom ax_1600 : ∀ («?AFT» : Obj) («?D» : Obj) («?EVE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EVE», Const.«Evening»]), ap (Const.«instance») ([«?AFT», Const.«Afternoon»]), ap (Const.«instance») ([«?D», Const.«Day»]), ap (Const.«during») ([«?EVE», «?D»]), ap (Const.«during») ([«?AFT», «?D»])]) (ap (Const.«meetsTemporally») ([«?AFT», «?EVE»])))
axiom ax_1601 : Holds (ap (Const.«instance») ([Const.«EveningFn», Const.«TemporalRelation»]))
axiom ax_1602 : Holds (ap (Const.«instance») ([Const.«EveningFn», Const.«UnaryFunction»]))
axiom ax_1603 : Holds (ap (Const.«instance») ([Const.«EveningFn», Const.«PartialValuedRelation»]))
axiom ax_1604 : ∀ («?D» : Obj) («?E» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?E», Const.«Evening»]), ap (Const.«instance») ([«?D», Const.«Day»]), ap (Const.«equal») ([«?E», ap (Const.«EveningFn») ([«?D»])])]) (ap (Const.«during») ([«?E», «?D»])))
axiom ax_1605 : Holds (ap (Const.«instance») ([Const.«WeekFn», Const.«TemporalRelation»]))
axiom ax_1606 : Holds (ap (Const.«instance») ([Const.«WeekFn», Const.«BinaryFunction»]))
axiom ax_1607 : Holds (ap (Const.«instance») ([Const.«WeekFn», Const.«PartialValuedRelation»]))
axiom ax_1608 : ∀ («?N» : Obj) («?W» : Obj) («?Y» : Obj) («?YI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?W», ap (Const.«WeekFn») ([«?N», «?Y»])]), ap (Const.«instance») ([«?YI», «?Y»])]) (ap (Const.«during») ([«?W», «?YI»])))
axiom ax_1609 : Holds (ap (Const.«instance») ([Const.«QuarterFn», Const.«TemporalRelation»]))
axiom ax_1610 : Holds (ap (Const.«instance») ([Const.«QuarterFn», Const.«BinaryFunction»]))
axiom ax_1611 : Holds (ap (Const.«instance») ([Const.«QuarterFn», Const.«PartialValuedRelation»]))
axiom ax_1612 : ∀ («?N» : Obj) («?Q» : Obj) («?Y» : Obj) («?YI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?Q», Const.«QuarterYear»]), ap (Const.«instance») ([«?Q», ap (Const.«QuarterFn») ([«?N», ap (Const.«YearFn») ([«?Y»])])]), ap (Const.«instance») ([«?YI», ap (Const.«YearFn») ([«?Y»])])]) (ap (Const.«during») ([«?Q», «?YI»])))
axiom ax_1613 : Holds (ap (Const.«subclass») ([Const.«QuarterYear», Const.«TimeInterval»]))
axiom ax_1614 : ∀ («?Q» : Obj), Holds (mkImp (ap (Const.«instance») ([«?Q», Const.«QuarterYear»])) (ap (Const.«duration») ([«?Q», ap (Const.«MeasureFn») ([numLit "3", Const.«MonthDuration»])])))
axiom ax_1615 : Holds (ap (Const.«subclass») ([Const.«LeapYear», Const.«Year»]))
axiom ax_1616 : ∀ («?LEAP» : Obj) («?NUMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEAP», Const.«LeapYear»]), ap (Const.«instance») ([«?LEAP», ap (Const.«YearFn») ([«?NUMBER»])])]) (mkOr [mkAnd [ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», numLit "4"]), numLit "0"]), mkNot (ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», numLit "100"]), numLit "0"]))], ap (Const.«equal») ([ap (Const.«RemainderFn») ([«?NUMBER», numLit "400"]), numLit "0"])]))
axiom ax_1617 : Holds (ap (Const.«instance») ([Const.«successorClass», Const.«BinaryPredicate»]))
axiom ax_1618 : Holds (ap (Const.«instance») ([Const.«successorClass», Const.«TransitiveRelation»]))
axiom ax_1619 : Holds (ap (Const.«relatedInternalConcept») ([Const.«successorClass», Const.«successorAttribute»]))
axiom ax_1620 : Holds (ap (Const.«successorClass») ([Const.«January», Const.«February»]))
axiom ax_1621 : Holds (ap (Const.«successorClass») ([Const.«February», Const.«March»]))
axiom ax_1622 : Holds (ap (Const.«successorClass») ([Const.«March», Const.«April»]))
axiom ax_1623 : Holds (ap (Const.«successorClass») ([Const.«April», Const.«May»]))
axiom ax_1624 : Holds (ap (Const.«successorClass») ([Const.«May», Const.«June»]))
axiom ax_1625 : Holds (ap (Const.«successorClass») ([Const.«June», Const.«July»]))
axiom ax_1626 : Holds (ap (Const.«successorClass») ([Const.«July», Const.«August»]))
axiom ax_1627 : Holds (ap (Const.«successorClass») ([Const.«August», Const.«September»]))
axiom ax_1628 : Holds (ap (Const.«successorClass») ([Const.«September», Const.«October»]))
axiom ax_1629 : Holds (ap (Const.«successorClass») ([Const.«October», Const.«November»]))
axiom ax_1630 : Holds (ap (Const.«successorClass») ([Const.«November», Const.«December»]))
axiom ax_1631 : Holds (ap (Const.«successorClass») ([Const.«Sunday», Const.«Monday»]))
axiom ax_1632 : Holds (ap (Const.«successorClass») ([Const.«Monday», Const.«Tuesday»]))
axiom ax_1633 : Holds (ap (Const.«successorClass») ([Const.«Tuesday», Const.«Wednesday»]))
axiom ax_1634 : Holds (ap (Const.«successorClass») ([Const.«Wednesday», Const.«Thursday»]))
axiom ax_1635 : Holds (ap (Const.«successorClass») ([Const.«Thursday», Const.«Friday»]))
axiom ax_1636 : Holds (ap (Const.«successorClass») ([Const.«Friday», Const.«Saturday»]))
axiom ax_1637 : Holds (ap (Const.«subclass») ([Const.«Month», Const.«TimeInterval»]))
axiom ax_1638 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Month», Const.«MonthFn»]))
axiom ax_1639 : Holds (ap (Const.«subclass») ([Const.«January», Const.«Month»]))
axiom ax_1640 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«January»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1641 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«January», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«February», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1642 : Holds (ap (Const.«subclass») ([Const.«February», Const.«Month»]))
axiom ax_1643 : ∀ («?MONTH» : Obj) («?Y» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH», ap (Const.«MonthFn») ([Const.«February», «?YEAR»])]), ap (Const.«instance») ([«?Y», «?YEAR»]), mkNot (ap (Const.«instance») ([«?Y», Const.«LeapYear»]))]) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "28", Const.«DayDuration»])])))
axiom ax_1644 : ∀ («?MONTH» : Obj) («?Y» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH», ap (Const.«MonthFn») ([Const.«February», «?YEAR»])]), ap (Const.«instance») ([«?Y», «?YEAR»]), ap (Const.«instance») ([«?Y», Const.«LeapYear»])]) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "29", Const.«DayDuration»])])))
axiom ax_1645 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«February», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«March», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1646 : Holds (ap (Const.«subclass») ([Const.«March», Const.«Month»]))
axiom ax_1647 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«March»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1648 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«March», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«April», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1649 : Holds (ap (Const.«subclass») ([Const.«April», Const.«Month»]))
axiom ax_1650 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«April»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "30", Const.«DayDuration»])])))
axiom ax_1651 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«April», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«May», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1652 : Holds (ap (Const.«subclass») ([Const.«May», Const.«Month»]))
axiom ax_1653 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«May»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1654 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«May», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«June», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1655 : Holds (ap (Const.«subclass») ([Const.«June», Const.«Month»]))
axiom ax_1656 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«June»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "30", Const.«DayDuration»])])))
axiom ax_1657 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«June», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«July», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1658 : Holds (ap (Const.«subclass») ([Const.«July», Const.«Month»]))
axiom ax_1659 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«July»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1660 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«July», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«August», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1661 : Holds (ap (Const.«subclass») ([Const.«August», Const.«Month»]))
axiom ax_1662 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«August»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1663 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«August», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«September», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1664 : Holds (ap (Const.«subclass») ([Const.«September», Const.«Month»]))
axiom ax_1665 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«September»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "30", Const.«DayDuration»])])))
axiom ax_1666 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«September», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«October», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1667 : Holds (ap (Const.«subclass») ([Const.«October», Const.«Month»]))
axiom ax_1668 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«October»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1669 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«October», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«November», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1670 : Holds (ap (Const.«subclass») ([Const.«November», Const.«Month»]))
axiom ax_1671 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«November»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "30", Const.«DayDuration»])])))
axiom ax_1672 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?YEAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«November», «?YEAR»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«December», «?YEAR»])])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1673 : Holds (ap (Const.«subclass») ([Const.«December», Const.«Month»]))
axiom ax_1674 : ∀ («?MONTH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MONTH», Const.«December»])) (ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([numLit "31", Const.«DayDuration»])])))
axiom ax_1675 : ∀ («?MONTH1» : Obj) («?MONTH2» : Obj) («?Y1» : Obj) («?Y2» : Obj) («?YEAR1» : Obj) («?YEAR2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH1», ap (Const.«MonthFn») ([Const.«December», «?YEAR1»])]), ap (Const.«instance») ([«?MONTH2», ap (Const.«MonthFn») ([Const.«January», «?YEAR2»])]), ap (Const.«instance») ([«?Y1», «?YEAR1»]), ap (Const.«instance») ([«?Y2», «?YEAR2»]), ap (Const.«meetsTemporally») ([«?Y1», «?Y2»])]) (ap (Const.«meetsTemporally») ([«?MONTH1», «?MONTH2»])))
axiom ax_1676 : Holds (ap (Const.«subclass») ([Const.«Day», Const.«TimeInterval»]))
axiom ax_1677 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Day», Const.«DayFn»]))
axiom ax_1678 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Day», Const.«DayDuration»]))
axiom ax_1679 : ∀ («?DAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DAY», Const.«Day»])) (ap (Const.«duration») ([«?DAY», ap (Const.«MeasureFn») ([numLit "1", Const.«DayDuration»])])))
axiom ax_1680 : Holds (ap (Const.«subclass») ([Const.«Monday», Const.«Day»]))
axiom ax_1681 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Sunday»]), ap (Const.«instance») ([«?DAY2», Const.«Monday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1682 : Holds (ap (Const.«subclass») ([Const.«Tuesday», Const.«Day»]))
axiom ax_1683 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Monday»]), ap (Const.«instance») ([«?DAY2», Const.«Tuesday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1684 : Holds (ap (Const.«subclass») ([Const.«Wednesday», Const.«Day»]))
axiom ax_1685 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Tuesday»]), ap (Const.«instance») ([«?DAY2», Const.«Wednesday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1686 : Holds (ap (Const.«subclass») ([Const.«Thursday», Const.«Day»]))
axiom ax_1687 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Wednesday»]), ap (Const.«instance») ([«?DAY2», Const.«Thursday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1688 : Holds (ap (Const.«subclass») ([Const.«Friday», Const.«Day»]))
axiom ax_1689 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Thursday»]), ap (Const.«instance») ([«?DAY2», Const.«Friday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1690 : Holds (ap (Const.«subclass») ([Const.«Saturday», Const.«Day»]))
axiom ax_1691 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Friday»]), ap (Const.«instance») ([«?DAY2», Const.«Saturday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1692 : Holds (ap (Const.«subclass») ([Const.«Sunday», Const.«Day»]))
axiom ax_1693 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Saturday»]), ap (Const.«instance») ([«?DAY2», Const.«Sunday»]), ap (Const.«instance») ([«?WEEK», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK»])]) (mkNot (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»]))))
axiom ax_1694 : ∀ («?DAY1» : Obj) («?DAY2» : Obj) («?WEEK1» : Obj) («?WEEK2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DAY1», Const.«Saturday»]), ap (Const.«instance») ([«?DAY2», Const.«Sunday»]), ap (Const.«instance») ([«?WEEK1», Const.«Week»]), ap (Const.«instance») ([«?WEEK2», Const.«Week»]), ap (Const.«temporalPart») ([«?DAY1», «?WEEK1»]), ap (Const.«temporalPart») ([«?DAY2», «?WEEK2»]), ap (Const.«meetsTemporally») ([«?WEEK1», «?WEEK2»])]) (ap (Const.«meetsTemporally») ([«?DAY1», «?DAY2»])))
axiom ax_1695 : Holds (ap (Const.«subclass») ([Const.«Week», Const.«TimeInterval»]))
axiom ax_1696 : ∀ («?WEEK» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WEEK», Const.«Week»])) (ap (Const.«duration») ([«?WEEK», ap (Const.«MeasureFn») ([numLit "1", Const.«WeekDuration»])])))
axiom ax_1697 : ∀ («?S» : Obj) («?W» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?S», Const.«Sunday»]), ap (Const.«instance») ([«?W», Const.«Week»]), ap (Const.«during») ([«?S», «?W»])]) (ap (Const.«starts») ([«?S», «?W»])))
axiom ax_1698 : ∀ («?S» : Obj) («?W» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?S», Const.«Saturday»]), ap (Const.«instance») ([«?W», Const.«Week»]), ap (Const.«during») ([«?S», «?W»])]) (ap (Const.«finishes») ([«?S», «?W»])))
axiom ax_1699 : Holds (ap (Const.«subclass») ([Const.«Hour», Const.«TimeInterval»]))
axiom ax_1700 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Hour», Const.«HourFn»]))
axiom ax_1701 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Hour», Const.«HourDuration»]))
axiom ax_1702 : ∀ («?HOUR» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HOUR», Const.«Hour»])) (ap (Const.«duration») ([«?HOUR», ap (Const.«MeasureFn») ([numLit "1", Const.«HourDuration»])])))
axiom ax_1703 : Holds (ap (Const.«subclass») ([Const.«Minute», Const.«TimeInterval»]))
axiom ax_1704 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Minute», Const.«MinuteFn»]))
axiom ax_1705 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Minute», Const.«MinuteDuration»]))
axiom ax_1706 : ∀ («?MINUTE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MINUTE», Const.«Minute»])) (ap (Const.«duration») ([«?MINUTE», ap (Const.«MeasureFn») ([numLit "1", Const.«MinuteDuration»])])))
axiom ax_1707 : Holds (ap (Const.«subclass») ([Const.«Second», Const.«TimeInterval»]))
axiom ax_1708 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Second», Const.«SecondDuration»]))
axiom ax_1709 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Second», Const.«SecondFn»]))
axiom ax_1710 : ∀ («?SECOND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SECOND», Const.«Second»])) (ap (Const.«duration») ([«?SECOND», ap (Const.«MeasureFn») ([numLit "1", Const.«SecondDuration»])])))
axiom ax_1711 : Holds (ap (Const.«instance») ([Const.«TemporalCompositionFn», Const.«TemporalRelation»]))
axiom ax_1712 : Holds (ap (Const.«instance») ([Const.«TemporalCompositionFn», Const.«BinaryFunction»]))
axiom ax_1713 : Holds (ap (Const.«instance») ([Const.«TemporalCompositionFn», Const.«TotalValuedRelation»]))
axiom ax_1714 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkForall (fun («?TIME1» : Obj) => mkForall (fun («?TIME2» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?TIME1», «?INTERVALTYPE»]), ap (Const.«instance») ([«?TIME2», «?CLASS»])]) (mkExists (fun («?DURATION» : Obj) => mkAnd [ap (Const.«duration») ([«?TIME1», «?DURATION»]), ap (Const.«duration») ([«?TIME2», «?DURATION»])]))))))
axiom ax_1715 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkForall (fun («?TIME1» : Obj) => mkForall (fun («?TIME2» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?TIME1», «?CLASS»]), ap (Const.«instance») ([«?TIME2», «?CLASS»]), mkNot (ap (Const.«equal») ([«?TIME1», «?TIME2»]))]) (mkOr [ap (Const.«meetsTemporally») ([«?TIME1», «?TIME2»]), ap (Const.«meetsTemporally») ([«?TIME2», «?TIME1»]), ap (Const.«earlier») ([«?TIME1», «?TIME2»]), ap (Const.«earlier») ([«?TIME2», «?TIME1»])])))))
axiom ax_1716 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME», «?CLASS»]), ap (Const.«starts») ([«?TIME», «?INTERVAL»])])))
axiom ax_1717 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME», «?CLASS»]), ap (Const.«finishes») ([«?TIME», «?INTERVAL»])])))
axiom ax_1718 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkForall (fun («?TIME1» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?TIME1», «?CLASS»]), mkNot (ap (Const.«finishes») ([«?TIME1», «?INTERVAL»]))]) (mkExists (fun («?TIME2» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME2», «?CLASS»]), ap (Const.«meetsTemporally») ([«?TIME1», «?TIME2»])])))))
axiom ax_1719 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkForall (fun («?TIME1» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?TIME1», «?CLASS»]), mkNot (ap (Const.«starts») ([«?TIME1», «?INTERVAL»]))]) (mkExists (fun («?TIME2» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME2», «?CLASS»]), ap (Const.«meetsTemporally») ([«?TIME2», «?TIME1»])])))))
axiom ax_1720 : ∀ («?CLASS» : Obj) («?INTERVAL» : Obj) («?INTERVALTYPE» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«TemporalCompositionFn») ([«?INTERVAL», «?INTERVALTYPE»]), «?CLASS»])) (mkForall (fun («?TIME» : Obj) => mkImp (mkAnd [ap (Const.«instance») ([«?TIME», Const.«TimePoint»]), ap (Const.«temporalPart») ([«?TIME», «?INTERVAL»])]) (mkExists (fun («?INSTANCE» : Obj) => mkAnd [ap (Const.«instance») ([«?INSTANCE», «?CLASS»]), ap (Const.«temporalPart») ([«?TIME», «?INSTANCE»])])))))
axiom ax_1721 : ∀ («?YEAR» : Obj), Holds (mkImp (ap (Const.«instance») ([«?YEAR», Const.«Year»])) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?YEAR», Const.«Month»])]), numLit "12"])))
axiom ax_1722 : ∀ («?MONTH» : Obj) («?NUMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MONTH», Const.«Month»]), ap (Const.«duration») ([«?MONTH», ap (Const.«MeasureFn») ([«?NUMBER», Const.«DayDuration»])])]) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?MONTH», Const.«Day»])]), «?NUMBER»])))
axiom ax_1723 : ∀ («?WEEK» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WEEK», Const.«Week»])) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?WEEK», Const.«Day»])]), numLit "7"])))
axiom ax_1724 : ∀ («?DAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DAY», Const.«Day»])) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?DAY», Const.«Hour»])]), numLit "24"])))
axiom ax_1725 : ∀ («?HOUR» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HOUR», Const.«Hour»])) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?HOUR», Const.«Minute»])]), numLit "60"])))
axiom ax_1726 : ∀ («?MINUTE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MINUTE», Const.«Minute»])) (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([ap (Const.«TemporalCompositionFn») ([«?MINUTE», Const.«Second»])]), numLit "60"])))
axiom ax_1727 : Holds (ap (Const.«instance») ([Const.«connected», Const.«BinaryPredicate»]))
axiom ax_1728 : Holds (ap (Const.«instance») ([Const.«connected», Const.«SpatialRelation»]))
axiom ax_1729 : Holds (ap (Const.«instance») ([Const.«connected», Const.«ReflexiveRelation»]))
axiom ax_1730 : Holds (ap (Const.«instance») ([Const.«connected», Const.«SymmetricRelation»]))
axiom ax_1731 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«connected») ([«?OBJ1», «?OBJ2»])) (mkOr [ap (Const.«meetsSpatially») ([«?OBJ1», «?OBJ2»]), ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])]))
axiom ax_1732 : ∀ («?OBJ» : Obj) («?PART1» : Obj) («?PART2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»]), ap (Const.«equal») ([«?OBJ», ap (Const.«MereologicalSumFn») ([«?PART1», «?PART2»])])]) (ap (Const.«connected») ([«?PART1», «?PART2»])))
axiom ax_1733 : ∀ («?OBJ» : Obj) («?PART1» : Obj) («?PART2» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([«?OBJ», ap (Const.«MereologicalSumFn») ([«?PART1», «?PART2»])]), ap (Const.«connected») ([«?PART1», «?PART2»])]) (ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»])))
axiom ax_1734 : Holds (ap (Const.«instance») ([Const.«connects», Const.«SpatialRelation»]))
axiom ax_1735 : Holds (ap (Const.«instance») ([Const.«connects», Const.«TernaryPredicate»]))
axiom ax_1736 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«connects») ([«?OBJ1», «?OBJ2», «?OBJ3»])) (ap (Const.«between») ([«?OBJ2», «?OBJ1», «?OBJ3»])))
axiom ax_1737 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«between») ([«?OBJ2», «?OBJ1», «?OBJ3»])) (ap (Const.«connects») ([«?OBJ1», «?OBJ2», «?OBJ3»])))
axiom ax_1738 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«connects») ([«?OBJ1», «?OBJ2», «?OBJ3»])) (mkAnd [ap (Const.«connected») ([«?OBJ1», «?OBJ2»]), ap (Const.«connected») ([«?OBJ1», «?OBJ3»]), mkNot (ap (Const.«connected») ([«?OBJ2», «?OBJ3»]))]))
axiom ax_1739 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (mkAnd [ap (Const.«connected») ([«?OBJ1», «?OBJ2»]), ap (Const.«connected») ([«?OBJ1», «?OBJ3»]), mkNot (ap (Const.«connected») ([«?OBJ2», «?OBJ3»]))]) (ap (Const.«connects») ([«?OBJ1», «?OBJ2», «?OBJ3»])))
axiom ax_1740 : ∀ («?ARC» : Obj) («?NODE1» : Obj) («?NODE2» : Obj), Holds (mkImp (ap (Const.«connects») ([«?ARC», «?NODE1», «?NODE2»])) (ap (Const.«connects») ([«?ARC», «?NODE2», «?NODE1»])))
axiom ax_1741 : Holds (ap (Const.«relatedInternalConcept») ([Const.«meetsSpatially», Const.«connected»]))
axiom ax_1742 : Holds (ap (Const.«instance») ([Const.«meetsSpatially», Const.«IrreflexiveRelation»]))
axiom ax_1743 : Holds (ap (Const.«instance») ([Const.«meetsSpatially», Const.«SymmetricRelation»]))
axiom ax_1744 : Holds (ap (Const.«instance») ([Const.«meetsSpatially», Const.«BinaryPredicate»]))
axiom ax_1745 : Holds (ap (Const.«disjointRelation») ([Const.«meetsSpatially», Const.«overlapsSpatially»]))
axiom ax_1746 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])) (mkExists (fun («?OBJ3» : Obj) => mkAnd [ap (Const.«part») ([«?OBJ3», «?OBJ1»]), ap (Const.«part») ([«?OBJ3», «?OBJ2»])])))
axiom ax_1747 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (mkAnd [ap (Const.«part») ([«?OBJ3», «?OBJ1»]), ap (Const.«part») ([«?OBJ3», «?OBJ2»])]) (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])))
axiom ax_1748 : ∀ («?COLL» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«member») ([«?OBJ1», «?COLL»]), ap (Const.«member») ([«?OBJ2», «?COLL»]), mkNot (ap (Const.«equal») ([«?OBJ1», «?OBJ2»]))]) (mkNot (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»]))))
axiom ax_1749 : ∀ («?OBJ» : Obj) («?PROCESS» : Obj) («?REL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REL», Const.«CaseRole»]), ap (Const.«instance») ([«?OBJ», Const.«Object»]), ap («?REL») ([«?PROCESS», «?OBJ»])]) (mkExists (fun («?TIME» : Obj) => ap (Const.«overlapsSpatially») ([ap (Const.«WhereFn») ([«?PROCESS», «?TIME»]), «?OBJ»]))))
axiom ax_1750 : Holds (ap (Const.«instance») ([Const.«overlapsPartially», Const.«BinaryPredicate»]))
axiom ax_1751 : Holds (ap (Const.«instance») ([Const.«overlapsPartially», Const.«SymmetricRelation»]))
axiom ax_1752 : Holds (ap (Const.«instance») ([Const.«overlapsPartially», Const.«PartialValuedRelation»]))
axiom ax_1753 : Holds (ap (Const.«instance») ([Const.«overlapsPartially», Const.«IrreflexiveRelation»]))
axiom ax_1754 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«overlapsPartially») ([«?OBJ1», «?OBJ2»])) (mkAnd [mkNot (ap (Const.«part») ([«?OBJ1», «?OBJ2»])), mkNot (ap (Const.«part») ([«?OBJ2», «?OBJ1»])), mkExists (fun («?OBJ3» : Obj) => mkAnd [ap (Const.«part») ([«?OBJ3», «?OBJ1»]), ap (Const.«part») ([«?OBJ3», «?OBJ2»])])]))
axiom ax_1755 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (mkAnd [mkNot (ap (Const.«part») ([«?OBJ1», «?OBJ2»])), mkNot (ap (Const.«part») ([«?OBJ2», «?OBJ1»])), mkAnd [ap (Const.«part») ([«?OBJ3», «?OBJ1»]), ap (Const.«part») ([«?OBJ3», «?OBJ2»])]]) (ap (Const.«overlapsPartially») ([«?OBJ1», «?OBJ2»])))
axiom ax_1756 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«overlapsPartially») ([«?OBJ1», «?OBJ2»])) (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])))
axiom ax_1757 : ∀ («?PART» : Obj) («?WHOLE» : Obj), Holds (mkImp (ap (Const.«superficialPart») ([«?PART», «?WHOLE»])) (ap (Const.«part») ([«?PART», «?WHOLE»])))
axiom ax_1758 : Holds (ap (Const.«instance») ([Const.«superficialPart», Const.«IrreflexiveRelation»]))
axiom ax_1759 : Holds (ap (Const.«instance») ([Const.«superficialPart», Const.«TransitiveRelation»]))
axiom ax_1760 : Holds (ap (Const.«instance») ([Const.«superficialPart», Const.«PartialValuedRelation»]))
axiom ax_1761 : Holds (ap (Const.«instance») ([Const.«superficialPart», Const.«BinaryPredicate»]))
axiom ax_1762 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«superficialPart») ([«?OBJ1», «?OBJ2»])) (mkAnd [mkNot (ap (Const.«interiorPart») ([«?OBJ1», «?OBJ2»])), mkNot (mkExists (fun («?OBJ3» : Obj) => ap (Const.«interiorPart») ([«?OBJ3», «?OBJ1»])))]))
axiom ax_1763 : Holds (ap (Const.«instance») ([Const.«surface», Const.«AsymmetricRelation»]))
axiom ax_1764 : Holds (ap (Const.«instance») ([Const.«surface», Const.«BinaryPredicate»]))
axiom ax_1765 : Holds (ap (Const.«subrelation») ([Const.«surface», Const.«superficialPart»]))
axiom ax_1766 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«surface») ([«?OBJ1», «?OBJ2»])) (mkForall (fun («?OBJ3» : Obj) => mkImp (ap (Const.«superficialPart») ([«?OBJ3», «?OBJ2»])) (ap (Const.«part») ([«?OBJ3», «?OBJ1»])))))
axiom ax_1767 : Holds (ap (Const.«subrelation») ([Const.«interiorPart», Const.«part»]))
axiom ax_1768 : Holds (ap (Const.«instance») ([Const.«interiorPart», Const.«AsymmetricRelation»]))
axiom ax_1769 : Holds (ap (Const.«instance») ([Const.«interiorPart», Const.«TransitiveRelation»]))
axiom ax_1770 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«interiorPart») ([«?OBJ1», «?OBJ2»])) (mkForall (fun («?PART» : Obj) => mkImp (ap (Const.«superficialPart») ([«?PART», «?OBJ2»])) (mkNot (ap (Const.«overlapsSpatially») ([«?OBJ1», «?PART»]))))))
axiom ax_1771 : Holds (ap (Const.«subrelation») ([Const.«bottom», Const.«superficialPart»]))
axiom ax_1772 : Holds (ap (Const.«instance») ([Const.«bottom», Const.«BinaryPredicate»]))
axiom ax_1773 : ∀ («?BOTTOM» : Obj) («?OBJECT» : Obj) («?PART» : Obj), Holds (mkImp (mkAnd [ap (Const.«bottom») ([«?BOTTOM», «?OBJECT»]), ap (Const.«part») ([«?PART», «?OBJECT»]), mkNot (ap (Const.«connected») ([«?PART», «?BOTTOM»]))]) (ap (Const.«orientation») ([«?PART», «?BOTTOM», Const.«Above»])))
axiom ax_1774 : Holds (ap (Const.«subrelation») ([Const.«top», Const.«superficialPart»]))
axiom ax_1775 : Holds (ap (Const.«instance») ([Const.«top», Const.«BinaryPredicate»]))
axiom ax_1776 : ∀ («?OBJECT» : Obj) («?PART» : Obj) («?TOP» : Obj), Holds (mkImp (mkAnd [ap (Const.«top») ([«?TOP», «?OBJECT»]), ap (Const.«part») ([«?PART», «?OBJECT»]), mkNot (ap (Const.«connected») ([«?PART», «?TOP»]))]) (ap (Const.«orientation») ([«?PART», «?TOP», Const.«Below»])))
axiom ax_1777 : Holds (ap (Const.«subrelation») ([Const.«side», Const.«superficialPart»]))
axiom ax_1778 : Holds (ap (Const.«instance») ([Const.«side», Const.«BinaryPredicate»]))
axiom ax_1779 : ∀ («?OBJECT» : Obj) («?PART» : Obj) («?SIDE» : Obj), Holds (mkImp (mkAnd [ap (Const.«side») ([«?SIDE», «?OBJECT»]), ap (Const.«part») ([«?PART», «?OBJECT»]), mkNot (ap (Const.«connected») ([«?PART», «?SIDE»]))]) (mkExists (fun («?DIRECT» : Obj) => ap (Const.«orientation») ([«?SIDE», «?PART», «?DIRECT»]))))
axiom ax_1780 : ∀ («?O» : Obj) («?S» : Obj) («?TOP» : Obj), Holds (mkImp (mkAnd [ap (Const.«top») ([«?TOP», «?O»]), ap (Const.«side») ([«?S», «?O»])]) (mkNot (ap (Const.«equal») ([«?TOP», «?S»]))))
axiom ax_1781 : ∀ («?OBJECT» : Obj) («?WIDTH» : Obj), Holds (mkImp (ap (Const.«width») ([«?OBJECT», «?WIDTH»])) (mkExists (fun («?SIDE1» : Obj) => mkExists (fun («?SIDE2» : Obj) => mkAnd [ap (Const.«side») ([«?SIDE1», «?OBJECT»]), ap (Const.«side») ([«?SIDE2», «?OBJECT»]), ap (Const.«distance») ([«?SIDE1», «?SIDE2», «?WIDTH»])]))))
axiom ax_1782 : ∀ («?OBJECT» : Obj) («?SIDE1» : Obj) («?SIDE2» : Obj) («?WIDTH» : Obj), Holds (mkImp (mkAnd [ap (Const.«side») ([«?SIDE1», «?OBJECT»]), ap (Const.«side») ([«?SIDE2», «?OBJECT»]), ap (Const.«distance») ([«?SIDE1», «?SIDE2», «?WIDTH»])]) (ap (Const.«width») ([«?OBJECT», «?WIDTH»])))
axiom ax_1783 : ∀ («?BOTTOM» : Obj) («?HEIGHT» : Obj) («?OBJECT» : Obj) («?TOP» : Obj), Holds (mkImp (mkAnd [ap (Const.«height») ([«?OBJECT», «?HEIGHT»]), ap (Const.«top») ([«?TOP», «?OBJECT»]), ap (Const.«bottom») ([«?BOTTOM», «?OBJECT»])]) (ap (Const.«distance») ([«?TOP», «?BOTTOM», «?HEIGHT»])))
axiom ax_1784 : Holds (ap (Const.«instance») ([Const.«MereologicalSumFn», Const.«SpatialRelation»]))
axiom ax_1785 : Holds (ap (Const.«instance») ([Const.«MereologicalSumFn», Const.«BinaryFunction»]))
axiom ax_1786 : Holds (ap (Const.«instance») ([Const.«MereologicalSumFn», Const.«TotalValuedRelation»]))
axiom ax_1787 : Holds (ap (Const.«relatedInternalConcept») ([Const.«MereologicalSumFn», Const.«MereologicalProductFn»]))
axiom ax_1788 : Holds (ap (Const.«relatedInternalConcept») ([Const.«MereologicalSumFn», Const.«MereologicalDifferenceFn»]))
axiom ax_1789 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«equal») ([«?OBJ3», ap (Const.«MereologicalSumFn») ([«?OBJ1», «?OBJ2»])])) (mkForall (fun («?PART» : Obj) => mkIff (ap (Const.«part») ([«?PART», «?OBJ3»])) (mkOr [ap (Const.«part») ([«?PART», «?OBJ1»]), ap (Const.«part») ([«?PART», «?OBJ2»])]))))
axiom ax_1790 : Holds (ap (Const.«instance») ([Const.«MereologicalProductFn», Const.«SpatialRelation»]))
axiom ax_1791 : Holds (ap (Const.«instance») ([Const.«MereologicalProductFn», Const.«BinaryFunction»]))
axiom ax_1792 : Holds (ap (Const.«instance») ([Const.«MereologicalProductFn», Const.«TotalValuedRelation»]))
axiom ax_1793 : Holds (ap (Const.«relatedInternalConcept») ([Const.«MereologicalProductFn», Const.«MereologicalDifferenceFn»]))
axiom ax_1794 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«equal») ([«?OBJ3», ap (Const.«MereologicalProductFn») ([«?OBJ1», «?OBJ2»])])) (mkForall (fun («?PART» : Obj) => mkIff (ap (Const.«part») ([«?PART», «?OBJ3»])) (mkAnd [ap (Const.«part») ([«?PART», «?OBJ1»]), ap (Const.«part») ([«?PART», «?OBJ2»])]))))
axiom ax_1795 : Holds (ap (Const.«instance») ([Const.«MereologicalDifferenceFn», Const.«SpatialRelation»]))
axiom ax_1796 : Holds (ap (Const.«instance») ([Const.«MereologicalDifferenceFn», Const.«BinaryFunction»]))
axiom ax_1797 : Holds (ap (Const.«instance») ([Const.«MereologicalDifferenceFn», Const.«TotalValuedRelation»]))
axiom ax_1798 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«equal») ([«?OBJ3», ap (Const.«MereologicalDifferenceFn») ([«?OBJ1», «?OBJ2»])])) (mkForall (fun («?PART» : Obj) => mkIff (ap (Const.«properPart») ([«?PART», «?OBJ3»])) (mkAnd [ap (Const.«properPart») ([«?PART», «?OBJ1»]), mkNot (ap (Const.«properPart») ([«?PART», «?OBJ2»]))]))))
axiom ax_1799 : Holds (ap (Const.«subclass») ([Const.«HoleRegion», Const.«Region»]))
axiom ax_1800 : ∀ («?HOLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HOLE», Const.«HoleRegion»])) (mkExists (fun («?OBJ» : Obj) => ap (Const.«hole») ([«?HOLE», «?OBJ»]))))
axiom ax_1801 : ∀ («?HOLE» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«hole») ([«?HOLE», «?OBJ»])) (ap (Const.«instance») ([«?HOLE», Const.«HoleRegion»])))
axiom ax_1802 : ∀ («?HOLE» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«hole») ([«?HOLE», «?OBJ»])) (mkNot (ap (Const.«instance») ([«?OBJ», Const.«HoleRegion»]))))
axiom ax_1803 : ∀ («?HOLE» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«hole») ([«?HOLE», «?OBJ»])) (mkNot (ap (Const.«overlapsSpatially») ([«?HOLE», «?OBJ»]))))
axiom ax_1804 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«hole») ([«?HOLE», «?OBJ1»]), ap (Const.«hole») ([«?HOLE», «?OBJ2»])]) (mkExists (fun («?OBJ3» : Obj) => mkAnd [ap (Const.«properPart») ([«?OBJ3», ap (Const.«MereologicalProductFn») ([«?OBJ1», «?OBJ2»])]), ap (Const.«hole») ([«?HOLE», «?OBJ3»])])))
axiom ax_1805 : ∀ («?HOLE1» : Obj) («?HOLE2» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«hole») ([«?HOLE1», «?OBJ»]), ap (Const.«hole») ([«?HOLE2», «?OBJ»])]) (mkForall (fun («?HOLE3» : Obj) => mkImp (ap (Const.«part») ([«?HOLE3», ap (Const.«MereologicalSumFn») ([«?HOLE1», «?HOLE2»])])) (ap (Const.«hole») ([«?HOLE3», «?OBJ»])))))
axiom ax_1806 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«hole») ([«?HOLE», «?OBJ1»]), ap (Const.«part») ([«?OBJ1», «?OBJ2»])]) (mkOr [ap (Const.«overlapsSpatially») ([«?HOLE», «?OBJ2»]), ap (Const.«hole») ([«?HOLE», «?OBJ2»])]))
axiom ax_1807 : ∀ («?HOLE1» : Obj) («?HOLE2» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«hole») ([«?HOLE1», «?OBJ1»]), ap (Const.«hole») ([«?HOLE2», «?OBJ2»]), ap (Const.«overlapsSpatially») ([«?HOLE1», «?HOLE2»])]) (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»])))
axiom ax_1808 : ∀ («?HOLE1» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HOLE1», Const.«HoleRegion»])) (mkExists (fun («?HOLE2» : Obj) => ap (Const.«properPart») ([«?HOLE2», «?HOLE1»]))))
axiom ax_1809 : Holds (ap (Const.«instance») ([Const.«HoleHostFn», Const.«UnaryFunction»]))
axiom ax_1810 : ∀ («?HOLE» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«hole») ([«?HOLE», «?OBJ»])) (ap (Const.«connected») ([«?HOLE», «?OBJ»])))
axiom ax_1811 : ∀ («?HOLE1» : Obj) («?HOLE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HOLE1», Const.«HoleRegion»]), ap (Const.«properPart») ([«?HOLE2», «?HOLE1»])]) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«meetsSpatially») ([«?HOLE1», «?OBJ»]), mkNot (ap (Const.«meetsSpatially») ([«?HOLE2», «?OBJ»]))])))
axiom ax_1812 : Holds (ap (Const.«instance») ([Const.«Fillable», Const.«ShapeAttribute»]))
axiom ax_1813 : ∀ («?HOLE» : Obj) («?OBJ» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«fills») ([«?OBJ», «?HOLE»])])) (ap (Const.«attribute») ([«?HOLE», Const.«Fillable»])))
axiom ax_1814 : ∀ («?HOLE1» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?HOLE1», Const.«Fillable»])) (mkExists (fun («?HOLE2» : Obj) => mkAnd [ap (Const.«instance») ([«?HOLE2», Const.«HoleRegion»]), ap (Const.«part») ([«?HOLE1», «?HOLE2»])])))
axiom ax_1815 : ∀ («?HOLE1» : Obj) («?HOLE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HOLE2», Const.«HoleRegion»]), ap (Const.«part») ([«?HOLE1», «?HOLE2»])]) (ap (Const.«attribute») ([«?HOLE1», Const.«Fillable»])))
axiom ax_1816 : Holds (ap (Const.«subrelation») ([Const.«partiallyFills», Const.«located»]))
axiom ax_1817 : Holds (ap (Const.«instance») ([Const.«partiallyFills», Const.«SpatialRelation»]))
axiom ax_1818 : Holds (ap (Const.«instance») ([Const.«partiallyFills», Const.«AsymmetricRelation»]))
axiom ax_1819 : ∀ («?HOLE1» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«partiallyFills») ([«?OBJ», «?HOLE1»])) (mkExists (fun («?HOLE2» : Obj) => mkAnd [ap (Const.«part») ([«?HOLE2», «?HOLE1»]), ap (Const.«completelyFills») ([«?OBJ», «?HOLE2»])])))
axiom ax_1820 : ∀ («?HOLE1» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«properlyFills») ([«?OBJ», «?HOLE1»])) (mkExists (fun («?HOLE2» : Obj) => mkAnd [ap (Const.«part») ([«?HOLE2», «?HOLE1»]), ap (Const.«fills») ([«?OBJ», «?HOLE2»])])))
axiom ax_1821 : Holds (ap (Const.«instance») ([Const.«completelyFills», Const.«AsymmetricRelation»]))
axiom ax_1822 : Holds (ap (Const.«subrelation») ([Const.«completelyFills», Const.«partiallyFills»]))
axiom ax_1823 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj), Holds (mkImp (ap (Const.«completelyFills») ([«?OBJ1», «?HOLE»])) (mkExists (fun («?OBJ2» : Obj) => mkAnd [ap (Const.«part») ([«?OBJ2», «?OBJ1»]), ap (Const.«fills») ([«?OBJ2», «?HOLE»])])))
axiom ax_1824 : Holds (ap (Const.«instance») ([Const.«fills», Const.«AsymmetricRelation»]))
axiom ax_1825 : Holds (ap (Const.«subrelation») ([Const.«fills», Const.«completelyFills»]))
axiom ax_1826 : Holds (ap (Const.«subrelation») ([Const.«fills», Const.«properlyFills»]))
axiom ax_1827 : Holds (ap (Const.«relatedInternalConcept») ([Const.«fills», Const.«Fillable»]))
axiom ax_1828 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«fills») ([«?OBJ1», «?HOLE»]), ap (Const.«attribute») ([«?OBJ2», Const.«Fillable»])]) (mkNot (ap (Const.«overlapsSpatially») ([«?OBJ1», «?OBJ2»]))))
axiom ax_1829 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj), Holds (mkImp (ap (Const.«completelyFills») ([«?OBJ1», «?HOLE»])) (mkForall (fun («?OBJ2» : Obj) => mkImp (ap (Const.«connected») ([«?OBJ2», «?HOLE»])) (ap (Const.«connected») ([«?OBJ2», «?OBJ1»])))))
axiom ax_1830 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«properlyFills») ([«?OBJ1», «?HOLE»]), ap (Const.«connected») ([«?OBJ2», «?OBJ1»])]) (ap (Const.«connected») ([«?HOLE», «?OBJ2»])))
axiom ax_1831 : ∀ («?HOLE1» : Obj) («?HOLE2» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«fills») ([«?OBJ», «?HOLE1»]), ap (Const.«properPart») ([«?HOLE2», «?HOLE1»])]) (ap (Const.«completelyFills») ([«?OBJ», «?HOLE2»])))
axiom ax_1832 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«fills») ([«?OBJ1», «?HOLE»]), ap (Const.«properPart») ([«?OBJ2», «?OBJ1»])]) (ap (Const.«properlyFills») ([«?OBJ2», «?HOLE»])))
axiom ax_1833 : Holds (ap (Const.«instance») ([Const.«HoleSkinFn», Const.«UnaryFunction»]))
axiom ax_1834 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«equal») ([«?OBJ1», ap (Const.«HoleSkinFn») ([«?HOLE»])])) (mkImp (ap (Const.«overlapsSpatially») ([«?OBJ2», «?OBJ1»])) (mkExists (fun («?OBJ3» : Obj) => mkAnd [ap (Const.«superficialPart») ([«?OBJ3», ap (Const.«HoleHostFn») ([«?HOLE»])]), ap (Const.«meetsSpatially») ([«?HOLE», «?OBJ3»]), ap (Const.«overlapsSpatially») ([«?OBJ2», «?OBJ3»])]))))
axiom ax_1835 : ∀ («?HOLE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (ap (Const.«equal») ([«?OBJ1», ap (Const.«HoleSkinFn») ([«?HOLE»])])) (mkImp (mkAnd [ap (Const.«superficialPart») ([«?OBJ3», ap (Const.«HoleHostFn») ([«?HOLE»])]), ap (Const.«meetsSpatially») ([«?HOLE», «?OBJ3»]), ap (Const.«overlapsSpatially») ([«?OBJ2», «?OBJ3»])]) (ap (Const.«overlapsSpatially») ([«?OBJ2», «?OBJ1»]))))
axiom ax_1836 : ∀ («?PROC» : Obj) («?SUBPROC» : Obj), Holds (mkImp (ap (Const.«subProcess») ([«?SUBPROC», «?PROC»])) (ap (Const.«temporalPart») ([ap (Const.«WhenFn») ([«?SUBPROC»]), ap (Const.«WhenFn») ([«?PROC»])])))
axiom ax_1837 : Holds (ap (Const.«subclass») ([Const.«BiologicalProcess», Const.«InternalChange»]))
axiom ax_1838 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«BiologicalProcess»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«Organism»]), ap (Const.«eventLocated») ([«?PROC», «?OBJ»])])))
axiom ax_1839 : ∀ («?ORG» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«BiologicalProcess»]), ap (Const.«experiencer») ([«?PROC», «?ORG»])]) (ap (Const.«instance») ([«?ORG», Const.«Organism»])))
axiom ax_1840 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Organism»])) (mkNot (ap (Const.«capability») ([Const.«BiologicalProcess», Const.«agent», «?O»]))))
axiom ax_1841 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Organism»])) (ap (Const.«capability») ([Const.«BiologicalProcess», Const.«experiencer», «?O»])))
axiom ax_1842 : Holds (ap (Const.«subclass») ([Const.«PhysiologicProcess», Const.«BiologicalProcess»]))
axiom ax_1843 : Holds (ap (Const.«subclass») ([Const.«AutonomicProcess», Const.«PhysiologicProcess»]))
axiom ax_1844 : Holds (ap (Const.«disjoint») ([Const.«AutonomicProcess», Const.«IntentionalProcess»]))
axiom ax_1845 : Holds (ap (Const.«subclass») ([Const.«OrganOrTissueProcess», Const.«AutonomicProcess»]))
axiom ax_1846 : Holds (ap (Const.«disjoint») ([Const.«OrganOrTissueProcess», Const.«OrganismProcess»]))
axiom ax_1847 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«OrganOrTissueProcess»])) (mkExists (fun («?THING» : Obj) => mkAnd [ap (Const.«eventLocated») ([«?PROC», «?THING»]), mkOr [ap (Const.«instance») ([«?THING», Const.«Organ»]), ap (Const.«instance») ([«?THING», Const.«Tissue»])]])))
axiom ax_1848 : Holds (ap (Const.«subclass») ([Const.«OrganismProcess», Const.«PhysiologicProcess»]))
axiom ax_1849 : Holds (ap (Const.«subclass») ([Const.«Birth», Const.«OrganismProcess»]))
axiom ax_1850 : ∀ («?AGENT» : Obj) («?BIRTH» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BIRTH», Const.«Birth»]), ap (Const.«experiencer») ([«?BIRTH», «?AGENT»])]) (mkExists (fun («?DEATH» : Obj) => mkAnd [ap (Const.«instance») ([«?DEATH», Const.«Death»]), ap (Const.«experiencer») ([«?DEATH», «?AGENT»])])))
axiom ax_1851 : Holds (ap (Const.«subclass») ([Const.«Death», Const.«OrganismProcess»]))
axiom ax_1852 : ∀ («?DEATH» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DEATH», Const.«Death»]), ap (Const.«instance») ([«?ORG», Const.«Organism»]), ap (Const.«experiencer») ([«?DEATH», «?ORG»])]) (mkExists (fun («?REM» : Obj) => mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«result») ([«?DEATH», «?REM»]), ap (Const.«instance») ([«?REM», Const.«OrganicObject»]), ap (Const.«holdsDuring») ([ap (Const.«FutureFn») ([ap (Const.«WhenFn») ([«?DEATH»])]), ap (Const.«attribute») ([«?REM», Const.«Dead»])]), mkImp (ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([ap (Const.«WhenFn») ([«?DEATH»])]), ap (Const.«part») ([«?OBJ», «?REM»])])) (ap (Const.«holdsDuring») ([ap (Const.«ImmediatePastFn») ([ap (Const.«WhenFn») ([«?DEATH»])]), ap (Const.«part») ([«?OBJ», «?ORG»])]))]))))
axiom ax_1853 : Holds (ap (Const.«subclass») ([Const.«Breathing», Const.«OrganismProcess»]))
axiom ax_1854 : Holds (ap (Const.«subclass») ([Const.«Breathing», Const.«AutonomicProcess»]))
axiom ax_1855 : Holds (ap (Const.«subclass») ([Const.«Ingesting», Const.«OrganismProcess»]))
axiom ax_1856 : Holds (ap (Const.«subclass») ([Const.«Ingesting», Const.«Transfer»]))
axiom ax_1857 : ∀ («?ACT» : Obj) («?F» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«Ingesting»]), ap (Const.«resource») ([«?ACT», «?F»])]) (mkOr [ap (Const.«instance») ([«?F», ap (Const.«FoodForFn») ([Const.«Organism»])]), ap (Const.«instance») ([«?F», Const.«Medicine»])]))
axiom ax_1858 : Holds (ap (Const.«subclass») ([Const.«Eating», Const.«Ingesting»]))
axiom ax_1859 : ∀ («?ACT» : Obj) («?FOOD» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«Eating»]), ap (Const.«resource») ([«?ACT», «?FOOD»])]) (ap (Const.«attribute») ([«?FOOD», Const.«Solid»])))
axiom ax_1860 : Holds (ap (Const.«subclass») ([Const.«Drinking», Const.«Ingesting»]))
axiom ax_1861 : ∀ («?ACT» : Obj) («?FOOD» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«Drinking»]), ap (Const.«resource») ([«?ACT», «?FOOD»])]) (ap (Const.«attribute») ([«?FOOD», Const.«Liquid»])))
axiom ax_1862 : Holds (ap (Const.«subclass») ([Const.«Digesting», Const.«OrganismProcess»]))
axiom ax_1863 : Holds (ap (Const.«subclass») ([Const.«Digesting», Const.«AutonomicProcess»]))
axiom ax_1864 : ∀ («?DIGEST» : Obj) («?ORGANISM» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DIGEST», Const.«Digesting»]), ap (Const.«agent») ([«?DIGEST», «?ORGANISM»])]) (mkExists (fun («?INGEST» : Obj) => mkAnd [ap (Const.«instance») ([«?INGEST», Const.«Ingesting»]), ap (Const.«agent») ([«?INGEST», «?ORGANISM»]), ap (Const.«overlapsTemporally») ([ap (Const.«WhenFn») ([«?INGEST»]), ap (Const.«WhenFn») ([«?DIGEST»])])])))
axiom ax_1865 : ∀ («?DIGEST» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DIGEST», Const.«Digesting»])) (mkExists (fun («?DECOMP» : Obj) => mkAnd [ap (Const.«instance») ([«?DECOMP», Const.«ChemicalDecomposition»]), ap (Const.«subProcess») ([«?DECOMP», «?DIGEST»])])))
axiom ax_1866 : Holds (ap (Const.«subclass») ([Const.«Growth», Const.«AutonomicProcess»]))
axiom ax_1867 : Holds (ap (Const.«subclass») ([Const.«Replication», Const.«OrganismProcess»]))
axiom ax_1868 : ∀ («?CHILD» : Obj) («?PARENT» : Obj) («?REP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REP», Const.«Replication»]), ap (Const.«agent») ([«?REP», «?PARENT»]), ap (Const.«result») ([«?REP», «?CHILD»])]) (ap (Const.«parent») ([«?CHILD», «?PARENT»])))
axiom ax_1869 : ∀ («?REP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REP», Const.«Replication»])) (mkExists (fun («?BODY» : Obj) => mkAnd [ap (Const.«instance») ([«?BODY», Const.«ReproductiveBody»]), ap (Const.«result») ([«?REP», «?BODY»])])))
axiom ax_1870 : Holds (ap (Const.«subclass») ([Const.«SexualReproduction», Const.«Replication»]))
axiom ax_1871 : Holds (ap (Const.«disjoint») ([Const.«SexualReproduction», Const.«AsexualReproduction»]))
axiom ax_1872 : ∀ («?ORGANISM» : Obj) («?REP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REP», Const.«SexualReproduction»]), ap (Const.«result») ([«?REP», «?ORGANISM»])]) (mkExists (fun («?MOTHER» : Obj) => mkExists (fun («?FATHER» : Obj) => mkAnd [ap (Const.«mother») ([«?ORGANISM», «?MOTHER»]), ap (Const.«father») ([«?ORGANISM», «?FATHER»])]))))
axiom ax_1873 : Holds (ap (Const.«subclass») ([Const.«AsexualReproduction», Const.«Replication»]))
axiom ax_1874 : ∀ («?ORGANISM» : Obj) («?PARENT1» : Obj) («?PARENT2» : Obj) («?REP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REP», Const.«AsexualReproduction»]), ap (Const.«result») ([«?REP», «?ORGANISM»]), ap (Const.«parent») ([«?ORGANISM», «?PARENT1»]), ap (Const.«parent») ([«?ORGANISM», «?PARENT2»])]) (ap (Const.«equal») ([«?PARENT1», «?PARENT2»])))
axiom ax_1875 : Holds (ap (Const.«subclass») ([Const.«PsychologicalProcess», Const.«BiologicalProcess»]))
axiom ax_1876 : ∀ («?PROCESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROCESS», Const.«PsychologicalProcess»])) (mkExists (fun («?ANIMAL» : Obj) => mkAnd [ap (Const.«instance») ([«?ANIMAL», Const.«Animal»]), ap (Const.«experiencer») ([«?PROCESS», «?ANIMAL»])])))
axiom ax_1877 : Holds (ap (Const.«subclass») ([Const.«PathologicProcess», Const.«BiologicalProcess»]))
axiom ax_1878 : Holds (ap (Const.«disjoint») ([Const.«PathologicProcess», Const.«PhysiologicProcess»]))
axiom ax_1879 : ∀ («?ORG» : Obj) («?PATH» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PATH», Const.«PathologicProcess»]), ap (Const.«experiencer») ([«?PATH», «?ORG»])]) (mkExists (fun («?PART» : Obj) => mkExists (fun («?DISEASE» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?ORG»]), ap (Const.«instance») ([«?DISEASE», Const.«DiseaseOrSyndrome»]), ap (Const.«attribute») ([«?PART», «?DISEASE»])]))))
axiom ax_1880 : Holds (ap (Const.«instance») ([Const.«pathologicSymptom», Const.«BinaryPredicate»]))
axiom ax_1881 : ∀ («?D» : Obj) («?S» : Obj), Holds (mkImp (ap (Const.«pathologicSymptom») ([«?D», «?S»])) (mkExists (fun («?O» : Obj) => ap (Const.«increasesLikelihood») ([ap (Const.«attribute») ([«?O», «?D»]), mkExists (fun («?I» : Obj) => mkAnd [ap (Const.«instance») ([«?I», «?S»]), ap (Const.«experiencer») ([«?I», «?O»])])]))))
axiom ax_1882 : Holds (ap (Const.«subclass») ([Const.«Injuring», Const.«PathologicProcess»]))
axiom ax_1883 : Holds (ap (Const.«subclass») ([Const.«Injuring», Const.«Damaging»]))
axiom ax_1884 : ∀ («?INJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INJ», Const.«Injuring»])) (mkExists (fun («?STRUCT» : Obj) => mkAnd [ap (Const.«instance») ([«?STRUCT», Const.«AnatomicalStructure»]), ap (Const.«patient») ([«?INJ», «?STRUCT»])])))
axiom ax_1885 : ∀ («?INJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INJ», Const.«Injuring»])) (mkAnd [ap (Const.«instance») ([«?INJ», Const.«Damaging»]), mkExists (fun («?ORGANISM» : Obj) => mkAnd [ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«patient») ([«?INJ», «?ORGANISM»])])]))
axiom ax_1886 : ∀ («?INJ» : Obj) («?ORGANISM» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INJ», Const.«Damaging»]), ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«patient») ([«?INJ», «?ORGANISM»])]) (ap (Const.«instance») ([«?INJ», Const.«Injuring»])))
axiom ax_1887 : Holds (ap (Const.«subclass») ([Const.«Poisoning», Const.«Injuring»]))
axiom ax_1888 : ∀ («?POISON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?POISON», Const.«Poisoning»])) (mkExists (fun («?THING» : Obj) => mkAnd [ap (Const.«patient») ([«?POISON», «?THING»]), mkOr [ap (Const.«instance») ([«?THING», Const.«Organism»]), ap (Const.«instance») ([«?THING», Const.«AnatomicalStructure»])]])))
axiom ax_1889 : ∀ («?POISON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?POISON», Const.«Poisoning»])) (mkExists (fun («?SUBSTANCE» : Obj) => mkAnd [ap (Const.«instance») ([«?SUBSTANCE», Const.«BiologicallyActiveSubstance»]), ap (Const.«instrument») ([«?POISON», «?SUBSTANCE»])])))
axiom ax_1890 : Holds (ap (Const.«subclass») ([Const.«NaturalProcess», Const.«Process»]))
axiom ax_1891 : Holds (ap (Const.«disjoint») ([Const.«NaturalProcess», Const.«IntentionalProcess»]))
axiom ax_1892 : Holds (ap (Const.«subclass») ([Const.«IntentionalProcess», Const.«Process»]))
axiom ax_1893 : ∀ («?AGENT» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«IntentionalProcess»]), ap (Const.«agent») ([«?PROC», «?AGENT»])]) (mkExists (fun («?PURP» : Obj) => ap (Const.«hasPurposeForAgent») ([«?PROC», «?PURP», «?AGENT»]))))
axiom ax_1894 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«IntentionalProcess»])) (mkExists (fun («?AGENT» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»]), ap (Const.«agent») ([«?PROC», «?AGENT»])])))
axiom ax_1895 : ∀ («?HUMAN» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«IntentionalProcess»]), ap (Const.«agent») ([«?PROC», «?HUMAN»]), ap (Const.«instance») ([«?HUMAN», Const.«Animal»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?PROC»]), ap (Const.«attribute») ([«?HUMAN», Const.«Awake»])])))
axiom ax_1896 : Holds (ap (Const.«subclass») ([Const.«IntentionalPsychologicalProcess», Const.«IntentionalProcess»]))
axiom ax_1897 : Holds (ap (Const.«subclass») ([Const.«IntentionalPsychologicalProcess», Const.«PsychologicalProcess»]))
axiom ax_1898 : Holds (ap (Const.«subclass») ([Const.«RecreationOrExercise», Const.«IntentionalProcess»]))
axiom ax_1899 : Holds (ap (Const.«subclass») ([Const.«OrganizationalProcess», Const.«IntentionalProcess»]))
axiom ax_1900 : ∀ («?ACT» : Obj) («?AGENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«OrganizationalProcess»]), ap (Const.«agent») ([«?ACT», «?AGENT»])]) (mkOr [ap (Const.«instance») ([«?AGENT», Const.«Organization»]), mkExists (fun («?ORG» : Obj) => mkAnd [ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«member») ([«?AGENT», «?ORG»])])]))
axiom ax_1901 : Holds (ap (Const.«subclass») ([Const.«Election», Const.«OrganizationalProcess»]))
axiom ax_1902 : Holds (ap (Const.«subclass») ([Const.«ReligiousProcess», Const.«OrganizationalProcess»]))
axiom ax_1903 : ∀ («?ACT» : Obj) («?AGENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«ReligiousProcess»]), ap (Const.«agent») ([«?ACT», «?AGENT»])]) (mkOr [ap (Const.«instance») ([«?AGENT», Const.«ReligiousOrganization»]), mkExists (fun («?ORG» : Obj) => mkAnd [ap (Const.«member») ([«?AGENT», «?ORG»]), ap (Const.«instance») ([«?ORG», Const.«ReligiousOrganization»])])]))
axiom ax_1904 : Holds (ap (Const.«subclass») ([Const.«JoiningAnOrganization», Const.«OrganizationalProcess»]))
axiom ax_1905 : ∀ («?JOIN» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JOIN», Const.«JoiningAnOrganization»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?JOIN», «?PERSON»]), ap (Const.«patient») ([«?JOIN», «?ORG»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?JOIN»])]), mkNot (ap (Const.«member») ([«?PERSON», «?ORG»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?JOIN»])]), ap (Const.«member») ([«?PERSON», «?ORG»])])]))
axiom ax_1906 : Holds (ap (Const.«instance») ([Const.«expects», Const.«BinaryPredicate»]))
axiom ax_1907 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj) («?T1» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?T1», ap (Const.«expects») ([«?AGENT», «?FORMULA»])])) (mkExists (fun («?T2» : Obj) => mkAnd [ap (Const.«holdsDuring») ([«?T1», ap (Const.«believes») ([«?AGENT», ap (Const.«holdsDuring») ([«?T2», «?FORMULA»])])]), ap (Const.«earlier») ([«?T1», «?T2»])])))
axiom ax_1908 : Holds (ap (Const.«subclass») ([Const.«Hiring», Const.«OrganizationalProcess»]))
axiom ax_1909 : ∀ («?JOIN» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JOIN», Const.«Hiring»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?JOIN», «?ORG»]), ap (Const.«patient») ([«?JOIN», «?PERSON»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?JOIN»])]), mkNot (ap (Const.«member») ([«?PERSON», «?ORG»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?JOIN»])]), ap (Const.«member») ([«?PERSON», «?ORG»])])]))
axiom ax_1910 : ∀ («?JOIN» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JOIN», Const.«Hiring»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?JOIN», «?ORG»]), ap (Const.«patient») ([«?JOIN», «?PERSON»])]) (ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([ap (Const.«WhenFn») ([«?JOIN»])]), ap (Const.«employs») ([«?ORG», «?PERSON»])])))
axiom ax_1911 : ∀ («?JOIN» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JOIN», Const.«Hiring»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?JOIN», «?ORG»]), ap (Const.«patient») ([«?JOIN», «?PERSON»])]) (ap (Const.«expects») ([«?ORG», mkExists (fun («?FT» : Obj) => mkAnd [ap (Const.«instance») ([«?FT», Const.«FinancialTransaction»]), ap (Const.«agent») ([«?FT», «?ORG»]), ap (Const.«destination») ([«?FT», «?PERSON»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?JOIN»]), ap (Const.«WhenFn») ([«?FT»])])])])))
axiom ax_1912 : Holds (ap (Const.«subclass») ([Const.«LeavingAnOrganization», Const.«OrganizationalProcess»]))
axiom ax_1913 : Holds (ap (Const.«disjoint») ([Const.«LeavingAnOrganization», Const.«JoiningAnOrganization»]))
axiom ax_1914 : ∀ («?LEAVE» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEAVE», Const.«LeavingAnOrganization»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?LEAVE», «?PERSON»]), ap (Const.«patient») ([«?LEAVE», «?ORG»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?LEAVE»])]), ap (Const.«member») ([«?PERSON», «?ORG»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?LEAVE»])]), mkNot (ap (Const.«member») ([«?PERSON», «?ORG»]))])]))
axiom ax_1915 : Holds (ap (Const.«subclass») ([Const.«Quitting», Const.«LeavingAnOrganization»]))
axiom ax_1916 : ∀ («?LEAVE» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEAVE», Const.«Quitting»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?LEAVE», «?PERSON»]), ap (Const.«patient») ([«?LEAVE», «?ORG»])]) (ap (Const.«desires») ([«?PERSON», ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?LEAVE»])]), mkNot (ap (Const.«member») ([«?PERSON», «?ORG»]))])])))
axiom ax_1917 : Holds (ap (Const.«subclass») ([Const.«Firing», Const.«OrganizationalProcess»]))
axiom ax_1918 : ∀ («?LEAVE» : Obj) («?ORG» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEAVE», Const.«Firing»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?LEAVE», «?ORG»]), ap (Const.«patient») ([«?LEAVE», «?P»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?LEAVE»])]), ap (Const.«member») ([«?P», «?ORG»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?LEAVE»])]), mkNot (ap (Const.«member») ([«?P», «?ORG»]))])]))
axiom ax_1919 : Holds (ap (Const.«subclass») ([Const.«Volunteering», Const.«Offering»]))
axiom ax_1920 : Holds (ap (Const.«subclass») ([Const.«Graduation», Const.«LeavingAnOrganization»]))
axiom ax_1921 : ∀ («?GRAD» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAD», Const.«Graduation»]), ap (Const.«agent») ([«?GRAD», «?ORG»])]) (ap (Const.«instance») ([«?ORG», Const.«EducationalOrganization»])))
axiom ax_1922 : Holds (ap (Const.«subclass») ([Const.«Matriculation», Const.«JoiningAnOrganization»]))
axiom ax_1923 : ∀ («?MAT» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MAT», Const.«Matriculation»]), ap (Const.«agent») ([«?MAT», «?ORG»])]) (ap (Const.«instance») ([«?ORG», Const.«EducationalOrganization»])))
axiom ax_1924 : Holds (ap (Const.«subclass») ([Const.«Hiring», Const.«JoiningAnOrganization»]))
axiom ax_1925 : ∀ («?HIRE» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HIRE», Const.«Hiring»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?HIRE», «?ORG»]), ap (Const.«patient») ([«?HIRE», «?PERSON»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?HIRE»])]), mkNot (ap (Const.«employs») ([«?ORG», «?PERSON»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?HIRE»])]), ap (Const.«employs») ([«?ORG», «?PERSON»])])]))
axiom ax_1926 : Holds (ap (Const.«subclass») ([Const.«TerminatingEmployment», Const.«LeavingAnOrganization»]))
axiom ax_1927 : ∀ («?FIRE» : Obj) («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FIRE», Const.«TerminatingEmployment»]), ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«agent») ([«?FIRE», «?ORG»]), ap (Const.«patient») ([«?FIRE», «?PERSON»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?FIRE»])]), ap (Const.«employs») ([«?ORG», «?PERSON»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?FIRE»])]), mkNot (ap (Const.«employs») ([«?ORG», «?PERSON»]))])]))
axiom ax_1928 : Holds (ap (Const.«subclass») ([Const.«PoliticalProcess», Const.«OrganizationalProcess»]))
axiom ax_1929 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«PoliticalProcess»])) (mkExists (fun («?POL» : Obj) => mkAnd [mkOr [ap (Const.«instance») ([«?POL», Const.«Government»]), mkExists (fun («?GOV» : Obj) => mkAnd [ap (Const.«instance») ([«?GOV», Const.«Government»]), ap (Const.«member») ([«?POL», «?GOV»])])], mkOr [ap (Const.«agent») ([«?PROC», «?POL»]), ap (Const.«patient») ([«?PROC», «?POL»])]])))
axiom ax_1930 : Holds (ap (Const.«subclass») ([Const.«JudicialProcess», Const.«PoliticalProcess»]))
axiom ax_1931 : ∀ («?ORG» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«JudicialProcess»]), ap (Const.«agent») ([«?PROCESS», «?ORG»]), ap (Const.«instance») ([«?ORG», Const.«Organization»])]) (ap (Const.«instance») ([«?ORG», Const.«JudicialOrganization»])))
axiom ax_1932 : Holds (ap (Const.«subclass») ([Const.«LegalDecision», Const.«JudicialProcess»]))
axiom ax_1933 : Holds (ap (Const.«subclass») ([Const.«LegalDecision», Const.«Declaring»]))
axiom ax_1934 : ∀ («?DECISION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DECISION», Const.«LegalDecision»])) (mkExists (fun («?ACTION» : Obj) => mkAnd [ap (Const.«instance») ([«?ACTION», Const.«LegalAction»]), ap (Const.«refers») ([«?DECISION», «?ACTION»])])))
axiom ax_1935 : ∀ («?DECISION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DECISION», Const.«LegalDecision»])) (mkExists (fun («?DECIDE» : Obj) => mkExists (fun («?LD» : Obj) => mkAnd [ap (Const.«instance») ([«?DECIDE», Const.«Deciding»]), ap (Const.«result») ([«?DECIDE», «?LD»]), ap (Const.«instance») ([«?DECISION», «?LD»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?DECIDE»]), ap (Const.«WhenFn») ([«?DECISION»])])]))))
axiom ax_1936 : Holds (ap (Const.«subclass») ([Const.«MilitaryProcess», Const.«PoliticalProcess»]))
axiom ax_1937 : Holds (ap (Const.«subclass») ([Const.«MilitaryProcess», Const.«OrganizationalProcess»]))
axiom ax_1938 : Holds (ap (Const.«subclass») ([Const.«RegulatoryProcess», Const.«Guiding»]))
axiom ax_1939 : Holds (ap (Const.«subclass») ([Const.«Managing», Const.«OrganizationalProcess»]))
axiom ax_1940 : Holds (ap (Const.«subclass») ([Const.«Managing», Const.«Guiding»]))
axiom ax_1941 : Holds (ap (Const.«subclass») ([Const.«Planning», Const.«IntentionalPsychologicalProcess»]))
axiom ax_1942 : ∀ («?CBO» : Obj) («?EVENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Planning»]), ap (Const.«result») ([«?EVENT», «?CBO»]), ap (Const.«instance») ([«?CBO», Const.«ContentBearingObject»])]) (mkExists (fun («?PLAN» : Obj) => mkAnd [ap (Const.«instance») ([«?PLAN», Const.«Plan»]), ap (Const.«containsInformation») ([«?CBO», «?PLAN»])])))
axiom ax_1943 : Holds (ap (Const.«subclass») ([Const.«Designing», Const.«IntentionalProcess»]))
axiom ax_1944 : Holds (ap (Const.«subclass») ([Const.«Designing», Const.«ContentDevelopment»]))
axiom ax_1945 : Holds (ap (Const.«subclass») ([Const.«Interpreting», Const.«IntentionalPsychologicalProcess»]))
axiom ax_1946 : ∀ («?AGENT» : Obj) («?CONTENT» : Obj) («?INTERPRET» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INTERPRET», Const.«Interpreting»]), ap (Const.«agent») ([«?INTERPRET», «?AGENT»]), ap (Const.«patient») ([«?INTERPRET», «?CONTENT»]), ap (Const.«instance») ([«?CONTENT», Const.«ContentBearingObject»])]) (mkExists (fun («?PROP» : Obj) => ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?INTERPRET»])]), ap (Const.«believes») ([«?AGENT», ap (Const.«containsInformation») ([«?CONTENT», «?PROP»])])]))))
axiom ax_1947 : Holds (ap (Const.«subclass») ([Const.«QuantityChange», Const.«InternalChange»]))
axiom ax_1948 : Holds (ap (Const.«partition») ([Const.«QuantityChange», Const.«Increasing», Const.«Decreasing»]))
axiom ax_1949 : ∀ («?D» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D», Const.«QuantityChange»]), ap (Const.«patient») ([«?D», «?OBJ»])]) (mkExists (fun («?N1» : Obj) => mkExists (fun («?N2» : Obj) => mkExists (fun («?T1» : Obj) => mkExists (fun («?T2» : Obj) => mkExists (fun («?U» : Obj) => mkAnd [ap (Const.«earlier») ([«?T1», «?T2»]), ap (Const.«holdsDuring») ([«?T1», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N1», «?U»])])]), ap (Const.«holdsDuring») ([«?T2», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N2», «?U»])])]), mkNot (ap (Const.«equal») ([«?N1», «?N2»]))])))))))
axiom ax_1950 : Holds (ap (Const.«subclass») ([Const.«Increasing», Const.«QuantityChange»]))
axiom ax_1951 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Increasing», Const.«Putting»]))
axiom ax_1952 : ∀ («?D» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D», Const.«Increasing»]), ap (Const.«patient») ([«?D», «?OBJ»])]) (mkExists (fun («?N1» : Obj) => mkExists (fun («?N2» : Obj) => mkExists (fun («?T1» : Obj) => mkExists (fun («?T2» : Obj) => mkExists (fun («?U» : Obj) => mkAnd [ap (Const.«earlier») ([«?T1», «?T2»]), ap (Const.«holdsDuring») ([«?T1», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N1», «?U»])])]), ap (Const.«holdsDuring») ([«?T2», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N2», «?U»])])]), ap (Const.«greaterThan») ([«?N1», «?N2»])])))))))
axiom ax_1953 : Holds (ap (Const.«subclass») ([Const.«Heating», Const.«Increasing»]))
axiom ax_1954 : Holds (ap (Const.«disjoint») ([Const.«Heating», Const.«Cooling»]))
axiom ax_1955 : ∀ («?HEAT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HEAT», Const.«Heating»]), ap (Const.«patient») ([«?HEAT», «?OBJ»])]) (mkExists (fun («?UNIT» : Obj) => mkExists (fun («?QUANT1» : Obj) => mkExists (fun («?QUANT2» : Obj) => mkAnd [ap (Const.«instance») ([«?UNIT», Const.«TemperatureMeasure»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?HEAT»])]), ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?OBJ», «?UNIT»]), «?QUANT1»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?HEAT»])]), ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?OBJ», «?UNIT»]), «?QUANT2»])]), ap (Const.«greaterThan») ([«?QUANT2», «?QUANT1»])])))))
axiom ax_1956 : Holds (ap (Const.«subclass») ([Const.«Decreasing», Const.«QuantityChange»]))
axiom ax_1957 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Decreasing», Const.«Removing»]))
axiom ax_1958 : ∀ («?D» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D», Const.«Decreasing»]), ap (Const.«patient») ([«?D», «?OBJ»])]) (mkExists (fun («?N1» : Obj) => mkExists (fun («?N2» : Obj) => mkExists (fun («?T1» : Obj) => mkExists (fun («?T2» : Obj) => mkExists (fun («?U» : Obj) => mkAnd [ap (Const.«earlier») ([«?T1», «?T2»]), ap (Const.«holdsDuring») ([«?T1», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N1», «?U»])])]), ap (Const.«holdsDuring») ([«?T2», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?N2», «?U»])])]), ap (Const.«lessThan») ([«?N1», «?N2»])])))))))
axiom ax_1959 : Holds (ap (Const.«subclass») ([Const.«Cooling», Const.«Decreasing»]))
axiom ax_1960 : ∀ («?COOL» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?COOL», Const.«Cooling»]), ap (Const.«patient») ([«?COOL», «?OBJ»])]) (mkExists (fun («?UNIT» : Obj) => mkExists (fun («?QUANT1» : Obj) => mkExists (fun («?QUANT2» : Obj) => mkAnd [ap (Const.«instance») ([«?UNIT», Const.«TemperatureMeasure»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?COOL»])]), ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?OBJ», «?UNIT»]), «?QUANT1»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?COOL»])]), ap (Const.«equal») ([ap (Const.«MeasureFn») ([«?OBJ», «?UNIT»]), «?QUANT2»])]), ap (Const.«lessThan») ([«?QUANT2», «?QUANT1»])])))))
axiom ax_1961 : Holds (ap (Const.«instance») ([Const.«moves», Const.«CaseRole»]))
axiom ax_1962 : Holds (ap (Const.«instance») ([Const.«moves», Const.«TotalValuedRelation»]))
axiom ax_1963 : Holds (ap (Const.«subrelation») ([Const.«moves», Const.«involvedInEvent»]))
axiom ax_1964 : Holds (ap (Const.«instance») ([Const.«changesLocation», Const.«CaseRole»]))
axiom ax_1965 : Holds (ap (Const.«instance») ([Const.«changesLocation», Const.«TotalValuedRelation»]))
axiom ax_1966 : Holds (ap (Const.«subrelation») ([Const.«changesLocation», Const.«moves»]))
axiom ax_1967 : ∀ («?EVENT» : Obj) («?OBJ» : Obj), Holds (mkImp (ap (Const.«changesLocation») ([«?EVENT», «?OBJ»])) (mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Translocation»]), ap (Const.«instance») ([«?OBJ», Const.«Object»]), mkOr [ap (Const.«patient») ([«?EVENT», «?OBJ»]), ap (Const.«agent») ([«?EVENT», «?OBJ»]), ap (Const.«experiencer») ([«?EVENT», «?OBJ»])]]))
axiom ax_1968 : Holds (ap (Const.«subclass») ([Const.«Motion», Const.«Process»]))
axiom ax_1969 : ∀ («?MOTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MOTION», Const.«Motion»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«Object»]), ap (Const.«moves») ([«?MOTION», «?OBJ»])])))
axiom ax_1970 : ∀ («?MOTION» : Obj) («?OBJ» : Obj) («?PLACE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOTION», Const.«Motion»]), ap (Const.«moves») ([«?MOTION», «?OBJ»]), ap (Const.«origin») ([«?MOTION», «?PLACE»])]) (ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?MOTION»])]), ap (Const.«located») ([«?OBJ», «?PLACE»])])))
axiom ax_1971 : ∀ («?MOTION» : Obj) («?OBJ» : Obj) («?PLACE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOTION», Const.«Motion»]), ap (Const.«moves») ([«?MOTION», «?OBJ»]), ap (Const.«destination») ([«?MOTION», «?PLACE»])]) (ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?MOTION»])]), ap (Const.«located») ([«?OBJ», «?PLACE»])])))
axiom ax_1972 : Holds (ap (Const.«subclass») ([Const.«MotionUpward», Const.«Motion»]))
axiom ax_1973 : Holds (ap (Const.«disjoint») ([Const.«MotionUpward», Const.«MotionDownward»]))
axiom ax_1974 : Holds (ap (Const.«subclass») ([Const.«MotionDownward», Const.«Motion»]))
axiom ax_1975 : Holds (ap (Const.«instance») ([Const.«path», Const.«CaseRole»]))
axiom ax_1976 : Holds (ap (Const.«instance») ([Const.«path», Const.«TotalValuedRelation»]))
axiom ax_1977 : Holds (ap (Const.«subrelation») ([Const.«path», Const.«eventPartlyLocated»]))
axiom ax_1978 : ∀ («?DEST» : Obj) («?DISTANCE» : Obj) («?MEASURE1» : Obj) («?OBJ» : Obj) («?PATH1» : Obj) («?PROCESS» : Obj) («?SOURCE» : Obj) («?U» : Obj), Holds (mkImp (mkAnd [ap (Const.«path») ([«?PROCESS», «?PATH1»]), ap (Const.«origin») ([«?PROCESS», «?SOURCE»]), ap (Const.«destination») ([«?PROCESS», «?DEST»]), ap (Const.«length») ([«?PATH1», ap (Const.«MeasureFn») ([«?MEASURE1», «?U»])]), ap (Const.«distance») ([«?SOURCE», «?DEST», ap (Const.«MeasureFn») ([«?DISTANCE», «?U»])]), mkNot (ap (Const.«greaterThan») ([«?MEASURE1», «?DISTANCE»])), ap (Const.«part») ([«?OBJ», «?PATH1»])]) (ap (Const.«between») ([«?SOURCE», «?OBJ», «?DEST»])))
axiom ax_1979 : Holds (ap (Const.«subclass») ([Const.«BodyMotion», Const.«Motion»]))
axiom ax_1980 : ∀ («?MOTION» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOTION», Const.«BodyMotion»]), ap (Const.«moves») ([«?MOTION», «?OBJ»])]) (mkAnd [ap (Const.«instance») ([«?OBJ», Const.«BodyPart»]), ap (Const.«patient») ([«?MOTION», «?OBJ»])]))
axiom ax_1981 : ∀ («?MOTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MOTION», Const.«BodyMotion»])) (mkExists (fun («?AGENT» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«Organism»]), ap (Const.«agent») ([«?MOTION», «?AGENT»])])))
axiom ax_1982 : Holds (ap (Const.«subclass») ([Const.«Ambulating», Const.«BodyMotion»]))
axiom ax_1983 : Holds (ap (Const.«subclass») ([Const.«Ambulating», Const.«IntentionalProcess»]))
axiom ax_1984 : Holds (ap (Const.«subclass») ([Const.«Ambulating», Const.«Translocation»]))
axiom ax_1985 : Holds (ap (Const.«partition») ([Const.«Ambulating», Const.«Walking», Const.«Running»]))
axiom ax_1986 : Holds (ap (Const.«subclass») ([Const.«Walking», Const.«Ambulating»]))
axiom ax_1987 : Holds (ap (Const.«subclass») ([Const.«Running», Const.«Ambulating»]))
axiom ax_1988 : ∀ («?AGENT» : Obj) («?LENGTH1» : Obj) («?LENGTH2» : Obj) («?RUN» : Obj) («?TIME» : Obj) («?WALK» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?WALK», Const.«Walking»]), ap (Const.«instance») ([«?RUN», Const.«Running»]), ap (Const.«agent») ([«?WALK», «?AGENT»]), ap (Const.«agent») ([«?RUN», «?AGENT»]), ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?WALK»]), ap (Const.«measure») ([«?AGENT», ap (Const.«SpeedFn») ([«?LENGTH1», «?TIME»])])]), ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?RUN»]), ap (Const.«measure») ([«?AGENT», ap (Const.«SpeedFn») ([«?LENGTH2», «?TIME»])])])]) (ap (Const.«greaterThan») ([«?LENGTH2», «?LENGTH1»])))
axiom ax_1989 : Holds (ap (Const.«subclass») ([Const.«Swimming», Const.«BodyMotion»]))
axiom ax_1990 : Holds (ap (Const.«subclass») ([Const.«Swimming», Const.«IntentionalProcess»]))
axiom ax_1991 : ∀ («?AGENT» : Obj) («?SWIM» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SWIM», Const.«Swimming»]), ap (Const.«agent») ([«?SWIM», «?AGENT»])]) (mkExists (fun («?AREA» : Obj) => mkAnd [ap (Const.«instance») ([«?AREA», Const.«WaterArea»]), ap (Const.«located») ([«?AGENT», «?AREA»])])))
axiom ax_1992 : Holds (ap (Const.«subclass») ([Const.«Dancing», Const.«BodyMotion»]))
axiom ax_1993 : Holds (ap (Const.«subclass») ([Const.«GeologicalProcess», Const.«NaturalProcess»]))
axiom ax_1994 : Holds (ap (Const.«subclass») ([Const.«GeologicalProcess», Const.«Motion»]))
axiom ax_1995 : Holds (ap (Const.«subclass») ([Const.«GeologicalProcess», Const.«InternalChange»]))
axiom ax_1996 : Holds (ap (Const.«disjoint») ([Const.«GeologicalProcess», Const.«IntentionalProcess»]))
axiom ax_1997 : Holds (ap (Const.«subclass») ([Const.«WeatherProcess», Const.«Motion»]))
axiom ax_1998 : Holds (ap (Const.«disjoint») ([Const.«WeatherProcess», Const.«IntentionalProcess»]))
axiom ax_1999 : Holds (ap (Const.«subclass») ([Const.«Precipitation», Const.«WeatherProcess»]))
axiom ax_2000 : Holds (ap (Const.«subclass») ([Const.«Precipitation», Const.«WaterMotion»]))
axiom ax_2001 : Holds (ap (Const.«subclass») ([Const.«Precipitation», Const.«Falling»]))
axiom ax_2002 : ∀ («?PROCESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROCESS», Const.«Precipitation»])) (mkExists (fun («?STUFF» : Obj) => mkAnd [ap (Const.«instance») ([«?STUFF», Const.«Water»]), ap (Const.«patient») ([«?PROCESS», «?STUFF»])])))
axiom ax_2003 : Holds (ap (Const.«subclass») ([Const.«LiquidMotion», Const.«Motion»]))
axiom ax_2004 : ∀ («?MOTION» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOTION», Const.«LiquidMotion»]), ap (Const.«patient») ([«?MOTION», «?OBJ»])]) (ap (Const.«attribute») ([«?OBJ», Const.«Liquid»])))
axiom ax_2005 : Holds (ap (Const.«subclass») ([Const.«WaterMotion», Const.«LiquidMotion»]))
axiom ax_2006 : ∀ («?MOTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MOTION», Const.«WaterMotion»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«patient») ([«?MOTION», «?WATER»]), ap (Const.«instance») ([«?WATER», Const.«Water»])])))
axiom ax_2007 : Holds (ap (Const.«subclass») ([Const.«GasMotion», Const.«Motion»]))
axiom ax_2008 : ∀ («?MOTION» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOTION», Const.«GasMotion»]), ap (Const.«patient») ([«?MOTION», «?OBJ»])]) (ap (Const.«attribute») ([«?OBJ», Const.«Gas»])))
axiom ax_2009 : Holds (ap (Const.«subclass») ([Const.«Wind», Const.«GasMotion»]))
axiom ax_2010 : Holds (ap (Const.«instance») ([Const.«surfaceWindSpeed», Const.«BinaryPredicate»]))
axiom ax_2011 : Holds (ap (Const.«instance») ([Const.«Windy», Const.«Attribute»]))
axiom ax_2012 : ∀ («?L» : Obj) («?N» : Obj) («?T» : Obj) («?W» : Obj), Holds (mkImp (mkAnd [ap (Const.«attribute») ([«?W», Const.«Windy»]), ap (Const.«located») ([«?W», «?L»]), ap (Const.«equal») ([«?T», ap (Const.«WhenFn») ([«?W»])]), ap (Const.«holdsDuring») ([«?T», ap (Const.«surfaceWindSpeed») ([«?L», ap (Const.«MeasureFn») ([«?N», Const.«MilesPerHour»])])])]) (ap (Const.«greaterThan») ([«?N», numLit "20.0"])))
axiom ax_2013 : Holds (ap (Const.«subclass») ([Const.«DirectionChange», Const.«Motion»]))
axiom ax_2014 : ∀ («?PROC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROC», Const.«DirectionChange»])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«DirectionalAttribute»]), mkOr [mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROC»])]), ap (Const.«manner») ([«?PROC», «?ATTR»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROC»])]), mkNot (ap (Const.«manner») ([«?PROC», «?ATTR»]))])], mkAnd [ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROC»])]), ap (Const.«manner») ([«?PROC», «?ATTR»])]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROC»])]), mkNot (ap (Const.«manner») ([«?PROC», «?ATTR»]))])]]])))
axiom ax_2015 : Holds (ap (Const.«subclass») ([Const.«Transfer», Const.«Translocation»]))
axiom ax_2016 : ∀ («?AGENT» : Obj) («?PATIENT» : Obj) («?TRANSFER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TRANSFER», Const.«Transfer»]), ap (Const.«agent») ([«?TRANSFER», «?AGENT»]), ap (Const.«patient») ([«?TRANSFER», «?PATIENT»])]) (mkNot (ap (Const.«equal») ([«?AGENT», «?PATIENT»]))))
axiom ax_2017 : ∀ («?D1» : Obj) («?D2» : Obj) («?O1» : Obj) («?P» : Obj) («?T1» : Obj) («?T2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?T1», Const.«Translocation»]), ap (Const.«instance») ([«?T2», Const.«Translocation»]), ap (Const.«origin») ([«?T1», «?O1»]), ap (Const.«origin») ([«?T2», «?D1»]), ap (Const.«destination») ([«?T1», «?D1»]), ap (Const.«destination») ([«?T2», «?D2»]), ap (Const.«experiencer») ([«?T1», «?P»]), ap (Const.«experiencer») ([«?T2», «?P»])]) (mkExists (fun («?T» : Obj) => mkAnd [ap (Const.«instance») ([«?T», Const.«Translocation»]), ap (Const.«origin») ([«?T», «?O1»]), ap (Const.«destination») ([«?T», «?D2»]), ap (Const.«subProcess») ([«?T1», «?T»]), ap (Const.«subProcess») ([«?T2», «?T»]), ap (Const.«experiencer») ([«?T», «?P»]), ap (Const.«starts») ([ap (Const.«WhenFn») ([«?T1»]), ap (Const.«WhenFn») ([«?T»])]), ap (Const.«finishes») ([ap (Const.«WhenFn») ([«?T2»]), ap (Const.«WhenFn») ([«?T»])])])))
axiom ax_2018 : Holds (ap (Const.«instance») ([Const.«objectTransferred», Const.«CaseRole»]))
axiom ax_2019 : Holds (ap (Const.«subrelation») ([Const.«objectTransferred», Const.«patient»]))
axiom ax_2020 : ∀ («?OBJ» : Obj) («?P» : Obj), Holds (mkImp (ap (Const.«objectTransferred») ([«?P», «?OBJ»])) (mkExists (fun («?O» : Obj) => mkExists (fun («?D» : Obj) => mkAnd [ap (Const.«origin») ([«?P», «?O»]), ap (Const.«destination») ([«?P», «?D»]), ap (Const.«holdsDuring») ([ap (Const.«ImmediatePastFn») ([«?P»]), ap (Const.«located») ([«?OBJ», «?O»])]), ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([«?P»]), ap (Const.«located») ([«?OBJ», «?D»])])]))))
axiom ax_2021 : ∀ («?O» : Obj) («?O2» : Obj) («?T» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?T», Const.«Transfer»]), ap (Const.«objectTransferred») ([«?T», «?O»]), ap (Const.«orientation») ([«?O2», «?O», Const.«Inside»])]) (ap (Const.«objectTransferred») ([«?T», «?O2»])))
axiom ax_2022 : ∀ («?O» : Obj) («?O2» : Obj) («?T» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?T», Const.«Transfer»]), ap (Const.«objectTransferred») ([«?T», «?O»]), ap (Const.«orientation») ([«?O2», «?O», Const.«On»])]) (ap (Const.«objectTransferred») ([«?T», «?O2»])))
axiom ax_2023 : Holds (ap (Const.«subclass») ([Const.«Carrying», Const.«Transfer»]))
axiom ax_2024 : ∀ («?CARRY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CARRY», Const.«Carrying»])) (mkExists (fun («?ANIMAL» : Obj) => mkAnd [ap (Const.«instance») ([«?ANIMAL», Const.«Animal»]), ap (Const.«instrument») ([«?CARRY», «?ANIMAL»])])))
axiom ax_2025 : Holds (ap (Const.«subclass») ([Const.«Removing», Const.«Transfer»]))
axiom ax_2026 : ∀ («?OBJ» : Obj) («?PLACE» : Obj) («?REMOVE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REMOVE», Const.«Removing»]), ap (Const.«origin») ([«?REMOVE», «?PLACE»]), ap (Const.«patient») ([«?REMOVE», «?OBJ»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?REMOVE»])]), ap (Const.«located») ([«?OBJ», «?PLACE»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?REMOVE»])]), mkNot (ap (Const.«located») ([«?OBJ», «?PLACE»]))])]))
axiom ax_2027 : Holds (ap (Const.«subclass») ([Const.«Uncovering», Const.«Removing»]))
axiom ax_2028 : Holds (ap (Const.«disjoint») ([Const.«Uncovering», Const.«Covering»]))
axiom ax_2029 : Holds (ap (Const.«subclass») ([Const.«Putting», Const.«Transfer»]))
axiom ax_2030 : ∀ («?OBJ» : Obj) («?PLACE» : Obj) («?PUT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PUT», Const.«Putting»]), ap (Const.«destination») ([«?PUT», «?PLACE»]), ap (Const.«patient») ([«?PUT», «?OBJ»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PUT»])]), mkNot (ap (Const.«located») ([«?OBJ», «?PLACE»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PUT»])]), ap (Const.«located») ([«?OBJ», «?PLACE»])])]))
axiom ax_2031 : Holds (ap (Const.«subclass») ([Const.«Covering», Const.«Putting»]))
axiom ax_2032 : Holds (ap (Const.«subclass») ([Const.«Inserting», Const.«Putting»]))
axiom ax_2033 : ∀ («?INSERT» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INSERT», Const.«Inserting»]), ap (Const.«patient») ([«?INSERT», «?OBJ1»]), ap (Const.«destination») ([«?INSERT», «?OBJ2»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?INSERT»])]), mkNot (ap (Const.«contains») ([«?OBJ2», «?OBJ1»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?INSERT»])]), ap (Const.«contains») ([«?OBJ2», «?OBJ1»])])]))
axiom ax_2034 : Holds (ap (Const.«subclass») ([Const.«Injecting», Const.«Inserting»]))
axiom ax_2035 : ∀ («?INJECT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INJECT», Const.«Injecting»])) (mkExists (fun («?SUBSTANCE» : Obj) => mkExists (fun («?ANIMAL» : Obj) => mkAnd [ap (Const.«patient») ([«?INJECT», «?SUBSTANCE»]), ap (Const.«instance») ([«?SUBSTANCE», Const.«BiologicallyActiveSubstance»]), ap (Const.«attribute») ([«?SUBSTANCE», Const.«Liquid»]), ap (Const.«destination») ([«?INJECT», «?ANIMAL»]), ap (Const.«instance») ([«?ANIMAL», Const.«Animal»])]))))
axiom ax_2036 : Holds (ap (Const.«subclass») ([Const.«Substituting», Const.«Transfer»]))
axiom ax_2037 : Holds (ap (Const.«subclass») ([Const.«Substituting», Const.«DualObjectProcess»]))
axiom ax_2038 : ∀ («?SUB» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SUB», Const.«Substituting»])) (mkExists (fun («?PUT» : Obj) => mkExists (fun («?REMOVE» : Obj) => mkExists (fun («?OBJ1» : Obj) => mkExists (fun («?OBJ2» : Obj) => mkExists (fun («?PLACE» : Obj) => mkAnd [ap (Const.«instance») ([«?PUT», Const.«Putting»]), ap (Const.«instance») ([«?REMOVE», Const.«Removing»]), ap (Const.«subProcess») ([«?PUT», «?SUB»]), ap (Const.«subProcess») ([«?REMOVE», «?SUB»]), ap (Const.«patient») ([«?REMOVE», «?OBJ1»]), ap (Const.«origin») ([«?REMOVE», «?PLACE»]), ap (Const.«patient») ([«?PUT», «?OBJ2»]), ap (Const.«destination») ([«?PUT», «?PLACE»]), mkNot (ap (Const.«equal») ([«?OBJ1», «?OBJ2»]))])))))))
axiom ax_2039 : Holds (ap (Const.«subclass») ([Const.«Impelling», Const.«Transfer»]))
axiom ax_2040 : Holds (ap (Const.«subclass») ([Const.«Shooting», Const.«Impelling»]))
axiom ax_2041 : Holds (ap (Const.«subclass») ([Const.«Touching», Const.«Transfer»]))
axiom ax_2042 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj) («?TOUCH» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TOUCH», Const.«Touching»]), ap (Const.«agent») ([«?TOUCH», «?OBJ1»]), ap (Const.«patient») ([«?TOUCH», «?OBJ2»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?TOUCH»])]), mkNot (ap (Const.«connected») ([«?OBJ1», «?OBJ2»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?TOUCH»])]), ap (Const.«connected») ([«?OBJ1», «?OBJ2»])])]))
axiom ax_2043 : Holds (ap (Const.«subrelation») ([Const.«grasps», Const.«meetsSpatially»]))
axiom ax_2044 : Holds (ap (Const.«instance») ([Const.«grasps», Const.«BinaryPredicate»]))
axiom ax_2045 : Holds (ap (Const.«subclass») ([Const.«Grabbing», Const.«Touching»]))
axiom ax_2046 : Holds (ap (Const.«subclass») ([Const.«Grabbing», Const.«Attaching»]))
axiom ax_2047 : ∀ («?AGENT» : Obj) («?GRAB» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GRAB», Const.«Grabbing»]), ap (Const.«agent») ([«?GRAB», «?AGENT»]), ap (Const.«patient») ([«?GRAB», «?THING»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?GRAB»])]), mkNot (ap (Const.«grasps») ([«?AGENT», «?THING»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?GRAB»])]), ap (Const.«grasps») ([«?AGENT», «?THING»])])]))
axiom ax_2048 : Holds (ap (Const.«subclass») ([Const.«Releasing», Const.«Transfer»]))
axiom ax_2049 : ∀ («?AGENT» : Obj) («?GRAB» : Obj) («?RELEASE» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?RELEASE», Const.«Releasing»]), ap (Const.«agent») ([«?GRAB», «?AGENT»]), ap (Const.«patient») ([«?GRAB», «?THING»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?RELEASE»])]), ap (Const.«grasps») ([«?AGENT», «?THING»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?RELEASE»])]), mkNot (ap (Const.«grasps») ([«?AGENT», «?THING»]))])]))
axiom ax_2050 : Holds (ap (Const.«subclass») ([Const.«Impacting», Const.«Touching»]))
axiom ax_2051 : ∀ («?IMPACT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?IMPACT», Const.«Impacting»]), ap (Const.«patient») ([«?IMPACT», «?OBJ»])]) (mkExists (fun («?IMPEL» : Obj) => mkAnd [ap (Const.«instance») ([«?IMPEL», Const.«Impelling»]), ap (Const.«patient») ([«?IMPEL», «?OBJ»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?IMPEL»]), ap (Const.«WhenFn») ([«?IMPACT»])])])))
axiom ax_2052 : Holds (ap (Const.«subclass») ([Const.«Translocation», Const.«Motion»]))
axiom ax_2053 : ∀ («?MOVEMENT» : Obj) («?PLACE1» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MOVEMENT», Const.«Translocation»]), ap (Const.«origin») ([«?MOVEMENT», «?PLACE1»])]) (mkExists (fun («?PLACE2» : Obj) => mkExists (fun («?STAGE» : Obj) => mkAnd [ap (Const.«instance») ([«?PLACE2», Const.«Region»]), mkNot (ap (Const.«equal») ([«?PLACE1», «?PLACE2»])), ap (Const.«subProcess») ([«?STAGE», «?MOVEMENT»]), ap (Const.«located») ([«?STAGE», «?PLACE2»])]))))
axiom ax_2054 : ∀ («?T» : Obj), Holds (mkImp (ap (Const.«instance») ([«?T», Const.«Translocation»])) (mkExists (fun («?O» : Obj) => mkExists (fun («?D» : Obj) => mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?O», Const.«Object»]), ap (Const.«instance») ([«?D», Const.«Object»]), ap (Const.«instance») ([«?P», Const.«Object»]), ap (Const.«path») ([«?T», «?P»]), ap (Const.«origin») ([«?T», «?O»]), ap (Const.«destination») ([«?T», «?D»])])))))
axiom ax_2055 : Holds (ap (Const.«subclass») ([Const.«Falling», Const.«Translocation»]))
axiom ax_2056 : Holds (ap (Const.«subclass») ([Const.«Falling», Const.«MotionDownward»]))
axiom ax_2057 : ∀ («?DROP» : Obj) («?FINISH» : Obj) («?START» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DROP», Const.«Falling»]), ap (Const.«origin») ([«?DROP», «?START»]), ap (Const.«destination») ([«?DROP», «?FINISH»])]) (ap (Const.«orientation») ([«?FINISH», «?START», Const.«Below»])))
axiom ax_2058 : Holds (ap (Const.«subclass») ([Const.«Transportation», Const.«Translocation»]))
axiom ax_2059 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Transportation», Const.«TransportationDevice»]))
axiom ax_2060 : ∀ («?TRANS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TRANS», Const.«Transportation»])) (mkExists (fun («?DEVICE» : Obj) => mkAnd [ap (Const.«instance») ([«?DEVICE», Const.«TransportationDevice»]), ap (Const.«instrument») ([«?TRANS», «?DEVICE»])])))
axiom ax_2061 : Holds (ap (Const.«subclass») ([Const.«Guiding», Const.«IntentionalProcess»]))
axiom ax_2062 : Holds (ap (Const.«subclass») ([Const.«Driving», Const.«Guiding»]))
axiom ax_2063 : Holds (ap (Const.«subclass») ([Const.«Driving», Const.«Transportation»]))
axiom ax_2064 : ∀ («?DRIVE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DRIVE», Const.«Driving»])) (mkExists (fun («?VEHICLE» : Obj) => mkAnd [ap (Const.«instance») ([«?VEHICLE», Const.«Vehicle»]), ap (Const.«patient») ([«?DRIVE», «?VEHICLE»])])))
axiom ax_2065 : Holds (ap (Const.«subclass») ([Const.«EducationalProcess», Const.«Guiding»]))
axiom ax_2066 : ∀ («?EDUCATION» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EDUCATION», Const.«EducationalProcess»]), ap (Const.«patient») ([«?EDUCATION», «?PERSON»])]) (ap (Const.«hasPurpose») ([«?EDUCATION», mkExists (fun («?LEARN» : Obj) => mkAnd [ap (Const.«instance») ([«?LEARN», Const.«Learning»]), ap (Const.«patient») ([«?LEARN», «?PERSON»])])])))
axiom ax_2067 : Holds (ap (Const.«subclass») ([Const.«ChangeOfPossession», Const.«SocialInteraction»]))
axiom ax_2068 : Holds (ap (Const.«relatedInternalConcept») ([Const.«ChangeOfPossession», Const.«possesses»]))
axiom ax_2069 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?CHANGE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?CHANGE», Const.«ChangeOfPossession»]), ap (Const.«patient») ([«?CHANGE», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«possesses») ([«?AGENT1», «?OBJ»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«possesses») ([«?AGENT2», «?OBJ»])])]) (mkNot (ap (Const.«equal») ([«?AGENT1», «?AGENT2»]))))
axiom ax_2070 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?CHANGE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?CHANGE», Const.«ChangeOfPossession»]), ap (Const.«origin») ([«?CHANGE», «?AGENT1»]), ap (Const.«destination») ([«?CHANGE», «?AGENT2»]), ap (Const.«instance») ([«?AGENT1», Const.«AutonomousAgent»]), ap (Const.«instance») ([«?AGENT2», Const.«AutonomousAgent»]), ap (Const.«patient») ([«?CHANGE», «?OBJ»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«possesses») ([«?AGENT1», «?OBJ»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«possesses») ([«?AGENT2», «?OBJ»])])]))
axiom ax_2071 : Holds (ap (Const.«subclass») ([Const.«Giving», Const.«ChangeOfPossession»]))
axiom ax_2072 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?GIVE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GIVE», Const.«Giving»]), ap (Const.«agent») ([«?GIVE», «?AGENT1»]), ap (Const.«destination») ([«?GIVE», «?AGENT2»]), ap (Const.«instance») ([«?AGENT2», Const.«AutonomousAgent»]), ap (Const.«patient») ([«?GIVE», «?OBJ»])]) (mkExists (fun («?GET» : Obj) => mkAnd [ap (Const.«instance») ([«?GET», Const.«Getting»]), ap (Const.«agent») ([«?GET», «?AGENT2»]), ap (Const.«origin») ([«?GET», «?AGENT1»]), ap (Const.«patient») ([«?GET», «?OBJ»])])))
axiom ax_2073 : ∀ («?AGENT» : Obj) («?GIVE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GIVE», Const.«Giving»]), ap (Const.«agent») ([«?GIVE», «?AGENT»])]) (ap (Const.«origin») ([«?GIVE», «?AGENT»])))
axiom ax_2074 : Holds (ap (Const.«subclass») ([Const.«Funding», Const.«Giving»]))
axiom ax_2075 : ∀ («?FUND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FUND», Const.«Funding»])) (mkExists (fun («?MONEY» : Obj) => mkAnd [ap (Const.«instance») ([«?MONEY», Const.«Currency»]), ap (Const.«patient») ([«?FUND», «?MONEY»])])))
axiom ax_2076 : Holds (ap (Const.«subclass») ([Const.«UnilateralGiving», Const.«Giving»]))
axiom ax_2077 : ∀ («?GIVE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GIVE», Const.«UnilateralGiving»])) (mkNot (mkExists (fun («?TRANS» : Obj) => mkAnd [ap (Const.«instance») ([«?TRANS», Const.«Transaction»]), ap (Const.«subProcess») ([«?GIVE», «?TRANS»])]))))
axiom ax_2078 : Holds (ap (Const.«subclass») ([Const.«Lending», Const.«Giving»]))
axiom ax_2079 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?BORROW» : Obj) («?OBJECT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BORROW», Const.«Borrowing»]), ap (Const.«agent») ([«?BORROW», «?AGENT1»]), ap (Const.«origin») ([«?BORROW», «?AGENT2»]), ap (Const.«patient») ([«?BORROW», «?OBJECT»])]) (mkExists (fun («?LEND» : Obj) => mkAnd [ap (Const.«instance») ([«?LEND», Const.«Lending»]), ap (Const.«agent») ([«?LEND», «?AGENT2»]), ap (Const.«destination») ([«?LEND», «?AGENT1»]), ap (Const.«patient») ([«?LEND», «?OBJECT»])])))
axiom ax_2080 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?LEND» : Obj) («?OBJECT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEND», Const.«Lending»]), ap (Const.«agent») ([«?LEND», «?AGENT2»]), ap (Const.«destination») ([«?LEND», «?AGENT1»]), ap (Const.«patient») ([«?LEND», «?OBJECT»])]) (mkExists (fun («?BORROW» : Obj) => mkAnd [ap (Const.«instance») ([«?BORROW», Const.«Borrowing»]), ap (Const.«agent») ([«?BORROW», «?AGENT1»]), ap (Const.«origin») ([«?BORROW», «?AGENT2»]), ap (Const.«patient») ([«?BORROW», «?OBJECT»])])))
axiom ax_2081 : Holds (ap (Const.«subclass») ([Const.«GivingBack», Const.«Giving»]))
axiom ax_2082 : ∀ («?AGENT» : Obj) («?DEST» : Obj) («?RETURN» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?RETURN», Const.«GivingBack»]), ap (Const.«agent») ([«?RETURN», «?AGENT»]), ap (Const.«destination») ([«?RETURN», «?DEST»])]) (mkExists (fun («?GIVE» : Obj) => mkAnd [ap (Const.«instance») ([«?GIVE», Const.«Giving»]), ap (Const.«agent») ([«?GIVE», «?DEST»]), ap (Const.«destination») ([«?GIVE», «?AGENT»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?GIVE»]), ap (Const.«WhenFn») ([«?RETURN»])])])))
axiom ax_2083 : Holds (ap (Const.«subclass») ([Const.«Getting», Const.«ChangeOfPossession»]))
axiom ax_2084 : ∀ («?AGENT» : Obj) («?GET» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GET», Const.«Getting»]), ap (Const.«agent») ([«?GET», «?AGENT»])]) (ap (Const.«destination») ([«?GET», «?AGENT»])))
axiom ax_2085 : Holds (ap (Const.«subclass») ([Const.«UnilateralGetting», Const.«Getting»]))
axiom ax_2086 : Holds (ap (Const.«relatedInternalConcept») ([Const.«UnilateralGetting», Const.«UnilateralGiving»]))
axiom ax_2087 : ∀ («?GET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GET», Const.«UnilateralGetting»])) (mkNot (mkExists (fun («?TRANS» : Obj) => mkAnd [ap (Const.«instance») ([«?TRANS», Const.«Transaction»]), ap (Const.«subProcess») ([«?GET», «?TRANS»])]))))
axiom ax_2088 : Holds (ap (Const.«subclass») ([Const.«Borrowing», Const.«Getting»]))
axiom ax_2089 : Holds (ap (Const.«subclass») ([Const.«Transaction», Const.«ChangeOfPossession»]))
axiom ax_2090 : Holds (ap (Const.«subclass») ([Const.«Transaction», Const.«DualObjectProcess»]))
axiom ax_2091 : ∀ («?TRANS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TRANS», Const.«Transaction»])) (mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkExists (fun («?GIVE1» : Obj) => mkExists (fun («?GIVE2» : Obj) => mkExists (fun («?OBJ1» : Obj) => mkExists (fun («?OBJ2» : Obj) => mkAnd [ap (Const.«instance») ([«?GIVE1», Const.«Giving»]), ap (Const.«instance») ([«?GIVE2», Const.«Giving»]), ap (Const.«subProcess») ([«?GIVE1», «?TRANS»]), ap (Const.«subProcess») ([«?GIVE2», «?TRANS»]), ap (Const.«agent») ([«?GIVE1», «?AGENT1»]), ap (Const.«agent») ([«?GIVE2», «?AGENT2»]), ap (Const.«patient») ([«?GIVE1», «?OBJ1»]), ap (Const.«patient») ([«?GIVE2», «?OBJ2»]), ap (Const.«destination») ([«?GIVE1», «?AGENT2»]), ap (Const.«destination») ([«?GIVE2», «?AGENT1»]), mkNot (ap (Const.«equal») ([«?AGENT1», «?AGENT2»])), mkNot (ap (Const.«equal») ([«?OBJ1», «?OBJ2»]))]))))))))
axiom ax_2092 : Holds (ap (Const.«subclass») ([Const.«FinancialTransaction», Const.«Transaction»]))
axiom ax_2093 : ∀ («?TRANS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TRANS», Const.«FinancialTransaction»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«patient») ([«?TRANS», «?OBJ»]), ap (Const.«instance») ([«?OBJ», Const.«FinancialInstrument»])])))
axiom ax_2094 : Holds (ap (Const.«instance») ([Const.«transactionAmount», Const.«BinaryPredicate»]))
axiom ax_2095 : Holds (ap (Const.«instance») ([Const.«transactionAmount», Const.«SingleValuedRelation»]))
axiom ax_2096 : Holds (ap (Const.«instance») ([Const.«transactionAmount», Const.«TotalValuedRelation»]))
axiom ax_2097 : ∀ («?AMOUNT» : Obj) («?TRANS» : Obj), Holds (mkImp (ap (Const.«transactionAmount») ([«?TRANS», «?AMOUNT»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«patient») ([«?TRANS», «?OBJ»]), ap (Const.«monetaryValue») ([«?OBJ», «?AMOUNT»])])))
axiom ax_2098 : Holds (ap (Const.«subclass») ([Const.«ServiceProcess», Const.«SocialInteraction»]))
axiom ax_2099 : Holds (ap (Const.«subclass») ([Const.«CommercialService», Const.«FinancialTransaction»]))
axiom ax_2100 : Holds (ap (Const.«subclass») ([Const.«CommercialService», Const.«ServiceProcess»]))
axiom ax_2101 : ∀ («?BUSINESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BUSINESS», Const.«CommercialService»])) (mkExists (fun («?AGENT» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«CommercialAgent»]), ap (Const.«agent») ([«?BUSINESS», «?AGENT»])])))
axiom ax_2102 : Holds (ap (Const.«subclass») ([Const.«Betting», Const.«FinancialTransaction»]))
axiom ax_2103 : Holds (ap (Const.«subclass») ([Const.«Buying», Const.«FinancialTransaction»]))
axiom ax_2104 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Buying», Const.«Selling»]))
axiom ax_2105 : ∀ («?AGENT» : Obj) («?BUY» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BUY», Const.«Buying»]), ap (Const.«agent») ([«?BUY», «?AGENT»])]) (ap (Const.«destination») ([«?BUY», «?AGENT»])))
axiom ax_2106 : Holds (ap (Const.«subclass») ([Const.«Selling», Const.«FinancialTransaction»]))
axiom ax_2107 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?BUY» : Obj) («?OBJECT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BUY», Const.«Buying»]), ap (Const.«agent») ([«?BUY», «?AGENT1»]), ap (Const.«origin») ([«?BUY», «?AGENT2»]), ap (Const.«patient») ([«?BUY», «?OBJECT»])]) (mkExists (fun («?SELL» : Obj) => mkAnd [ap (Const.«instance») ([«?SELL», Const.«Selling»]), ap (Const.«agent») ([«?SELL», «?AGENT2»]), ap (Const.«destination») ([«?SELL», «?AGENT1»]), ap (Const.«patient») ([«?SELL», «?OBJECT»])])))
axiom ax_2108 : ∀ («?AGENT» : Obj) («?SELL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SELL», Const.«Selling»]), ap (Const.«agent») ([«?SELL», «?AGENT»])]) (ap (Const.«origin») ([«?SELL», «?AGENT»])))
axiom ax_2109 : Holds (ap (Const.«subclass») ([Const.«Learning», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2110 : ∀ («?AGENT» : Obj) («?LEARN» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEARN», Const.«Learning»]), ap (Const.«agent») ([«?LEARN», «?AGENT»])]) (ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»])))
axiom ax_2111 : ∀ («?AGENT» : Obj) («?LEARN» : Obj) («?PROP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?LEARN», Const.«Learning»]), ap (Const.«agent») ([«?LEARN», «?AGENT»]), ap (Const.«patient») ([«?LEARN», «?PROP»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?LEARN»])]), mkNot (ap (Const.«knows») ([«?AGENT», «?PROP»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?LEARN»])]), ap (Const.«knows») ([«?AGENT», «?PROP»])])]))
axiom ax_2112 : Holds (ap (Const.«subclass») ([Const.«Discovering», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2113 : ∀ («?DISCOVER» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DISCOVER», Const.«Discovering»]), ap (Const.«patient») ([«?DISCOVER», «?OBJ»])]) (mkExists (fun («?PURSUE» : Obj) => mkAnd [ap (Const.«instance») ([«?PURSUE», Const.«Pursuing»]), ap (Const.«meetsTemporally») ([ap (Const.«WhenFn») ([«?PURSUE»]), ap (Const.«WhenFn») ([«?DISCOVER»])])])))
axiom ax_2114 : ∀ («?A» : Obj) («?DISCOVER» : Obj) («?DISCOVERING» : Obj) («?OBJ» : Obj) («?PLACE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DISCOVER», Const.«Discovering»]), ap (Const.«agent») ([«?DISCOVER», «?A»]), ap (Const.«patient») ([«?DISCOVER», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?DISCOVER»]), ap (Const.«located») ([«?OBJ», «?PLACE»])])]) (ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([«?DISCOVERING»]), ap (Const.«knows») ([«?A», ap (Const.«located») ([«?OBJ», «?PLACE»])])])))
axiom ax_2115 : Holds (ap (Const.«subclass») ([Const.«Classifying», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2116 : Holds (ap (Const.«subclass») ([Const.«Reasoning», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2117 : ∀ («?AGENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»])) (ap (Const.«capability») ([Const.«Reasoning», Const.«agent», «?AGENT»])))
axiom ax_2118 : Holds (ap (Const.«subclass») ([Const.«Selecting», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2119 : Holds (ap (Const.«subclass») ([Const.«Deciding», Const.«Selecting»]))
axiom ax_2120 : ∀ («?AGENT» : Obj) («?DECIDE» : Obj) («?M» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DECIDE», Const.«Deciding»]), ap (Const.«agent») ([«?DECIDE», «?AGENT»]), ap (Const.«instance») ([«?S», Const.«Set»]), ap (Const.«patient») ([«?DECIDE», «?S»]), ap (Const.«element») ([«?M», «?S»])]) (ap (Const.«believes») ([«?AGENT», mkExists (fun («?CLASS» : Obj) => mkAnd [ap (Const.«instance») ([«?M», «?CLASS»]), ap (Const.«subclass») ([«?CLASS», Const.«IntentionalProcess»]), ap (Const.«capability») ([«?CLASS», Const.«agent», «?AGENT»])])])))
axiom ax_2121 : ∀ («?A» : Obj) («?DECIDE» : Obj) («?S» : Obj) («?X» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DECIDE», Const.«Deciding»]), ap (Const.«agent») ([«?DECIDE», «?A»]), ap (Const.«patient») ([«?DECIDE», «?S»]), ap (Const.«instance») ([«?S», Const.«Set»]), ap (Const.«result») ([«?DECIDE», «?X»]), ap (Const.«instance») ([«?X», Const.«ContentBearingPhysical»])]) (ap (Const.«containsFormula») ([«?X», ap (Const.«holdsDuring») ([ap (Const.«FutureFn») ([ap (Const.«WhenFn») ([«?DECIDE»])]), mkExists (fun («?M» : Obj) => mkAnd [ap (Const.«element») ([«?M», «?S»]), ap (Const.«instance») ([«?M», Const.«IntentionalProcess»]), ap (Const.«agent») ([«?M», «?A»])])])])))
axiom ax_2122 : Holds (ap (Const.«subclass») ([Const.«Voting», Const.«Selecting»]))
axiom ax_2123 : ∀ («?VOTE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?VOTE», Const.«Voting»])) (mkExists (fun («?ELECT» : Obj) => mkAnd [ap (Const.«instance») ([«?ELECT», Const.«Election»]), ap (Const.«subProcess») ([«?VOTE», «?ELECT»])])))
axiom ax_2124 : Holds (ap (Const.«subclass») ([Const.«Judging», Const.«Selecting»]))
axiom ax_2125 : ∀ («?AGENT» : Obj) («?JUDGE» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JUDGE», Const.«Judging»]), ap (Const.«agent») ([«?JUDGE», «?AGENT»]), ap (Const.«result») ([«?JUDGE», «?P»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?JUDGE»])]), mkNot (ap (Const.«believes») ([«?AGENT», «?P»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?JUDGE»])]), ap (Const.«believes») ([«?AGENT», «?P»])])]))
axiom ax_2126 : Holds (ap (Const.«subclass») ([Const.«Comparing», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2127 : Holds (ap (Const.«subclass») ([Const.«Comparing», Const.«DualObjectProcess»]))
axiom ax_2128 : Holds (ap (Const.«subclass») ([Const.«Calculating», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2129 : Holds (ap (Const.«subclass») ([Const.«Measuring», Const.«Calculating»]))
axiom ax_2130 : ∀ («?AGENT» : Obj) («?MEAS» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MEAS», Const.«Measuring»]), ap (Const.«agent») ([«?MEAS», «?AGENT»]), ap (Const.«patient») ([«?MEAS», «?OBJ»])]) (mkExists (fun («?QUANT» : Obj) => mkExists (fun («?UNIT» : Obj) => ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?MEAS»])]), ap (Const.«knows») ([«?AGENT», ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?QUANT», «?UNIT»])])])])))))
axiom ax_2131 : Holds (ap (Const.«subclass») ([Const.«Counting», Const.«Calculating»]))
axiom ax_2132 : ∀ («?AGENT» : Obj) («?COUNT» : Obj) («?ENTITY» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?COUNT», Const.«Counting»]), ap (Const.«agent») ([«?COUNT», «?AGENT»]), ap (Const.«patient») ([«?COUNT», «?ENTITY»])]) (mkExists (fun («?NUMBER» : Obj) => ap (Const.«knows») ([«?AGENT», ap (Const.«equal») ([ap (Const.«CardinalityFn») ([«?ENTITY»]), «?NUMBER»])]))))
axiom ax_2133 : Holds (ap (Const.«subclass») ([Const.«Predicting», Const.«IntentionalPsychologicalProcess»]))
axiom ax_2134 : ∀ («?FORMULA» : Obj) («?PREDICT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PREDICT», Const.«Predicting»]), ap (Const.«patient») ([«?PREDICT», «?FORMULA»])]) (mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«holdsDuring») ([«?TIME», «?FORMULA»]), ap (Const.«earlier») ([«?TIME», ap (Const.«WhenFn») ([«?PREDICT»])])])))
axiom ax_2135 : Holds (ap (Const.«subclass») ([Const.«Remembering», Const.«PsychologicalProcess»]))
axiom ax_2136 : ∀ («?FORMULA» : Obj) («?REMEMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REMEMBER», Const.«Remembering»]), ap (Const.«patient») ([«?REMEMBER», «?FORMULA»])]) (mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«holdsDuring») ([«?TIME», «?FORMULA»]), mkOr [ap (Const.«before») ([«?TIME», ap (Const.«WhenFn») ([«?REMEMBER»])]), ap (Const.«earlier») ([«?TIME», ap (Const.«WhenFn») ([«?REMEMBER»])])]])))
axiom ax_2137 : Holds (ap (Const.«subclass») ([Const.«Keeping», Const.«IntentionalProcess»]))
axiom ax_2138 : ∀ («?AGENT» : Obj) («?KEEP» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?KEEP», Const.«Keeping»]), ap (Const.«agent») ([«?KEEP», «?AGENT»]), ap (Const.«patient») ([«?KEEP», «?OBJ»])]) (mkExists (fun («?PUT» : Obj) => mkAnd [ap (Const.«instance») ([«?PUT», Const.«Putting»]), ap (Const.«agent») ([«?PUT», «?AGENT»]), ap (Const.«patient») ([«?PUT», «?OBJ»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?PUT»]), ap (Const.«WhenFn») ([«?KEEP»])])])))
axiom ax_2139 : ∀ («?KEEP» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?KEEP», Const.«Keeping»]), ap (Const.«patient») ([«?KEEP», «?OBJ»])]) (mkExists (fun («?PLACE» : Obj) => mkForall (fun («?TIME» : Obj) => mkImp (ap (Const.«temporalPart») ([«?TIME», ap (Const.«WhenFn») ([«?KEEP»])])) (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«located») ([«?OBJ», «?PLACE»])]))))))
axiom ax_2140 : Holds (ap (Const.«subclass») ([Const.«Confining», Const.«Keeping»]))
axiom ax_2141 : ∀ («?CONFINE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CONFINE», Const.«Confining»])) (mkExists (fun («?AGENT» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«Animal»]), ap (Const.«patient») ([«?CONFINE», «?AGENT»])])))
axiom ax_2142 : ∀ («?CONFINE» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?CONFINE», Const.«Confining»]), ap (Const.«patient») ([«?CONFINE», «?PERSON»]), ap (Const.«instance») ([«?PERSON», Const.«Human»])]) (mkNot (ap (Const.«desires») ([«?PERSON», ap (Const.«patient») ([«?CONFINE», «?PERSON»])]))))
axiom ax_2143 : Holds (ap (Const.«subclass») ([Const.«Maintaining», Const.«IntentionalProcess»]))
axiom ax_2144 : Holds (ap (Const.«subclass») ([Const.«Repairing», Const.«IntentionalProcess»]))
axiom ax_2145 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Repairing», Const.«Maintaining»]))
axiom ax_2146 : ∀ («?OBJ» : Obj) («?REPAIR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REPAIR», Const.«Repairing»]), ap (Const.«patient») ([«?REPAIR», «?OBJ»])]) (mkExists (fun («?DAMAGE» : Obj) => mkAnd [ap (Const.«instance») ([«?DAMAGE», Const.«Damaging»]), ap (Const.«patient») ([«?DAMAGE», «?OBJ»]), ap (Const.«earlier») ([ap (Const.«WhenFn») ([«?DAMAGE»]), ap (Const.«WhenFn») ([«?REPAIR»])])])))
axiom ax_2147 : Holds (ap (Const.«subclass») ([Const.«TherapeuticProcess», Const.«Repairing»]))
axiom ax_2148 : ∀ («?BIO» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«TherapeuticProcess»]), ap (Const.«patient») ([«?PROC», «?BIO»])]) (mkOr [ap (Const.«instance») ([«?BIO», Const.«Organism»]), mkExists (fun («?ORG» : Obj) => mkAnd [ap (Const.«instance») ([«?ORG», Const.«Organism»]), ap (Const.«part») ([«?BIO», «?ORG»])])]))
axiom ax_2149 : Holds (ap (Const.«subclass») ([Const.«Surgery», Const.«TherapeuticProcess»]))
axiom ax_2150 : ∀ («?ACT» : Obj) («?ANIMAL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ACT», Const.«Surgery»]), ap (Const.«patient») ([«?ACT», «?ANIMAL»])]) (mkExists (fun («?SUBACT» : Obj) => mkAnd [ap (Const.«instance») ([«?SUBACT», Const.«Cutting»]), ap (Const.«instance») ([«?ANIMAL», Const.«Animal»]), ap (Const.«patient») ([«?SUBACT», «?ANIMAL»]), ap (Const.«subProcess») ([«?SUBACT», «?ACT»])])))
axiom ax_2151 : Holds (ap (Const.«subclass») ([Const.«Damaging», Const.«InternalChange»]))
axiom ax_2152 : Holds (ap (Const.«disjoint») ([Const.«Damaging», Const.«Repairing»]))
axiom ax_2153 : Holds (ap (Const.«subclass») ([Const.«Destruction», Const.«Damaging»]))
axiom ax_2154 : ∀ («?PROCESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROCESS», Const.«Destruction»])) (mkExists (fun («?PATIENT» : Obj) => mkAnd [ap (Const.«patient») ([«?PROCESS», «?PATIENT»]), ap (Const.«time») ([«?PATIENT», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]), mkNot (ap (Const.«time») ([«?PATIENT», ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]))])))
axiom ax_2155 : Holds (ap (Const.«subclass») ([Const.«Killing», Const.«Destruction»]))
axiom ax_2156 : ∀ («?AGENT» : Obj) («?KILL» : Obj) («?PATIENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?KILL», Const.«Killing»]), ap (Const.«agent») ([«?KILL», «?AGENT»]), ap (Const.«patient») ([«?KILL», «?PATIENT»])]) (mkAnd [ap (Const.«instance») ([«?AGENT», Const.«Organism»]), ap (Const.«instance») ([«?PATIENT», Const.«Organism»])]))
axiom ax_2157 : ∀ («?KILL» : Obj) («?PATIENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?KILL», Const.«Killing»]), ap (Const.«patient») ([«?KILL», «?PATIENT»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?KILL»])]), ap (Const.«attribute») ([«?PATIENT», Const.«Living»])]), ap (Const.«holdsDuring») ([ap (Const.«FutureFn») ([ap (Const.«WhenFn») ([«?KILL»])]), ap (Const.«attribute») ([«?PATIENT», Const.«Dead»])])]))
axiom ax_2158 : ∀ («?KILL» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?KILL», Const.«Killing»]), ap (Const.«patient») ([«?KILL», «?OBJ»])]) (mkExists (fun («?DEATH» : Obj) => mkAnd [ap (Const.«instance») ([«?DEATH», Const.«Death»]), ap (Const.«experiencer») ([«?DEATH», «?OBJ»]), ap (Const.«causes») ([«?KILL», «?DEATH»])])))
axiom ax_2159 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Organism»])) (ap (Const.«capability») ([Const.«Killing», Const.«agent», «?O»])))
axiom ax_2160 : ∀ («?O» : Obj), Holds (mkImp (ap (Const.«instance») ([«?O», Const.«Organism»])) (ap (Const.«capability») ([Const.«Killing», Const.«patient», «?O»])))
axiom ax_2161 : Holds (ap (Const.«subclass») ([Const.«Poking», Const.«IntentionalProcess»]))
axiom ax_2162 : ∀ («?AGENT» : Obj) («?INST» : Obj) («?OBJ» : Obj) («?POKE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?POKE», Const.«Poking»]), ap (Const.«agent») ([«?POKE», «?AGENT»]), ap (Const.«patient») ([«?POKE», «?OBJ»]), ap (Const.«instrument») ([«?POKE», «?INST»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?POKE»]), ap (Const.«connects») ([«?INST», «?AGENT», «?OBJ»])])))
axiom ax_2163 : Holds (ap (Const.«subclass») ([Const.«Cutting», Const.«Poking»]))
axiom ax_2164 : Holds (ap (Const.«subclass») ([Const.«Attaching», Const.«DualObjectProcess»]))
axiom ax_2165 : Holds (ap (Const.«disjoint») ([Const.«Attaching», Const.«Detaching»]))
axiom ax_2166 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Attaching», Const.«Putting»]))
axiom ax_2167 : ∀ («?ATTACH» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTACH», Const.«Attaching»]), ap (Const.«patient») ([«?ATTACH», «?OBJ1»]), ap (Const.«patient») ([«?ATTACH», «?OBJ2»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?ATTACH»])]), mkNot (ap (Const.«connected») ([«?OBJ1», «?OBJ2»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?ATTACH»])]), ap (Const.«connected») ([«?OBJ1», «?OBJ2»])])]))
axiom ax_2168 : ∀ («?ATTACH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ATTACH», Const.«Attaching»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«CorpuscularObject»]), ap (Const.«patient») ([«?ATTACH», «?OBJ»])])))
axiom ax_2169 : Holds (ap (Const.«instance») ([Const.«objectAttached», Const.«CaseRole»]))
axiom ax_2170 : Holds (ap (Const.«subrelation») ([Const.«objectAttached», Const.«patient»]))
axiom ax_2171 : ∀ («?A» : Obj) («?O1» : Obj) («?O2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?A», Const.«Attaching»]), ap (Const.«patient») ([«?A», «?O1»]), ap (Const.«patient») ([«?A», «?O2»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?A»])]), mkNot (ap (Const.«connected») ([«?O1», «?O2»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?A»])]), ap (Const.«connected») ([«?O1», «?O2»])])]) (mkAnd [ap (Const.«objectAttached») ([«?A», «?O1»]), ap (Const.«objectAttached») ([«?A», «?O2»])]))
axiom ax_2172 : Holds (ap (Const.«subclass») ([Const.«Detaching», Const.«DualObjectProcess»]))
axiom ax_2173 : ∀ («?DETACH» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DETACH», Const.«Detaching»]), ap (Const.«patient») ([«?DETACH», «?OBJ1»]), ap (Const.«patient») ([«?DETACH», «?OBJ2»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?DETACH»])]), ap (Const.«connected») ([«?OBJ1», «?OBJ2»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?DETACH»])]), mkNot (ap (Const.«connected») ([«?OBJ1», «?OBJ2»]))])]))
axiom ax_2174 : ∀ («?DETACH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DETACH», Const.«Detaching»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«CorpuscularObject»]), ap (Const.«patient») ([«?DETACH», «?OBJ»])])))
axiom ax_2175 : Holds (ap (Const.«instance») ([Const.«objectDetached», Const.«CaseRole»]))
axiom ax_2176 : Holds (ap (Const.«subrelation») ([Const.«objectDetached», Const.«patient»]))
axiom ax_2177 : ∀ («?A» : Obj) («?D» : Obj) («?O1» : Obj) («?O2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?D», Const.«Detaching»]), ap (Const.«patient») ([«?D», «?O1»]), ap (Const.«patient») ([«?D», «?O2»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?D»])]), ap (Const.«connected») ([«?O1», «?O2»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?A»])]), mkNot (ap (Const.«connected») ([«?O1», «?O2»]))])]) (mkAnd [ap (Const.«objectDetached») ([«?A», «?O1»]), ap (Const.«objectDetached») ([«?A», «?O2»])]))
axiom ax_2178 : Holds (ap (Const.«subclass») ([Const.«Ungrasping», Const.«Detaching»]))
axiom ax_2179 : ∀ («?AGENT» : Obj) («?GRAB» : Obj) («?RELEASE» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?RELEASE», Const.«Ungrasping»]), ap (Const.«agent») ([«?GRAB», «?AGENT»]), ap (Const.«patient») ([«?GRAB», «?THING»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?RELEASE»])]), ap (Const.«grasps») ([«?AGENT», «?THING»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?RELEASE»])]), mkNot (ap (Const.«grasps») ([«?AGENT», «?THING»]))])]))
axiom ax_2180 : Holds (ap (Const.«subclass») ([Const.«Combining», Const.«DualObjectProcess»]))
axiom ax_2181 : ∀ («?COMBINE» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (mkAnd [ap (Const.«instance») ([«?COMBINE», Const.«Combining»]), ap (Const.«resource») ([«?COMBINE», «?OBJ1»]), ap (Const.«result») ([«?COMBINE», «?OBJ2»])]) (mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?COMBINE»])]), mkNot (ap (Const.«part») ([«?OBJ1», «?OBJ2»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?COMBINE»])]), ap (Const.«part») ([«?OBJ1», «?OBJ2»])])]))
axiom ax_2182 : ∀ («?COMBINE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMBINE», Const.«Combining»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»]), ap (Const.«patient») ([«?COMBINE», «?OBJ»])])))
axiom ax_2183 : Holds (ap (Const.«subclass») ([Const.«Separating», Const.«DualObjectProcess»]))
axiom ax_2184 : Holds (ap (Const.«disjoint») ([Const.«Separating», Const.«Combining»]))
axiom ax_2185 : ∀ («?SEPARATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SEPARATE», Const.«Separating»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«SelfConnectedObject»]), ap (Const.«patient») ([«?SEPARATE», «?OBJ»])])))
axiom ax_2186 : Holds (ap (Const.«subclass») ([Const.«Breaking», Const.«Damaging»]))
axiom ax_2187 : Holds (ap (Const.«subclass») ([Const.«Breaking», Const.«Separating»]))
axiom ax_2188 : Holds (ap (Const.«subclass») ([Const.«ChemicalProcess», Const.«InternalChange»]))
axiom ax_2189 : Holds (ap (Const.«partition») ([Const.«ChemicalProcess», Const.«ChemicalSynthesis», Const.«ChemicalDecomposition»]))
axiom ax_2190 : ∀ («?PROC» : Obj) («?STUFF» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«ChemicalProcess»]), mkOr [ap (Const.«resource») ([«?PROC», «?STUFF»]), ap (Const.«result») ([«?PROC», «?STUFF»])]]) (ap (Const.«instance») ([«?STUFF», Const.«PureSubstance»])))
axiom ax_2191 : Holds (ap (Const.«subclass») ([Const.«ChemicalSynthesis», Const.«ChemicalProcess»]))
axiom ax_2192 : Holds (ap (Const.«subclass») ([Const.«ChemicalSynthesis», Const.«Combining»]))
axiom ax_2193 : ∀ («?PROC» : Obj) («?SUBSTANCE1» : Obj) («?SUBSTANCE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«resource») ([«?PROC», «?SUBSTANCE1»]), ap (Const.«result») ([«?PROC», «?SUBSTANCE2»]), ap (Const.«instance») ([«?SUBSTANCE1», Const.«ElementalSubstance»]), ap (Const.«instance») ([«?SUBSTANCE2», Const.«CompoundSubstance»])]) (ap (Const.«instance») ([«?PROC», Const.«ChemicalSynthesis»])))
axiom ax_2194 : ∀ («?COMPOUND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMPOUND», Const.«CompoundSubstance»])) (mkExists (fun («?ELEMENT1» : Obj) => mkExists (fun («?ELEMENT2» : Obj) => mkExists (fun («?PROCESS» : Obj) => mkAnd [ap (Const.«instance») ([«?ELEMENT1», Const.«ElementalSubstance»]), ap (Const.«instance») ([«?ELEMENT2», Const.«ElementalSubstance»]), mkNot (ap (Const.«equal») ([«?ELEMENT1», «?ELEMENT2»])), ap (Const.«instance») ([«?PROCESS», Const.«ChemicalSynthesis»]), ap (Const.«resource») ([«?PROCESS», «?ELEMENT1»]), ap (Const.«resource») ([«?PROCESS», «?ELEMENT2»]), ap (Const.«result») ([«?PROCESS», «?COMPOUND»])])))))
axiom ax_2195 : ∀ («?COMPOUND» : Obj) («?ELEMENT1» : Obj) («?ELEMENT2» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ELEMENT1», Const.«ElementalSubstance»]), ap (Const.«instance») ([«?ELEMENT2», Const.«ElementalSubstance»]), mkNot (ap (Const.«equal») ([«?ELEMENT1», «?ELEMENT2»])), ap (Const.«instance») ([«?PROCESS», Const.«ChemicalSynthesis»]), ap (Const.«resource») ([«?PROCESS», «?ELEMENT1»]), ap (Const.«resource») ([«?PROCESS», «?ELEMENT2»]), ap (Const.«result») ([«?PROCESS», «?COMPOUND»])]) (ap (Const.«instance») ([«?COMPOUND», Const.«CompoundSubstance»])))
axiom ax_2196 : Holds (ap (Const.«subclass») ([Const.«ChemicalDecomposition», Const.«ChemicalProcess»]))
axiom ax_2197 : Holds (ap (Const.«subclass») ([Const.«ChemicalDecomposition», Const.«Separating»]))
axiom ax_2198 : ∀ («?PROC» : Obj) («?SUBSTANCE1» : Obj) («?SUBSTANCE2» : Obj), Holds (mkImp (mkAnd [ap (Const.«resource») ([«?PROC», «?SUBSTANCE1»]), ap (Const.«result») ([«?PROC», «?SUBSTANCE2»]), ap (Const.«instance») ([«?SUBSTANCE1», Const.«CompoundSubstance»]), ap (Const.«instance») ([«?SUBSTANCE2», Const.«ElementalSubstance»])]) (ap (Const.«instance») ([«?PROC», Const.«ChemicalDecomposition»])))
axiom ax_2199 : Holds (ap (Const.«subclass») ([Const.«Combustion», Const.«ChemicalDecomposition»]))
axiom ax_2200 : ∀ («?COMBUSTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMBUSTION», Const.«Combustion»])) (mkExists (fun («?HEAT» : Obj) => mkExists (fun («?LIGHT» : Obj) => mkAnd [ap (Const.«instance») ([«?HEAT», Const.«Heating»]), ap (Const.«instance») ([«?LIGHT», Const.«RadiatingLight»]), ap (Const.«subProcess») ([«?HEAT», «?COMBUSTION»]), ap (Const.«subProcess») ([«?LIGHT», «?COMBUSTION»])]))))
axiom ax_2201 : Holds (ap (Const.«instance») ([Const.«Flammable», Const.«PhysicalAttribute»]))
axiom ax_2202 : ∀ («?X» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?X», Const.«Flammable»])) (ap (Const.«capability») ([Const.«Combustion», Const.«patient», «?X»])))
axiom ax_2203 : Holds (ap (Const.«subclass») ([Const.«InternalChange», Const.«Process»]))
axiom ax_2204 : ∀ («?CHANGE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?CHANGE», Const.«InternalChange»]), ap (Const.«patient») ([«?CHANGE», «?OBJ»])]) (mkExists (fun («?PROPERTY» : Obj) => mkOr [mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«attribute») ([«?OBJ», «?PROPERTY»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), mkNot (ap (Const.«attribute») ([«?OBJ», «?PROPERTY»]))])], mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), mkNot (ap (Const.«attribute») ([«?OBJ», «?PROPERTY»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?CHANGE»])]), ap (Const.«attribute») ([«?OBJ», «?PROPERTY»])])]])))
axiom ax_2205 : Holds (ap (Const.«subclass») ([Const.«SurfaceChange», Const.«InternalChange»]))
axiom ax_2206 : ∀ («?ALT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ALT», Const.«SurfaceChange»]), ap (Const.«patient») ([«?ALT», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkExists (fun («?PROPERTY» : Obj) => mkAnd [ap (Const.«superficialPart») ([«?PART», «?OBJ»]), mkOr [mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?ALT»])]), ap (Const.«attribute») ([«?PART», «?PROPERTY»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?ALT»])]), mkNot (ap (Const.«attribute») ([«?PART», «?PROPERTY»]))])], mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?ALT»])]), mkNot (ap (Const.«attribute») ([«?PART», «?PROPERTY»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?ALT»])]), ap (Const.«attribute») ([«?PART», «?PROPERTY»])])]]]))))
axiom ax_2207 : Holds (ap (Const.«subclass») ([Const.«Coloring», Const.«SurfaceChange»]))
axiom ax_2208 : ∀ («?COLORING» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?COLORING», Const.«Coloring»]), ap (Const.«patient») ([«?COLORING», «?OBJ»])]) (mkExists (fun («?PROPERTY» : Obj) => mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«instance») ([«?PROPERTY», Const.«ColorAttribute»]), mkOr [mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?COLORING»])]), ap (Const.«attribute») ([«?PART», «?PROPERTY»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?COLORING»])]), mkNot (ap (Const.«attribute») ([«?PART», «?PROPERTY»]))])], mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?COLORING»])]), mkNot (ap (Const.«attribute») ([«?PART», «?PROPERTY»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?COLORING»])]), ap (Const.«attribute») ([«?PART», «?PROPERTY»])])]]]))))
axiom ax_2209 : Holds (ap (Const.«subclass») ([Const.«ShapeChange», Const.«InternalChange»]))
axiom ax_2210 : ∀ («?ALT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ALT», Const.«ShapeChange»]), ap (Const.«patient») ([«?ALT», «?OBJ»])]) (mkExists (fun («?PROPERTY» : Obj) => mkAnd [ap (Const.«instance») ([«?PROPERTY», Const.«ShapeAttribute»]), mkOr [mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?ALT»])]), ap (Const.«attribute») ([«?OBJ», «?PROPERTY»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?ALT»])]), mkNot (ap (Const.«attribute») ([«?OBJ», «?PROPERTY»]))])], mkAnd [ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?ALT»])]), mkNot (ap (Const.«attribute») ([«?OBJ», «?PROPERTY»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?ALT»])]), ap (Const.«attribute») ([«?OBJ», «?PROPERTY»])])]]])))
axiom ax_2211 : Holds (ap (Const.«subclass») ([Const.«ContentDevelopment», Const.«IntentionalProcess»]))
axiom ax_2212 : ∀ («?DEVELOP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVELOP», Const.«ContentDevelopment»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«ContentBearingObject»]), ap (Const.«result») ([«?DEVELOP», «?OBJ»])])))
axiom ax_2213 : Holds (ap (Const.«subclass») ([Const.«Reading», Const.«ContentDevelopment»]))
axiom ax_2214 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Reading», Const.«Interpreting»]))
axiom ax_2215 : ∀ («?READ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?READ», Const.«Reading»])) (mkExists (fun («?TEXT» : Obj) => mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«instance») ([«?TEXT», Const.«Text»]), ap (Const.«containsInformation») ([«?TEXT», «?PROP»]), ap (Const.«realization») ([«?READ», «?PROP»])]))))
axiom ax_2216 : Holds (ap (Const.«subclass») ([Const.«Writing», Const.«ContentDevelopment»]))
axiom ax_2217 : Holds (ap (Const.«subclass») ([Const.«Encoding», Const.«Writing»]))
axiom ax_2218 : Holds (ap (Const.«subclass») ([Const.«Decoding», Const.«Writing»]))
axiom ax_2219 : Holds (ap (Const.«disjoint») ([Const.«Decoding», Const.«Encoding»]))
axiom ax_2220 : ∀ («?DECODE» : Obj) («?DOC1» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DECODE», Const.«Decoding»]), ap (Const.«patient») ([«?DECODE», «?DOC1»])]) (mkExists (fun («?ENCODE» : Obj) => mkExists (fun («?DOC2» : Obj) => mkExists (fun («?TIME» : Obj) => mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«containsInformation») ([«?DOC2», «?PROP»]), ap (Const.«containsInformation») ([«?DOC1», «?PROP»]), ap (Const.«temporalPart») ([«?TIME», ap (Const.«PastFn») ([ap (Const.«WhenFn») ([«?DECODE»])])]), ap (Const.«holdsDuring») ([«?TIME», mkAnd [ap (Const.«instance») ([«?ENCODE», Const.«Encoding»]), ap (Const.«patient») ([«?ENCODE», «?DOC2»])]])]))))))
axiom ax_2221 : Holds (ap (Const.«subclass») ([Const.«Translating», Const.«ContentDevelopment»]))
axiom ax_2222 : Holds (ap (Const.«subclass») ([Const.«Translating», Const.«DualObjectProcess»]))
axiom ax_2223 : ∀ («?EXPRESSION1» : Obj) («?EXPRESSION2» : Obj) («?TRANSLATE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TRANSLATE», Const.«Translating»]), ap (Const.«patient») ([«?TRANSLATE», «?EXPRESSION1»]), ap (Const.«result») ([«?TRANSLATE», «?EXPRESSION2»])]) (mkExists (fun («?LANGUAGE1» : Obj) => mkExists (fun («?LANGUAGE2» : Obj) => mkExists (fun («?ENTITY» : Obj) => mkAnd [ap (Const.«representsInLanguage») ([«?EXPRESSION1», «?ENTITY», «?LANGUAGE1»]), ap (Const.«representsInLanguage») ([«?EXPRESSION2», «?ENTITY», «?LANGUAGE2»]), mkNot (ap (Const.«equal») ([«?LANGUAGE1», «?LANGUAGE2»]))])))))
axiom ax_2224 : Holds (ap (Const.«subclass») ([Const.«Wetting», Const.«Putting»]))
axiom ax_2225 : ∀ («?WET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WET», Const.«Wetting»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«patient») ([«?WET», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?WET»])]), mkNot (ap (Const.«attribute») ([«?OBJ», Const.«Damp»]))]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?WET»])]), ap (Const.«attribute») ([«?OBJ», Const.«Damp»])])])))
axiom ax_2226 : ∀ («?WET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WET», Const.«Wetting»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«attribute») ([«?OBJ», Const.«Liquid»]), ap (Const.«patient») ([«?WET», «?OBJ»])])))
axiom ax_2227 : Holds (ap (Const.«subclass») ([Const.«Drying», Const.«Removing»]))
axiom ax_2228 : ∀ («?DRY» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DRY», Const.«Drying»]), ap (Const.«patient») ([«?DRY», «?OBJ»])]) (ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?DRY»])]), ap (Const.«attribute») ([«?OBJ», Const.«Dry»])])))
axiom ax_2229 : Holds (ap (Const.«subclass») ([Const.«Creation», Const.«InternalChange»]))
axiom ax_2230 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Creation», Const.«Destruction»]))
axiom ax_2231 : ∀ («?ACTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ACTION», Const.«Creation»])) (mkExists (fun («?RESULT» : Obj) => ap (Const.«result») ([«?ACTION», «?RESULT»]))))
axiom ax_2232 : ∀ («?PROCESS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PROCESS», Const.«Creation»])) (mkExists (fun («?PATIENT» : Obj) => mkAnd [ap (Const.«patient») ([«?PROCESS», «?PATIENT»]), ap (Const.«time») ([«?PATIENT», ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]), mkNot (ap (Const.«time») ([«?PATIENT», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]))])))
axiom ax_2233 : ∀ («?PATIENT» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«patient») ([«?PROCESS», «?PATIENT»]), ap (Const.«time») ([«?PATIENT», ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]), mkNot (ap (Const.«time») ([«?PATIENT», ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROCESS»])])]))]) (ap (Const.«instance») ([«?PROCESS», Const.«Creation»])))
axiom ax_2234 : Holds (ap (Const.«subclass») ([Const.«Making», Const.«Creation»]))
axiom ax_2235 : Holds (ap (Const.«subclass») ([Const.«Making», Const.«IntentionalProcess»]))
axiom ax_2236 : ∀ («?MAKING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MAKING», Const.«Making»])) (mkExists (fun («?ARTIFACT» : Obj) => mkAnd [ap (Const.«instance») ([«?ARTIFACT», Const.«Artifact»]), ap (Const.«result») ([«?MAKING», «?ARTIFACT»])])))
axiom ax_2237 : Holds (ap (Const.«subclass») ([Const.«Constructing», Const.«Making»]))
axiom ax_2238 : ∀ («?ARTIFACT» : Obj) («?BUILD» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BUILD», Const.«Constructing»]), ap (Const.«result») ([«?BUILD», «?ARTIFACT»])]) (ap (Const.«instance») ([«?ARTIFACT», Const.«StationaryArtifact»])))
axiom ax_2239 : ∀ («?ARTIFACT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ARTIFACT», Const.«StationaryArtifact»])) (mkExists (fun («?BUILD» : Obj) => mkAnd [ap (Const.«instance») ([«?BUILD», Const.«Constructing»]), ap (Const.«result») ([«?BUILD», «?ARTIFACT»])])))
axiom ax_2240 : Holds (ap (Const.«subclass») ([Const.«Manufacture», Const.«Making»]))
axiom ax_2241 : Holds (ap (Const.«subclass») ([Const.«Publication», Const.«Manufacture»]))
axiom ax_2242 : Holds (ap (Const.«subclass») ([Const.«Publication», Const.«ContentDevelopment»]))
axiom ax_2243 : ∀ («?PUB» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PUB», Const.«Publication»])) (mkExists (fun («?TEXT» : Obj) => mkAnd [ap (Const.«instance») ([«?TEXT», Const.«Text»]), ap (Const.«patient») ([«?PUB», «?TEXT»])])))
axiom ax_2244 : Holds (ap (Const.«subclass») ([Const.«Cooking», Const.«Making»]))
axiom ax_2245 : ∀ («?COOK» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COOK», Const.«Cooking»])) (mkExists (fun («?FOOD» : Obj) => mkAnd [ap (Const.«instance») ([«?FOOD», ap (Const.«FoodForFn») ([Const.«Human»])]), ap (Const.«result») ([«?COOK», «?FOOD»])])))
axiom ax_2246 : Holds (ap (Const.«subclass») ([Const.«Pursuing», Const.«IntentionalProcess»]))
axiom ax_2247 : ∀ («?PURSUE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PURSUE», Const.«Pursuing»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ», Const.«Object»]), ap (Const.«patient») ([«?PURSUE», «?OBJ»])])))
axiom ax_2248 : ∀ («?AGENT» : Obj) («?OBJ» : Obj) («?PURSUE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PURSUE», Const.«Pursuing»]), ap (Const.«agent») ([«?PURSUE», «?AGENT»]), ap (Const.«patient») ([«?PURSUE», «?OBJ»])]) (ap (Const.«holdsDuring») ([«?PURSUE», ap (Const.«wants») ([«?AGENT», «?OBJ»])])))
axiom ax_2249 : ∀ («?AGENT» : Obj) («?OBJ» : Obj) («?PURSUE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PURSUE», Const.«Pursuing»]), ap (Const.«agent») ([«?PURSUE», «?AGENT»]), ap (Const.«patient») ([«?PURSUE», «?OBJ»])]) (ap (Const.«holdsDuring») ([«?PURSUE», mkNot (ap (Const.«possesses») ([«?AGENT», «?OBJ»]))])))
axiom ax_2250 : Holds (ap (Const.«subclass») ([Const.«Hunting», Const.«Pursuing»]))
axiom ax_2251 : ∀ («?H» : Obj), Holds (mkImp (ap (Const.«instance») ([«?H», Const.«Hunting»])) (mkExists (fun («?T» : Obj) => mkAnd [ap (Const.«instance») ([«?T», Const.«Animal»]), ap (Const.«patient») ([«?H», «?T»])])))
axiom ax_2252 : ∀ («?H» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?H», Const.«Hunting»]), ap (Const.«patient») ([«?H», «?P»])]) (ap (Const.«hasPurpose») ([«?H», mkExists (fun («?PROC» : Obj) => mkAnd [ap (Const.«patient») ([«?PROC», «?P»]), mkOr [ap (Const.«instance») ([«?PROC», Const.«Confining»]), ap (Const.«instance») ([«?PROC», Const.«Killing»])]])])))
axiom ax_2253 : Holds (ap (Const.«subclass») ([Const.«Investigating», Const.«IntentionalProcess»]))
axiom ax_2254 : ∀ («?INVESTIGATE» : Obj) («?PROP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INVESTIGATE», Const.«Investigating»]), ap (Const.«patient») ([«?INVESTIGATE», «?PROP»])]) (ap (Const.«instance») ([«?PROP», Const.«Formula»])))
axiom ax_2255 : ∀ («?AGENT» : Obj) («?INVESTIGATE» : Obj) («?PROP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INVESTIGATE», Const.«Investigating»]), ap (Const.«agent») ([«?INVESTIGATE», «?AGENT»]), ap (Const.«patient») ([«?INVESTIGATE», «?PROP»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?INVESTIGATE»]), mkNot (ap (Const.«knows») ([«?AGENT», «?PROP»]))])))
axiom ax_2256 : ∀ («?AGENT» : Obj) («?INVESTIGATE» : Obj) («?PROP» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?INVESTIGATE», Const.«Investigating»]), ap (Const.«agent») ([«?INVESTIGATE», «?AGENT»]), ap (Const.«patient») ([«?INVESTIGATE», «?PROP»])]) (ap (Const.«hasPurposeForAgent») ([«?INVESTIGATE», ap (Const.«knows») ([«?AGENT», «?PROP»]), «?AGENT»])))
axiom ax_2257 : Holds (ap (Const.«subclass») ([Const.«Experimenting», Const.«Investigating»]))
axiom ax_2258 : Holds (ap (Const.«subclass») ([Const.«DiagnosticProcess», Const.«Investigating»]))
axiom ax_2259 : ∀ («?AGENT» : Obj) («?PROC» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROC», Const.«DiagnosticProcess»]), ap (Const.«agent») ([«?PROC», «?AGENT»])]) (mkExists (fun («?CAUSE» : Obj) => ap (Const.«hasPurposeForAgent») ([«?PROC», ap (Const.«knows») ([«?AGENT», ap (Const.«causes») ([«?CAUSE», «?PROC»])]), «?AGENT»]))))
axiom ax_2260 : Holds (ap (Const.«subclass») ([Const.«Searching», Const.«Investigating»]))
axiom ax_2261 : ∀ («?S» : Obj), Holds (mkImp (ap (Const.«instance») ([«?S», Const.«Searching»])) (mkExists (fun («?AGENT» : Obj) => mkExists (fun («?OBJ» : Obj) => mkExists (fun («?LOC» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»]), ap (Const.«agent») ([«?S», «?AGENT»]), ap (Const.«instance») ([«?OBJ», Const.«Physical»]), ap (Const.«patient») ([«?S», «?OBJ»]), ap (Const.«instance») ([«?LOC», Const.«Object»]), ap (Const.«located») ([«?OBJ», «?LOC»]), ap (Const.«hasPurposeForAgent») ([«?S», ap (Const.«knows») ([«?AGENT», ap (Const.«located») ([«?OBJ», «?LOC»])]), «?AGENT»])])))))
axiom ax_2262 : ∀ («?OBJ» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?S», Const.«Searching»]), ap (Const.«patient») ([«?S», «?OBJ»]), ap (Const.«instance») ([«?OBJ», Const.«Physical»])]) (mkExists (fun («?LOC» : Obj) => mkExists (fun («?AGENT» : Obj) => mkAnd [ap (Const.«instance») ([«?AGENT», Const.«CognitiveAgent»]), ap (Const.«agent») ([«?S», «?AGENT»]), ap (Const.«instance») ([«?LOC», Const.«Object»]), ap (Const.«located») ([«?OBJ», «?LOC»]), ap (Const.«hasPurposeForAgent») ([«?S», ap (Const.«knows») ([«?AGENT», ap (Const.«located») ([«?OBJ», «?LOC»])]), «?AGENT»])]))))
axiom ax_2263 : Holds (ap (Const.«subclass») ([Const.«SocialInteraction», Const.«IntentionalProcess»]))
axiom ax_2264 : ∀ («?INTERACTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INTERACTION», Const.«SocialInteraction»])) (mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkAnd [ap (Const.«involvedInEvent») ([«?INTERACTION», «?AGENT1»]), ap (Const.«involvedInEvent») ([«?INTERACTION», «?AGENT2»]), ap (Const.«instance») ([«?AGENT1», Const.«AutonomousAgent»]), ap (Const.«instance») ([«?AGENT2», Const.«AutonomousAgent»]), mkNot (ap (Const.«equal») ([«?AGENT1», «?AGENT2»]))]))))
axiom ax_2265 : ∀ («?A» : Obj), Holds (mkImp (ap (Const.«instance») ([«?A», Const.«AutonomousAgent»])) (ap (Const.«capability») ([Const.«SocialInteraction», Const.«agent», «?A»])))
axiom ax_2266 : Holds (ap (Const.«subclass») ([Const.«Pretending», Const.«SocialInteraction»]))
axiom ax_2267 : ∀ («?PRETEND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PRETEND», Const.«Pretending»])) (mkExists (fun («?PERSON» : Obj) => mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«hasPurpose») ([«?PRETEND», ap (Const.«believes») ([«?PERSON», «?PROP»])]), ap (Const.«truth») ([«?PROP», Const.«False»])]))))
axiom ax_2268 : Holds (ap (Const.«subclass») ([Const.«Communication», Const.«SocialInteraction»]))
axiom ax_2269 : Holds (ap (Const.«subclass») ([Const.«Communication», Const.«ContentBearingProcess»]))
axiom ax_2270 : Holds (ap (Const.«partition») ([Const.«Communication», Const.«Stating», Const.«Supposing», Const.«Directing», Const.«Committing», Const.«Expressing», Const.«Declaring»]))
axiom ax_2271 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Communication», Const.«ContentDevelopment»]))
axiom ax_2272 : ∀ («?COMMUNICATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMMUNICATE», Const.«Communication»])) (mkExists (fun («?PHYS» : Obj) => mkExists (fun («?ENTITY» : Obj) => mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkAnd [ap (Const.«refers») ([«?PHYS», «?ENTITY»]), ap (Const.«patient») ([«?COMMUNICATE», «?PHYS»]), ap (Const.«instance») ([«?AGENT1», Const.«CognitiveAgent»]), ap (Const.«agent») ([«?COMMUNICATE», «?AGENT1»]), ap (Const.«instance») ([«?AGENT2», Const.«CognitiveAgent»]), ap (Const.«destination») ([«?COMMUNICATE», «?AGENT2»])]))))))
axiom ax_2273 : Holds (ap (Const.«subclass») ([Const.«Disseminating», Const.«Communication»]))
axiom ax_2274 : ∀ («?DISSEMINATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DISSEMINATE», Const.«Disseminating»])) (mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkAnd [ap (Const.«destination») ([«?DISSEMINATE», «?AGENT1»]), ap (Const.«instance») ([«?AGENT1», Const.«CognitiveAgent»]), ap (Const.«destination») ([«?DISSEMINATE», «?AGENT2»]), ap (Const.«instance») ([«?AGENT2», Const.«CognitiveAgent»]), mkNot (ap (Const.«equal») ([«?AGENT1», «?AGENT2»]))]))))
axiom ax_2275 : Holds (ap (Const.«subclass») ([Const.«Demonstrating», Const.«Disseminating»]))
axiom ax_2276 : ∀ («?DEMO» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEMO», Const.«Demonstrating»])) (mkExists (fun («?PERSON» : Obj) => ap (Const.«attends») ([«?DEMO», «?PERSON»]))))
axiom ax_2277 : Holds (ap (Const.«subrelation») ([Const.«attends», Const.«experiencer»]))
axiom ax_2278 : Holds (ap (Const.«instance») ([Const.«attends», Const.«CaseRole»]))
axiom ax_2279 : Holds (ap (Const.«instance») ([Const.«attends», Const.«PartialValuedRelation»]))
axiom ax_2280 : Holds (ap (Const.«subclass») ([Const.«Gesture», Const.«Communication»]))
axiom ax_2281 : Holds (ap (Const.«subclass») ([Const.«Gesture», Const.«BodyMotion»]))
axiom ax_2282 : Holds (ap (Const.«subclass») ([Const.«Advertising», Const.«Disseminating»]))
axiom ax_2283 : ∀ («?ADVERT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ADVERT», Const.«Advertising»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«refers») ([«?ADVERT», «?OBJ»]), ap (Const.«hasPurpose») ([«?ADVERT», mkExists (fun («?SALE» : Obj) => mkAnd [ap (Const.«instance») ([«?SALE», Const.«Selling»]), ap (Const.«patient») ([«?SALE», «?OBJ»])])])])))
axiom ax_2284 : Holds (ap (Const.«subclass») ([Const.«Expressing», Const.«Communication»]))
axiom ax_2285 : ∀ («?AGENT» : Obj) («?EXPRESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EXPRESS», Const.«Expressing»]), ap (Const.«agent») ([«?EXPRESS», «?AGENT»])]) (mkExists (fun («?STATE» : Obj) => mkAnd [ap (Const.«instance») ([«?STATE», Const.«StateOfMind»]), ap (Const.«attribute») ([«?AGENT», «?STATE»]), ap (Const.«represents») ([«?EXPRESS», «?STATE»])])))
axiom ax_2286 : Holds (ap (Const.«subclass») ([Const.«LinguisticCommunication», Const.«Communication»]))
axiom ax_2287 : ∀ («?COMMUNICATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMMUNICATE», Const.«LinguisticCommunication»])) (mkExists (fun («?OBJ» : Obj) => mkAnd [ap (Const.«represents») ([«?COMMUNICATE», «?OBJ»]), ap (Const.«instance») ([«?OBJ», Const.«LinguisticExpression»]), ap (Const.«patient») ([«?COMMUNICATE», «?OBJ»])])))
axiom ax_2288 : Holds (ap (Const.«subclass») ([Const.«Stating», Const.«LinguisticCommunication»]))
axiom ax_2289 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj) («?STATE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?STATE», Const.«Stating»]), ap (Const.«agent») ([«?STATE», «?AGENT»]), ap (Const.«patient») ([«?STATE», «?FORMULA»]), ap (Const.«instance») ([«?FORMULA», Const.«Formula»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?STATE»]), ap (Const.«believes») ([«?AGENT», «?FORMULA»])])))
axiom ax_2290 : Holds (ap (Const.«subclass») ([Const.«Disagreeing», Const.«Stating»]))
axiom ax_2291 : ∀ («?DIS» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DIS», Const.«Disagreeing»])) (mkExists (fun («?A1» : Obj) => mkExists (fun («?A2» : Obj) => mkExists (fun («?STATE1» : Obj) => mkExists (fun («?STATE2» : Obj) => mkExists (fun («?STMT1» : Obj) => mkExists (fun («?STMT2» : Obj) => mkAnd [ap (Const.«subProcess») ([«?STATE1», «?DIS»]), ap (Const.«subProcess») ([«?STATE2», «?DIS»]), ap (Const.«agent») ([«?STATE1», «?A1»]), ap (Const.«agent») ([«?STATE2», «?A2»]), mkNot (ap (Const.«equal») ([«?A1», «?A2»])), ap (Const.«containsInformation») ([«?STATE1», «?STMT1»]), ap (Const.«containsInformation») ([«?STATE2», «?STMT2»]), mkNot (ap (Const.«consistent») ([«?STMT1», «?STMT2»]))]))))))))
axiom ax_2292 : Holds (ap (Const.«subclass») ([Const.«Supposing», Const.«LinguisticCommunication»]))
axiom ax_2293 : Holds (ap (Const.«subclass») ([Const.«Directing», Const.«LinguisticCommunication»]))
axiom ax_2294 : Holds (ap (Const.«subclass») ([Const.«Ordering», Const.«Directing»]))
axiom ax_2295 : ∀ («?FORMULA» : Obj) («?ORDER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ORDER», Const.«Ordering»]), ap (Const.«patient») ([«?ORDER», «?FORMULA»])]) (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Obligation»])))
axiom ax_2296 : Holds (ap (Const.«subclass») ([Const.«Requesting», Const.«Directing»]))
axiom ax_2297 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj) («?REQUEST» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?REQUEST», Const.«Requesting»]), ap (Const.«agent») ([«?REQUEST», «?AGENT»]), ap (Const.«patient») ([«?REQUEST», «?FORMULA»]), ap (Const.«instance») ([«?FORMULA», Const.«Formula»])]) (ap (Const.«desires») ([«?AGENT», «?FORMULA»])))
axiom ax_2298 : Holds (ap (Const.«subclass») ([Const.«Questioning», Const.«Directing»]))
axiom ax_2299 : ∀ («?AGENT» : Obj) («?FORMULA» : Obj) («?QUESTION» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?QUESTION», Const.«Questioning»]), ap (Const.«agent») ([«?QUESTION», «?AGENT»]), ap (Const.«patient») ([«?QUESTION», «?FORMULA»]), ap (Const.«instance») ([«?FORMULA», Const.«Formula»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?QUESTION»]), mkNot (ap (Const.«knows») ([«?AGENT», «?FORMULA»]))])))
axiom ax_2300 : Holds (ap (Const.«subclass») ([Const.«Committing», Const.«LinguisticCommunication»]))
axiom ax_2301 : ∀ («?COMMIT» : Obj) («?FORMULA» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?COMMIT», Const.«Committing»]), ap (Const.«patient») ([«?COMMIT», «?FORMULA»]), ap (Const.«instance») ([«?FORMULA», Const.«Formula»])]) (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Promise»])))
axiom ax_2302 : Holds (ap (Const.«subclass») ([Const.«Offering», Const.«Committing»]))
axiom ax_2303 : Holds (ap (Const.«subclass») ([Const.«Declaring», Const.«LinguisticCommunication»]))
axiom ax_2304 : ∀ («?DECLARE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DECLARE», Const.«Declaring»])) (mkExists (fun («?PROP» : Obj) => mkExists (fun («?NORM» : Obj) => mkOr [ap (Const.«confersNorm») ([«?DECLARE», «?PROP», «?NORM»]), ap (Const.«deprivesNorm») ([«?DECLARE», «?PROP», «?NORM»])]))))
axiom ax_2305 : Holds (ap (Const.«subclass») ([Const.«Naming», Const.«Declaring»]))
axiom ax_2306 : ∀ («?NAME» : Obj) («?PROCESS» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«Naming»]), ap (Const.«patient») ([«?PROCESS», «?THING»]), ap (Const.«destination») ([«?PROCESS», «?NAME»])]) (ap (Const.«holdsDuring») ([ap (Const.«FutureFn») ([ap (Const.«WhenFn») ([«?PROCESS»])]), ap (Const.«names») ([«?NAME», «?THING»])])))
axiom ax_2307 : Holds (ap (Const.«subclass») ([Const.«Cooperation», Const.«SocialInteraction»]))
axiom ax_2308 : ∀ («?COOPERATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COOPERATE», Const.«Cooperation»])) (mkExists (fun («?PURP» : Obj) => mkForall (fun («?AGENT» : Obj) => mkImp (ap (Const.«agent») ([«?COOPERATE», «?AGENT»])) (ap (Const.«hasPurposeForAgent») ([«?COOPERATE», «?PURP», «?AGENT»]))))))
axiom ax_2309 : Holds (ap (Const.«subclass») ([Const.«Meeting», Const.«SocialInteraction»]))
axiom ax_2310 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?MEET» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MEET», Const.«Meeting»]), ap (Const.«agent») ([«?MEET», «?AGENT1»]), ap (Const.«agent») ([«?MEET», «?AGENT2»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?MEET»]), ap (Const.«orientation») ([«?AGENT1», «?AGENT2», Const.«Near»])])))
axiom ax_2311 : ∀ («?MEET» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MEET», Const.«Meeting»])) (mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkAnd [ap (Const.«agent») ([«?MEET», «?AGENT1»]), ap (Const.«agent») ([«?MEET», «?AGENT2»]), ap (Const.«hasPurpose») ([«?MEET», mkExists (fun («?COMM» : Obj) => mkAnd [ap (Const.«instance») ([«?COMM», Const.«Communication»]), ap (Const.«agent») ([«?COMM», «?AGENT1»]), ap (Const.«agent») ([«?COMM», «?AGENT2»])])])]))))
axiom ax_2312 : Holds (ap (Const.«subclass») ([Const.«Contest», Const.«SocialInteraction»]))
axiom ax_2313 : ∀ («?CONTEST» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CONTEST», Const.«Contest»])) (mkExists (fun («?AGENT1» : Obj) => mkExists (fun («?AGENT2» : Obj) => mkExists (fun («?PURP1» : Obj) => mkExists (fun («?PURP2» : Obj) => mkAnd [ap (Const.«agent») ([«?CONTEST», «?AGENT1»]), ap (Const.«agent») ([«?CONTEST», «?AGENT2»]), ap (Const.«hasPurposeForAgent») ([«?CONTEST», «?PURP1», «?AGENT1»]), ap (Const.«hasPurposeForAgent») ([«?CONTEST», «?PURP2», «?AGENT2»]), mkNot (ap (Const.«equal») ([«?AGENT1», «?AGENT2»])), mkNot (ap (Const.«equal») ([«?PURP1», «?PURP2»]))]))))))
axiom ax_2314 : Holds (ap (Const.«subclass») ([Const.«ViolentContest», Const.«Contest»]))
axiom ax_2315 : Holds (ap (Const.«subclass») ([Const.«War», Const.«ViolentContest»]))
axiom ax_2316 : ∀ («?WAR» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WAR», Const.«War»])) (mkExists (fun («?BATTLE» : Obj) => mkAnd [ap (Const.«instance») ([«?BATTLE», Const.«Battle»]), ap (Const.«subProcess») ([«?BATTLE», «?WAR»])])))
axiom ax_2317 : ∀ («?AGENT» : Obj) («?WAR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?WAR», Const.«War»]), ap (Const.«agent») ([«?WAR», «?AGENT»])]) (mkOr [ap (Const.«instance») ([«?AGENT», Const.«GeopoliticalArea»]), mkAnd [ap (Const.«instance») ([«?AGENT», Const.«Organization»]), mkForall (fun («?MEMBER» : Obj) => mkImp (ap (Const.«member») ([«?MEMBER», «?AGENT»])) (ap (Const.«instance») ([«?MEMBER», Const.«GeopoliticalArea»])))]]))
axiom ax_2318 : Holds (ap (Const.«subclass») ([Const.«Battle», Const.«ViolentContest»]))
axiom ax_2319 : ∀ («?BATTLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BATTLE», Const.«Battle»])) (mkExists (fun («?WAR» : Obj) => mkAnd [ap (Const.«instance») ([«?WAR», Const.«War»]), ap (Const.«subProcess») ([«?BATTLE», «?WAR»])])))
axiom ax_2320 : ∀ («?BATTLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BATTLE», Const.«Battle»])) (mkExists (fun («?ATTACK» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTACK», Const.«ViolentContest»]), ap (Const.«subProcess») ([«?ATTACK», «?BATTLE»])])))
axiom ax_2321 : Holds (ap (Const.«subclass») ([Const.«Game», Const.«Contest»]))
axiom ax_2322 : Holds (ap (Const.«subclass») ([Const.«Game», Const.«RecreationOrExercise»]))
axiom ax_2323 : Holds (ap (Const.«subclass») ([Const.«Sport», Const.«Game»]))
axiom ax_2324 : Holds (ap (Const.«subclass») ([Const.«LegalAction», Const.«Contest»]))
axiom ax_2325 : Holds (ap (Const.«subclass») ([Const.«Maneuver», Const.«IntentionalProcess»]))
axiom ax_2326 : ∀ («?MOVE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MOVE», Const.«Maneuver»])) (mkExists (fun («?CONTEST» : Obj) => mkAnd [ap (Const.«instance») ([«?CONTEST», Const.«Contest»]), ap (Const.«subProcess») ([«?MOVE», «?CONTEST»])])))
axiom ax_2327 : Holds (ap (Const.«subclass») ([Const.«Attack», Const.«Maneuver»]))
axiom ax_2328 : ∀ («?ATTACK» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ATTACK», Const.«Attack»])) (mkExists (fun («?CONTEST» : Obj) => mkAnd [ap (Const.«instance») ([«?CONTEST», Const.«ViolentContest»]), ap (Const.«subProcess») ([«?ATTACK», «?CONTEST»])])))
axiom ax_2329 : ∀ («?AGENT» : Obj) («?ATTACK» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTACK», Const.«Attack»]), ap (Const.«agent») ([«?ATTACK», «?AGENT»]), ap (Const.«patient») ([«?ATTACK», «?OBJ»])]) (ap (Const.«hasPurposeForAgent») ([«?ATTACK», mkExists (fun («?DAMAGE» : Obj) => mkAnd [ap (Const.«instance») ([«?DAMAGE», Const.«Damaging»]), ap (Const.«patient») ([«?DAMAGE», «?OBJ»])]), «?AGENT»])))
axiom ax_2330 : Holds (ap (Const.«subclass») ([Const.«DefensiveManeuver», Const.«Maneuver»]))
axiom ax_2331 : ∀ («?DEFENSE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEFENSE», Const.«DefensiveManeuver»])) (mkExists (fun («?CONTEST» : Obj) => mkAnd [ap (Const.«instance») ([«?CONTEST», Const.«ViolentContest»]), ap (Const.«subProcess») ([«?DEFENSE», «?CONTEST»])])))
axiom ax_2332 : ∀ («?AGENT» : Obj) («?DEFENSE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DEFENSE», Const.«DefensiveManeuver»]), ap (Const.«agent») ([«?DEFENSE», «?AGENT»])]) (ap (Const.«hasPurposeForAgent») ([«?DEFENSE», mkNot (mkExists (fun («?DAMAGE» : Obj) => mkAnd [ap (Const.«instance») ([«?DAMAGE», Const.«Damaging»]), ap (Const.«patient») ([«?DAMAGE», «?AGENT»])])), «?AGENT»])))
axiom ax_2333 : ∀ («?CONTEST» : Obj) («?MANEUVER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MANEUVER», Const.«Maneuver»]), ap (Const.«instance») ([«?CONTEST», Const.«ViolentContest»]), ap (Const.«subProcess») ([«?MANEUVER», «?CONTEST»])]) (mkOr [ap (Const.«instance») ([«?MANEUVER», Const.«Attack»]), ap (Const.«instance») ([«?MANEUVER», Const.«DefensiveManeuver»])]))
axiom ax_2334 : Holds (ap (Const.«subclass») ([Const.«Perception», Const.«PsychologicalProcess»]))
axiom ax_2335 : ∀ («?AGENT» : Obj) («?PERCEPT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PERCEPT», Const.«Perception»]), ap (Const.«agent») ([«?PERCEPT», «?AGENT»])]) (ap (Const.«instance») ([«?AGENT», Const.«Animal»])))
axiom ax_2336 : ∀ («?AGENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AGENT», Const.«SentientAgent»])) (ap (Const.«capability») ([Const.«Perception», Const.«experiencer», «?AGENT»])))
axiom ax_2337 : Holds (ap (Const.«instance») ([Const.«ImpairmentFn», Const.«UnaryFunction»]))
axiom ax_2338 : ∀ («?A» : Obj) («?S» : Obj) («?SI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SI», ap (Const.«ImpairmentFn») ([«?S»])]), ap (Const.«instrument») ([«?SI», «?A»])]) (mkExists (fun («?A2» : Obj) => mkAnd [mkNot (ap (Const.«equal») ([«?A2», «?A»])), ap (Const.«capability») ([«?S», Const.«instrument», «?A2»]), mkNot (ap (Const.«capability») ([«?S», Const.«instrument», «?A»]))])))
axiom ax_2339 : Holds (ap (Const.«instance») ([Const.«SenseImpairmentFn», Const.«UnaryFunction»]))
axiom ax_2340 : ∀ («?A» : Obj) («?S» : Obj) («?SI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SI», ap (Const.«SenseImpairmentFn») ([«?S»])]), ap (Const.«experiencer») ([«?SI», «?A»])]) (mkExists (fun («?A2» : Obj) => mkAnd [mkNot (ap (Const.«equal») ([«?A2», «?A»])), ap (Const.«capability») ([«?S», Const.«experiencer», «?A2»]), mkNot (ap (Const.«capability») ([«?S», Const.«experiencer», «?A»]))])))
axiom ax_2341 : Holds (ap (Const.«instance») ([Const.«SenseInabilityFn», Const.«UnaryFunction»]))
axiom ax_2342 : ∀ («?A» : Obj) («?S» : Obj) («?SI» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SI», ap (Const.«SenseImpairmentFn») ([«?S»])]), ap (Const.«experiencer») ([«?SI», «?A»])]) (mkNot (ap (Const.«capability») ([«?S», Const.«experiencer», «?A»]))))
axiom ax_2343 : Holds (ap (Const.«subclass») ([Const.«Seeing», Const.«Perception»]))
axiom ax_2344 : ∀ («?AGENT» : Obj) («?OBJ» : Obj) («?SEE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SEE», Const.«Seeing»]), ap (Const.«agent») ([«?SEE», «?AGENT»]), ap (Const.«patient») ([«?SEE», «?OBJ»])]) (mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«instance») ([«?PROP», Const.«ColorAttribute»]), ap (Const.«knows») ([«?AGENT», ap (Const.«attribute») ([«?OBJ», «?PROP»])])])))
axiom ax_2345 : ∀ («?OBJ» : Obj) («?SEE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SEE», Const.«Seeing»]), ap (Const.«patient») ([«?SEE», «?OBJ»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?SEE»]), ap (Const.«attribute») ([«?OBJ», Const.«Illuminated»])])))
axiom ax_2346 : ∀ («?OBJ» : Obj) («?SEE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SEE», Const.«Seeing»]), ap (Const.«patient») ([«?SEE», «?OBJ»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«ColorAttribute»]), ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?SEE»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])])))
axiom ax_2347 : Holds (ap (Const.«subclass») ([Const.«Looking», Const.«Seeing»]))
axiom ax_2348 : Holds (ap (Const.«subclass») ([Const.«Looking», Const.«IntentionalProcess»]))
axiom ax_2349 : Holds (ap (Const.«subclass») ([Const.«Smelling», Const.«Perception»]))
axiom ax_2350 : ∀ («?OBJ» : Obj) («?SMELL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SMELL», Const.«Smelling»]), ap (Const.«patient») ([«?SMELL», «?OBJ»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«OlfactoryAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])))
axiom ax_2351 : Holds (ap (Const.«subclass») ([Const.«Tasting», Const.«Perception»]))
axiom ax_2352 : ∀ («?OBJ» : Obj) («?TASTE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TASTE», Const.«Tasting»]), ap (Const.«patient») ([«?TASTE», «?OBJ»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«TasteAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])))
axiom ax_2353 : Holds (ap (Const.«subclass») ([Const.«Hearing», Const.«Perception»]))
axiom ax_2354 : ∀ («?HEAR» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?HEAR», Const.«Hearing»]), ap (Const.«patient») ([«?HEAR», «?OBJ»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«SoundAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])))
axiom ax_2355 : Holds (ap (Const.«subclass») ([Const.«SoundAttribute», Const.«PerceptualAttribute»]))
axiom ax_2356 : Holds (ap (Const.«instance») ([Const.«Audible», Const.«SoundAttribute»]))
axiom ax_2357 : Holds (ap (Const.«instance») ([Const.«Inaudible», Const.«SoundAttribute»]))
axiom ax_2358 : Holds (ap (Const.«contraryAttribute») ([Const.«Audible», Const.«Inaudible»]))
axiom ax_2359 : ∀ («?OBJ» : Obj) («?SOUND» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SOUND», Const.«RadiatingSound»]), ap (Const.«agent») ([«?SOUND», «?OBJ»]), ap (Const.«attribute») ([«?SOUND», Const.«Audible»])]) (mkExists (fun («?HUMAN» : Obj) => mkExists (fun («?HEAR» : Obj) => mkAnd [ap (Const.«instance») ([«?HUMAN», Const.«Human»]), ap (Const.«capability») ([ap (Const.«KappaFn») ([«?HEAR», mkAnd [ap (Const.«instance») ([«?HEAR», Const.«Hearing»]), ap (Const.«agent») ([«?HEAR», «?HUMAN»]), ap (Const.«destination») ([«?HEAR», «?HUMAN»]), ap (Const.«origin») ([«?HEAR», «?OBJ»])]]), Const.«agent», «?HUMAN»])]))))
axiom ax_2360 : Holds (ap (Const.«subclass») ([Const.«Listening», Const.«Hearing»]))
axiom ax_2361 : Holds (ap (Const.«subclass») ([Const.«Listening», Const.«IntentionalProcess»]))
axiom ax_2362 : Holds (ap (Const.«subclass») ([Const.«TactilePerception», Const.«Perception»]))
axiom ax_2363 : ∀ («?TACTILE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TACTILE», Const.«TactilePerception»])) (mkExists (fun («?TOUCH» : Obj) => mkAnd [ap (Const.«instance») ([«?TOUCH», Const.«Touching»]), ap (Const.«subProcess») ([«?TOUCH», «?TACTILE»])])))
axiom ax_2364 : Holds (ap (Const.«subclass») ([Const.«Radiating», Const.«Motion»]))
axiom ax_2365 : Holds (ap (Const.«subclass») ([Const.«RadiatingLight», Const.«RadiatingElectromagnetic»]))
axiom ax_2366 : ∀ («?EMIT» : Obj) («?REGION» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EMIT», Const.«RadiatingLight»]), ap (Const.«patient») ([«?EMIT», «?REGION»]), ap (Const.«instance») ([«?REGION», Const.«Region»])]) (ap (Const.«attribute») ([«?REGION», Const.«Illuminated»])))
axiom ax_2367 : ∀ («?REGION» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?REGION», Const.«Illuminated»])) (mkExists (fun («?EMIT» : Obj) => mkAnd [ap (Const.«instance») ([«?EMIT», Const.«RadiatingLight»]), ap (Const.«patient») ([«?EMIT», «?REGION»]), ap (Const.«instance») ([«?REGION», Const.«Region»])])))
axiom ax_2368 : Holds (ap (Const.«subclass») ([Const.«RadiatingInfrared», Const.«RadiatingElectromagnetic»]))
axiom ax_2369 : Holds (ap (Const.«subclass») ([Const.«RadiatingXRay», Const.«RadiatingElectromagnetic»]))
axiom ax_2370 : Holds (ap (Const.«subclass») ([Const.«RadiatingSound», Const.«Radiating»]))
axiom ax_2371 : ∀ («?EMIT» : Obj) («?SOUND» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EMIT», Const.«RadiatingSound»]), ap (Const.«agent») ([«?EMIT», «?SOUND»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«SoundAttribute»]), ap (Const.«attribute») ([«?SOUND», «?ATTR»])])))
axiom ax_2372 : Holds (ap (Const.«subclass») ([Const.«MakingMusic», Const.«RadiatingSound»]))
axiom ax_2373 : Holds (ap (Const.«comment») ([Const.«MakingMusic», strLit "Changing the old Music to &%MakingMusic to be more consistent with\nthe verb-form that &%Process seem to take. (09-14-2011)", strLit "KJN"]))
axiom ax_2374 : Holds (ap (Const.«partition») ([Const.«MakingMusic», Const.«MakingInstrumentalMusic», Const.«MakingVocalMusic»]))
axiom ax_2375 : Holds (ap (Const.«subclass») ([Const.«MakingInstrumentalMusic», Const.«MakingMusic»]))
axiom ax_2376 : ∀ («?M» : Obj), Holds (mkImp (ap (Const.«instance») ([«?M», Const.«MakingInstrumentalMusic»])) (mkExists (fun («?I» : Obj) => mkAnd [ap (Const.«instance») ([«?I», Const.«MusicalInstrument»]), ap (Const.«instrument») ([«?M», «?I»])])))
axiom ax_2377 : Holds (ap (Const.«subclass») ([Const.«Vocalizing», Const.«RadiatingSound»]))
axiom ax_2378 : Holds (ap (Const.«subclass») ([Const.«Vocalizing», Const.«OrganismProcess»]))
axiom ax_2379 : Holds (ap (Const.«subclass») ([Const.«MakingVocalMusic», Const.«MakingMusic»]))
axiom ax_2380 : Holds (ap (Const.«subclass») ([Const.«MakingVocalMusic», Const.«Vocalizing»]))
axiom ax_2381 : Holds (ap (Const.«comment») ([Const.«MakingVocalMusic», strLit "Currently, &%VocalMusic also inherits from &%Speaking.\nChanging this to more general &%Vocalizing.  Acapella groups today use their &%VocalCord\nto create music in ways that are more than just speaking. (09-14-2011)", strLit "KJN"]))
axiom ax_2382 : Holds (ap (Const.«subclass») ([Const.«Singing», Const.«MakingVocalMusic»]))
axiom ax_2383 : ∀ («?S» : Obj), Holds (mkImp (ap (Const.«instance») ([«?S», Const.«Singing»])) (mkExists (fun («?W» : Obj) => mkAnd [ap (Const.«patient») ([«?S», «?W»]), ap (Const.«instance») ([«?W», Const.«Word»])])))
axiom ax_2384 : Holds (ap (Const.«subclass») ([Const.«RadiatingElectromagnetic», Const.«Radiating»]))
axiom ax_2385 : Holds (ap (Const.«subclass») ([Const.«RadiatingNuclear», Const.«Radiating»]))
axiom ax_2386 : Holds (ap (Const.«subclass») ([Const.«StateChange», Const.«InternalChange»]))
axiom ax_2387 : ∀ («?OBJ» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PROCESS», Const.«StateChange»]), ap (Const.«patient») ([«?PROCESS», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkExists (fun («?STATE1» : Obj) => mkExists (fun («?STATE2» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«instance») ([«?STATE1», Const.«PhysicalState»]), ap (Const.«instance») ([«?STATE2», Const.«PhysicalState»]), mkNot (ap (Const.«equal») ([«?STATE1», «?STATE2»])), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PROCESS»])]), ap (Const.«attribute») ([«?PART», «?STATE1»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?PROCESS»])]), ap (Const.«attribute») ([«?PART», «?STATE2»])])])))))
axiom ax_2388 : Holds (ap (Const.«instance») ([Const.«atomicNumber», Const.«BinaryPredicate»]))
axiom ax_2389 : Holds (ap (Const.«instance») ([Const.«atomicNumber», Const.«PartialValuedRelation»]))
axiom ax_2390 : ∀ («?ATOM» : Obj) («?NUMBER» : Obj) («?PROTON» : Obj) («?SUBSTANCE» : Obj) («?TYPE» : Obj), Holds (mkImp (ap (Const.«atomicNumber») ([«?TYPE», «?NUMBER»])) (mkImp (mkAnd [ap (Const.«instance») ([«?SUBSTANCE», «?TYPE»]), ap (Const.«part») ([«?ATOM», «?SUBSTANCE»]), ap (Const.«instance») ([«?ATOM», Const.«Atom»])]) (ap (Const.«equal») ([«?NUMBER», ap (Const.«CardinalityFn») ([ap (Const.«KappaFn») ([«?PROTON», mkAnd [ap (Const.«part») ([«?PROTON», «?ATOM»]), ap (Const.«instance») ([«?PROTON», Const.«Proton»])]])])]))))
axiom ax_2391 : Holds (ap (Const.«instance») ([Const.«boilingPoint», Const.«BinaryPredicate»]))
axiom ax_2392 : ∀ («?BOIL» : Obj) («?PRES» : Obj) («?TEMP» : Obj) («?X» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?X», «?Y»]), ap (Const.«subclass») ([«?Y», Const.«PureSubstance»]), ap (Const.«barometricPressure») ([«?X», ap (Const.«MeasureFn») ([«?PRES», Const.«InchMercury»])]), ap (Const.«greaterThan») ([numLit "29.92", «?PRES»]), ap (Const.«boilingPoint») ([«?Y», ap (Const.«MeasureFn») ([«?BOIL», Const.«KelvinDegree»])]), ap (Const.«measure») ([«?X», ap (Const.«MeasureFn») ([«?TEMP», Const.«KelvinDegree»])]), ap (Const.«greaterThan») ([«?TEMP», «?BOIL»])]) (ap (Const.«attribute») ([«?X», Const.«Gas»])))
axiom ax_2393 : ∀ («?BOIL» : Obj) («?MELT» : Obj) («?TEMP» : Obj) («?X» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?X», «?Y»]), ap (Const.«subclass») ([«?Y», Const.«PureSubstance»]), ap (Const.«boilingPoint») ([«?Y», ap (Const.«MeasureFn») ([«?BOIL», Const.«KelvinDegree»])]), ap (Const.«meltingPoint») ([«?Y», ap (Const.«MeasureFn») ([«?MELT», Const.«KelvinDegree»])]), ap (Const.«measure») ([«?X», ap (Const.«MeasureFn») ([«?TEMP», Const.«KelvinDegree»])]), ap (Const.«greaterThan») ([«?TEMP», «?MELT»]), ap (Const.«lessThan») ([«?TEMP», «?BOIL»])]) (ap (Const.«attribute») ([«?X», Const.«Liquid»])))
axiom ax_2394 : ∀ («?MELT» : Obj) («?PRES» : Obj) («?TEMP» : Obj) («?X» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?X», «?Y»]), ap (Const.«subclass») ([«?Y», Const.«PureSubstance»]), ap (Const.«meltingPoint») ([«?Y», ap (Const.«MeasureFn») ([«?MELT», Const.«KelvinDegree»])]), ap (Const.«barometricPressure») ([«?X», ap (Const.«MeasureFn») ([«?PRES», Const.«InchMercury»])]), ap (Const.«greaterThan») ([«?PRES», numLit "29.92"]), ap (Const.«measure») ([«?X», ap (Const.«MeasureFn») ([«?TEMP», Const.«KelvinDegree»])]), ap (Const.«lessThan») ([«?TEMP», «?MELT»])]) (ap (Const.«attribute») ([«?X», Const.«Solid»])))
axiom ax_2395 : ∀ («?BOILING» : Obj) («?MEASURE» : Obj) («?SUBSTANCE» : Obj) («?TEMP1» : Obj) («?TEMP2» : Obj) («?TYPE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BOILING», Const.«Boiling»]), ap (Const.«boilingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?TEMP1», «?MEASURE»])]), ap (Const.«instance») ([«?SUBSTANCE», «?TYPE»]), ap (Const.«patient») ([«?BOILING», «?SUBSTANCE»]), ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?BOILING»]), ap (Const.«measure») ([«?SUBSTANCE», ap (Const.«MeasureFn») ([«?TEMP2», «?MEASURE»])])]), ap (Const.«instance») ([«?MEASURE», Const.«UnitOfTemperature»])]) (ap (Const.«greaterThanOrEqualTo») ([«?TEMP2», «?TEMP1»])))
axiom ax_2396 : ∀ («?MEASURE» : Obj) («?SUBSTANCE» : Obj) («?TEMP1» : Obj) («?TEMP2» : Obj) («?TIME» : Obj) («?TYPE» : Obj), Holds (mkImp (mkAnd [ap (Const.«boilingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?TEMP1», «?MEASURE»])]), ap (Const.«instance») ([«?SUBSTANCE», «?TYPE»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«measure») ([«?SUBSTANCE», ap (Const.«MeasureFn») ([«?TEMP2», «?MEASURE»])])]), ap (Const.«instance») ([«?MEASURE», Const.«UnitOfTemperature»]), ap (Const.«greaterThanOrEqualTo») ([«?TEMP2», «?TEMP1»])]) (mkOr [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?SUBSTANCE», Const.«Gas»])]), mkExists (fun («?BOIL» : Obj) => mkAnd [ap (Const.«overlapsTemporally») ([ap (Const.«WhenFn») ([«?BOIL»]), «?TIME»]), ap (Const.«instance») ([«?BOIL», Const.«Boiling»]), ap (Const.«patient») ([«?BOIL», «?SUBSTANCE»])])]))
axiom ax_2397 : Holds (ap (Const.«instance») ([Const.«meltingPoint», Const.«BinaryPredicate»]))
axiom ax_2398 : ∀ («?MEASURE» : Obj) («?SUBSTANCE» : Obj) («?TEMP1» : Obj) («?TEMP2» : Obj) («?TEMP3» : Obj) («?TIME» : Obj) («?TYPE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SUBSTANCE», «?TYPE»]), ap (Const.«boilingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?TEMP1», «?MEASURE»])]), ap (Const.«meltingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?TEMP2», «?MEASURE»])]), ap (Const.«instance») ([«?MEASURE», Const.«UnitOfTemperature»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«measure») ([«?SUBSTANCE», ap (Const.«MeasureFn») ([«?TEMP3», «?MEASURE»])])]), ap (Const.«greaterThan») ([«?TEMP3», «?TEMP2»]), ap (Const.«lessThan») ([«?TEMP3», «?TEMP1»])]) (mkOr [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?SUBSTANCE», Const.«Liquid»])]), mkExists (fun («?MELT» : Obj) => mkAnd [ap (Const.«overlapsTemporally») ([ap (Const.«WhenFn») ([«?MELT»]), «?TIME»]), ap (Const.«instance») ([«?MELT», Const.«Melting»]), ap (Const.«patient») ([«?MELT», «?SUBSTANCE»])])]))
axiom ax_2399 : ∀ («?MEASURE» : Obj) («?SUBSTANCE» : Obj) («?TEMP1» : Obj) («?TEMP2» : Obj) («?TIME» : Obj) («?TYPE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SUBSTANCE», «?TYPE»]), ap (Const.«meltingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?TEMP1», «?MEASURE»])]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«measure») ([«?SUBSTANCE», ap (Const.«MeasureFn») ([«?TEMP2», «?MEASURE»])])]), ap (Const.«instance») ([«?MEASURE», Const.«UnitOfTemperature»]), ap (Const.«lessThan») ([«?TEMP2», «?TEMP1»])]) (mkOr [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?SUBSTANCE», Const.«Solid»])]), mkExists (fun («?FREEZE» : Obj) => mkAnd [ap (Const.«overlapsTemporally») ([ap (Const.«WhenFn») ([«?FREEZE»]), «?TIME»]), ap (Const.«instance») ([«?FREEZE», Const.«Freezing»]), ap (Const.«patient») ([«?FREEZE», «?SUBSTANCE»])])]))
axiom ax_2400 : ∀ («?BOIL» : Obj) («?MELT» : Obj) («?TYPE» : Obj) («?U» : Obj), Holds (mkImp (mkAnd [ap (Const.«meltingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?MELT», «?U»])]), ap (Const.«boilingPoint») ([«?TYPE», ap (Const.«MeasureFn») ([«?BOIL», «?U»])])]) (ap (Const.«greaterThanOrEqualTo») ([«?BOIL», «?MELT»])))
axiom ax_2401 : Holds (ap (Const.«subclass») ([Const.«Melting», Const.«StateChange»]))
axiom ax_2402 : ∀ («?MELT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MELT», Const.«Melting»])) (mkExists (fun («?HEAT» : Obj) => mkAnd [ap (Const.«instance») ([«?HEAT», Const.«Heating»]), ap (Const.«subProcess») ([«?HEAT», «?MELT»])])))
axiom ax_2403 : ∀ («?MELT» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?MELT», Const.«Melting»]), ap (Const.«patient») ([«?MELT», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?MELT»])]), ap (Const.«attribute») ([«?PART», Const.«Solid»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?MELT»])]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])])])))
axiom ax_2404 : Holds (ap (Const.«subclass») ([Const.«Boiling», Const.«StateChange»]))
axiom ax_2405 : ∀ («?BOIL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BOIL», Const.«Boiling»])) (mkExists (fun («?HEAT» : Obj) => mkAnd [ap (Const.«instance») ([«?HEAT», Const.«Heating»]), ap (Const.«subProcess») ([«?HEAT», «?BOIL»])])))
axiom ax_2406 : ∀ («?BOIL» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BOIL», Const.«Boiling»]), ap (Const.«patient») ([«?BOIL», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?BOIL»])]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?BOIL»])]), ap (Const.«attribute») ([«?PART», Const.«Gas»])])])))
axiom ax_2407 : ∀ («?L» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?L», Const.«Liquid»])) (ap (Const.«capability») ([Const.«Boiling», Const.«patient», «?L»])))
axiom ax_2408 : Holds (ap (Const.«subclass») ([Const.«Evaporating», Const.«StateChange»]))
axiom ax_2409 : ∀ («?BOILVAL» : Obj) («?CLASS» : Obj) («?EVAP» : Obj) («?MEAS» : Obj) («?OBJ» : Obj) («?VAL» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EVAP», Const.«Evaporating»]), ap (Const.«boilingPoint») ([«?CLASS», ap (Const.«MeasureFn») ([«?BOILVAL», «?MEAS»])]), ap (Const.«instance») ([«?OBJ», «?CLASS»]), ap (Const.«measure») ([«?OBJ», ap (Const.«MeasureFn») ([«?VAL», «?MEAS»])]), ap (Const.«instance») ([«?MEAS», Const.«UnitOfTemperature»]), ap (Const.«patient») ([«?EVAP», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«greaterThan») ([«?BOILVAL», «?VAL»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?EVAP»])]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?EVAP»])]), ap (Const.«attribute») ([«?PART», Const.«Gas»])])])))
axiom ax_2410 : Holds (ap (Const.«subclass») ([Const.«Condensing», Const.«StateChange»]))
axiom ax_2411 : ∀ («?COND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COND», Const.«Condensing»])) (mkExists (fun («?COOL» : Obj) => mkAnd [ap (Const.«instance») ([«?COOL», Const.«Cooling»]), ap (Const.«subProcess») ([«?COOL», «?COND»])])))
axiom ax_2412 : ∀ («?COND» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?COND», Const.«Condensing»]), ap (Const.«patient») ([«?COND», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?COND»])]), ap (Const.«attribute») ([«?PART», Const.«Gas»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?COND»])]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])])])))
axiom ax_2413 : Holds (ap (Const.«subclass») ([Const.«Freezing», Const.«StateChange»]))
axiom ax_2414 : ∀ («?FREEZE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FREEZE», Const.«Freezing»])) (mkExists (fun («?COOL» : Obj) => mkAnd [ap (Const.«instance») ([«?COOL», Const.«Cooling»]), ap (Const.«subProcess») ([«?COOL», «?FREEZE»])])))
axiom ax_2415 : ∀ («?FREEZE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FREEZE», Const.«Freezing»]), ap (Const.«patient») ([«?FREEZE», «?OBJ»])]) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?FREEZE»])]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])]), ap (Const.«holdsDuring») ([ap (Const.«EndFn») ([ap (Const.«WhenFn») ([«?FREEZE»])]), ap (Const.«attribute») ([«?PART», Const.«Solid»])])])))
axiom ax_2416 : Holds (ap (Const.«subclass») ([Const.«AstronomicalBody», Const.«Object»]))
axiom ax_2417 : Holds (ap (Const.«disjoint») ([Const.«AstronomicalBody», Const.«GeographicArea»]))
axiom ax_2418 : Holds (ap (Const.«subclass») ([Const.«GeographicArea», Const.«Region»]))
axiom ax_2419 : Holds (ap (Const.«partition») ([Const.«GeographicArea», Const.«WaterArea», Const.«LandArea»]))
axiom ax_2420 : Holds (ap (Const.«subclass») ([Const.«LocalizablePlace», Const.«GeographicArea»]))
axiom ax_2421 : Holds (ap (Const.«instance») ([Const.«geographicSubregion», Const.«BinaryPredicate»]))
axiom ax_2422 : Holds (ap (Const.«instance») ([Const.«geographicSubregion», Const.«TransitiveRelation»]))
axiom ax_2423 : Holds (ap (Const.«instance») ([Const.«geographicSubregion», Const.«AsymmetricRelation»]))
axiom ax_2424 : Holds (ap (Const.«subrelation») ([Const.«geographicSubregion», Const.«properPart»]))
axiom ax_2425 : Holds (ap (Const.«subrelation») ([Const.«geographicSubregion», Const.«located»]))
axiom ax_2426 : Holds (ap (Const.«subclass») ([Const.«GeopoliticalArea», Const.«GeographicArea»]))
axiom ax_2427 : Holds (ap (Const.«subclass») ([Const.«GeopoliticalArea», Const.«AutonomousAgent»]))
axiom ax_2428 : ∀ («?AREA» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?AREA», Const.«GeopoliticalArea»]), ap (Const.«leader») ([ap (Const.«GovernmentFn») ([«?AREA»]), «?PERSON»])]) (ap (Const.«leader») ([«?AREA», «?PERSON»])))
axiom ax_2429 : ∀ («?AREA» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?AREA», Const.«GeopoliticalArea»]), ap (Const.«leader») ([«?AREA», «?PERSON»])]) (ap (Const.«leader») ([ap (Const.«GovernmentFn») ([«?AREA»]), «?PERSON»])))
axiom ax_2430 : ∀ («?AGENT» : Obj) («?EVENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Election»]), ap (Const.«agent») ([«?EVENT», «?AGENT»]), ap (Const.«instance») ([«?AGENT», Const.«GeopoliticalArea»])]) (ap (Const.«instance») ([«?EVENT», Const.«PoliticalProcess»])))
axiom ax_2431 : ∀ («?AGENT» : Obj) («?AREA» : Obj) («?EVENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?EVENT», Const.«Election»]), ap (Const.«agent») ([«?EVENT», «?AGENT»]), ap (Const.«instance») ([«?AREA», Const.«GeopoliticalArea»]), ap (Const.«instance») ([«?AGENT», ap (Const.«GovernmentFn») ([«?AREA»])])]) (ap (Const.«instance») ([«?EVENT», Const.«PoliticalProcess»])))
axiom ax_2432 : Holds (ap (Const.«instance») ([Const.«geopoliticalSubdivision», Const.«AsymmetricRelation»]))
axiom ax_2433 : Holds (ap (Const.«instance») ([Const.«geopoliticalSubdivision», Const.«TransitiveRelation»]))
axiom ax_2434 : Holds (ap (Const.«subrelation») ([Const.«geopoliticalSubdivision», Const.«geographicSubregion»]))
axiom ax_2435 : Holds (ap (Const.«subclass») ([Const.«WaterArea», Const.«GeographicArea»]))
axiom ax_2436 : ∀ («?AREA» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AREA», Const.«WaterArea»])) (mkExists (fun («?BED» : Obj) => mkExists (fun («?HOLE» : Obj) => mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«HoleHostFn») ([«?HOLE»]), «?BED»]), ap (Const.«instance») ([«?WATER», Const.«Water»]), ap (Const.«properlyFills») ([«?WATER», «?HOLE»]), ap (Const.«equal») ([ap (Const.«MereologicalSumFn») ([«?BED», «?WATER»]), «?AREA»])])))))
axiom ax_2437 : Holds (ap (Const.«subclass») ([Const.«SaltWaterArea», Const.«WaterArea»]))
axiom ax_2438 : Holds (ap (Const.«disjoint») ([Const.«SaltWaterArea», Const.«FreshWaterArea»]))
axiom ax_2439 : Holds (ap (Const.«subclass») ([Const.«FreshWaterArea», Const.«WaterArea»]))
axiom ax_2440 : Holds (ap (Const.«subclass») ([Const.«LandArea», Const.«GeographicArea»]))
axiom ax_2441 : ∀ («?LAND1» : Obj), Holds (mkImp (ap (Const.«instance») ([«?LAND1», Const.«LandArea»])) (mkExists (fun («?LAND2» : Obj) => mkAnd [ap (Const.«part») ([«?LAND1», «?LAND2»]), mkOr [ap (Const.«instance») ([«?LAND2», Const.«Continent»]), ap (Const.«instance») ([«?LAND2», Const.«Island»])]])))
axiom ax_2442 : Holds (ap (Const.«subclass») ([Const.«ShoreArea», Const.«LandArea»]))
axiom ax_2443 : ∀ («?BANK» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BANK», Const.«ShoreArea»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«instance») ([«?WATER», Const.«WaterArea»]), ap (Const.«meetsSpatially») ([«?BANK», «?WATER»])])))
axiom ax_2444 : Holds (ap (Const.«subclass») ([Const.«Continent», Const.«LandArea»]))
axiom ax_2445 : Holds (ap (Const.«equal») ([ap (Const.«CardinalityFn») ([Const.«Continent»]), numLit "7"]))
axiom ax_2446 : Holds (ap (Const.«subclass») ([Const.«Island», Const.«LandArea»]))
axiom ax_2447 : ∀ («?ISLAND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ISLAND», Const.«Island»])) (mkNot (mkExists (fun («?AREA» : Obj) => mkExists (fun («?PART1» : Obj) => mkExists (fun («?PART2» : Obj) => mkAnd [ap (Const.«instance») ([«?AREA», Const.«LandArea»]), ap (Const.«part») ([«?PART1», «?ISLAND»]), ap (Const.«part») ([«?PART2», «?AREA»]), mkNot (ap (Const.«part») ([«?ISLAND», «?AREA»])), mkNot (ap (Const.«part») ([«?AREA», «?ISLAND»])), ap (Const.«meetsSpatially») ([«?PART1», «?PART2»])]))))))
axiom ax_2448 : ∀ («?AREA» : Obj) («?ISLE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ISLE», Const.«Island»]), ap (Const.«instance») ([«?AREA», Const.«GeographicArea»]), ap (Const.«meetsSpatially») ([«?ISLE», «?AREA»])]) (mkNot (ap (Const.«instance») ([«?AREA», Const.«LandArea»]))))
axiom ax_2449 : ∀ («?ISLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ISLE», Const.«Island»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«instance») ([«?WATER», Const.«WaterArea»]), ap (Const.«meetsSpatially») ([«?ISLE», «?WATER»])])))
axiom ax_2450 : Holds (ap (Const.«subclass») ([Const.«Nation», Const.«GeopoliticalArea»]))
axiom ax_2451 : Holds (ap (Const.«subclass») ([Const.«Nation», Const.«LandArea»]))
axiom ax_2452 : Holds (ap (Const.«subclass») ([Const.«StateOrProvince», Const.«GeopoliticalArea»]))
axiom ax_2453 : Holds (ap (Const.«subclass») ([Const.«StateOrProvince», Const.«LandArea»]))
axiom ax_2454 : ∀ («?STATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STATE», Const.«StateOrProvince»])) (mkExists (fun («?LAND» : Obj) => mkAnd [ap (Const.«instance») ([«?LAND», Const.«Nation»]), ap (Const.«properPart») ([«?STATE», «?LAND»])])))
axiom ax_2455 : Holds (ap (Const.«subclass») ([Const.«City», Const.«GeopoliticalArea»]))
axiom ax_2456 : Holds (ap (Const.«subclass») ([Const.«City», Const.«LandArea»]))
axiom ax_2457 : Holds (ap (Const.«subclass») ([Const.«County», Const.«GeopoliticalArea»]))
axiom ax_2458 : Holds (ap (Const.«subclass») ([Const.«County», Const.«LandArea»]))
axiom ax_2459 : ∀ («?STATE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STATE», Const.«County»])) (mkExists (fun («?LAND» : Obj) => mkAnd [ap (Const.«instance») ([«?LAND», Const.«StateOrProvince»]), ap (Const.«properPart») ([«?STATE», «?LAND»])])))
axiom ax_2460 : Holds (ap (Const.«subclass») ([Const.«Transitway», Const.«Region»]))
axiom ax_2461 : Holds (ap (Const.«subclass») ([Const.«Transitway», Const.«SelfConnectedObject»]))
axiom ax_2462 : ∀ («?WAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WAY», Const.«Transitway»])) (ap (Const.«hasPurpose») ([«?WAY», mkExists (fun («?TRANSPORT» : Obj) => mkAnd [ap (Const.«instance») ([«?TRANSPORT», Const.«Translocation»]), ap (Const.«path») ([«?TRANSPORT», «?WAY»])])])))
axiom ax_2463 : Holds (ap (Const.«subclass») ([Const.«LandTransitway», Const.«Transitway»]))
axiom ax_2464 : Holds (ap (Const.«subclass») ([Const.«LandTransitway», Const.«LandArea»]))
axiom ax_2465 : ∀ («?WAY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WAY», Const.«LandTransitway»])) (ap (Const.«hasPurpose») ([«?WAY», mkExists (fun («?MOVE» : Obj) => mkExists (fun («?LAND» : Obj) => mkAnd [ap (Const.«instance») ([«?MOVE», Const.«Translocation»]), ap (Const.«path») ([«?MOVE», «?WAY»]), ap (Const.«eventLocated») ([«?MOVE», «?LAND»]), ap (Const.«instance») ([«?LAND», Const.«LandArea»])]))])))
axiom ax_2466 : Holds (ap (Const.«subclass») ([Const.«Roadway», Const.«LandTransitway»]))
axiom ax_2467 : Holds (ap (Const.«subclass») ([Const.«Water», Const.«CompoundSubstance»]))
axiom ax_2468 : Holds (ap (Const.«subclass») ([Const.«Mineral», Const.«Substance»]))
axiom ax_2469 : Holds (ap (Const.«instance») ([Const.«developmentalForm», Const.«BinaryPredicate»]))
axiom ax_2470 : Holds (ap (Const.«instance») ([Const.«developmentalForm», Const.«AsymmetricRelation»]))
axiom ax_2471 : Holds (ap (Const.«instance») ([Const.«developmentalForm», Const.«TransitiveRelation»]))
axiom ax_2472 : Holds (ap (Const.«subrelation») ([Const.«developmentalForm», Const.«attribute»]))
axiom ax_2473 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj) («?OBJ» : Obj) («?TIME1» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME1», ap (Const.«developmentalForm») ([«?OBJ», «?ATTR1»])]), ap (Const.«successorAttributeClosure») ([«?ATTR2», «?ATTR1»])]) (mkExists (fun («?TIME2» : Obj) => mkAnd [ap (Const.«earlier») ([«?TIME2», «?TIME1»]), ap (Const.«holdsDuring») ([«?TIME2», ap (Const.«developmentalForm») ([«?OBJ», «?ATTR2»])])])))
axiom ax_2474 : Holds (ap (Const.«subclass») ([Const.«OrganicObject», Const.«CorpuscularObject»]))
axiom ax_2475 : Holds (ap (Const.«subclass») ([Const.«OrganicObject», Const.«OrganicThing»]))
axiom ax_2476 : Holds (ap (Const.«partition») ([Const.«OrganicObject», Const.«Organism», Const.«AnatomicalStructure»]))
axiom ax_2477 : Holds (ap (Const.«subclass») ([Const.«Organism», Const.«OrganicObject»]))
axiom ax_2478 : Holds (ap (Const.«subclass») ([Const.«Organism», Const.«AutonomousAgent»]))
axiom ax_2479 : Holds (ap (Const.«disjoint») ([Const.«Organism», Const.«Artifact»]))
axiom ax_2480 : Holds (ap (Const.«partition») ([Const.«Organism», Const.«Animal», Const.«Plant», Const.«Fungus», Const.«Microorganism»]))
axiom ax_2481 : ∀ («?ORGANISM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORGANISM», Const.«Organism»])) (mkExists (fun («?BIRTH» : Obj) => mkAnd [ap (Const.«instance») ([«?BIRTH», Const.«Birth»]), ap (Const.«experiencer») ([«?BIRTH», «?ORGANISM»])])))
axiom ax_2482 : Holds (ap (Const.«instance») ([Const.«inhabits», Const.«BinaryPredicate»]))
axiom ax_2483 : Holds (ap (Const.«instance») ([Const.«inhabits», Const.«AsymmetricRelation»]))
axiom ax_2484 : ∀ («?OBJ» : Obj) («?ORGANISM» : Obj) («?T1» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?T1», ap (Const.«inhabits») ([«?ORGANISM», «?OBJ»])])) (mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?TIME», Const.«TimeInterval»]), ap (Const.«temporalPart») ([«?TIME», «?T1»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«located») ([«?ORGANISM», «?OBJ»])])])))
axiom ax_2485 : Holds (ap (Const.«subrelation») ([Const.«home», Const.«inhabits»]))
axiom ax_2486 : Holds (ap (Const.«instance») ([Const.«home», Const.«BinaryPredicate»]))
axiom ax_2487 : Holds (ap (Const.«subrelation») ([Const.«stays», Const.«inhabits»]))
axiom ax_2488 : Holds (ap (Const.«instance») ([Const.«stays», Const.«BinaryPredicate»]))
axiom ax_2489 : Holds (ap (Const.«disjointRelation») ([Const.«stays», Const.«home»]))
axiom ax_2490 : Holds (ap (Const.«subclass») ([Const.«Plant», Const.«Organism»]))
axiom ax_2491 : Holds (ap (Const.«subclass») ([Const.«FloweringPlant», Const.«Plant»]))
axiom ax_2492 : Holds (ap (Const.«subclass») ([Const.«NonFloweringPlant», Const.«Plant»]))
axiom ax_2493 : Holds (ap (Const.«disjoint») ([Const.«NonFloweringPlant», Const.«FloweringPlant»]))
axiom ax_2494 : Holds (ap (Const.«disjointDecomposition») ([Const.«NonFloweringPlant», Const.«Alga», Const.«Fern», Const.«Moss»]))
axiom ax_2495 : Holds (ap (Const.«subclass») ([Const.«Alga», Const.«NonFloweringPlant»]))
axiom ax_2496 : ∀ («?ALGA» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ALGA», Const.«Alga»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«inhabits») ([«?ALGA», «?WATER»]), ap (Const.«instance») ([«?WATER», Const.«Water»])])))
axiom ax_2497 : Holds (ap (Const.«subclass») ([Const.«Fungus», Const.«Organism»]))
axiom ax_2498 : ∀ («?FUNGUS» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?FUNGUS», Const.«Fungus»]), ap (Const.«inhabits») ([«?FUNGUS», «?OBJ»])]) (ap (Const.«instance») ([«?OBJ», Const.«Organism»])))
axiom ax_2499 : Holds (ap (Const.«subclass») ([Const.«Moss», Const.«NonFloweringPlant»]))
axiom ax_2500 : Holds (ap (Const.«subclass») ([Const.«Fern», Const.«NonFloweringPlant»]))
axiom ax_2501 : Holds (ap (Const.«subclass») ([Const.«Animal», Const.«Organism»]))
axiom ax_2502 : Holds (ap (Const.«partition») ([Const.«Animal», Const.«Vertebrate», Const.«Invertebrate»]))
axiom ax_2503 : Holds (ap (Const.«subclass») ([Const.«Microorganism», Const.«Organism»]))
axiom ax_2504 : Holds (ap (Const.«subclass») ([Const.«Bacterium», Const.«Microorganism»]))
axiom ax_2505 : ∀ («?BACTERIUM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BACTERIUM», Const.«Bacterium»])) (mkExists (fun («?CELL1» : Obj) => mkAnd [ap (Const.«component») ([«?CELL1», «?BACTERIUM»]), ap (Const.«instance») ([«?CELL1», Const.«Cell»]), mkForall (fun («?CELL2» : Obj) => mkImp (mkAnd [ap (Const.«component») ([«?CELL2», «?BACTERIUM»]), ap (Const.«instance») ([«?CELL2», Const.«Cell»])]) (ap (Const.«equal») ([«?CELL1», «?CELL2»])))])))
axiom ax_2506 : ∀ («?BACTERIUM» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BACTERIUM», Const.«Bacterium»]), ap (Const.«inhabits») ([«?BACTERIUM», «?OBJ»])]) (ap (Const.«instance») ([«?OBJ», Const.«Organism»])))
axiom ax_2507 : Holds (ap (Const.«subclass») ([Const.«Virus», Const.«Microorganism»]))
axiom ax_2508 : ∀ («?OBJ» : Obj) («?VIRUS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?VIRUS», Const.«Virus»]), ap (Const.«inhabits») ([«?VIRUS», «?OBJ»])]) (ap (Const.«instance») ([«?OBJ», Const.«Organism»])))
axiom ax_2509 : ∀ («?PROC» : Obj) («?VIRUS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?VIRUS», Const.«Virus»]), ap (Const.«instance») ([«?PROC», Const.«Replication»]), ap (Const.«agent») ([«?PROC», «?VIRUS»])]) (mkExists (fun («?CELL» : Obj) => mkAnd [ap (Const.«located») ([«?PROC», «?CELL»]), ap (Const.«instance») ([«?CELL», Const.«Cell»])])))
axiom ax_2510 : Holds (ap (Const.«subclass») ([Const.«Vertebrate», Const.«Animal»]))
axiom ax_2511 : Holds (ap (Const.«subclass») ([Const.«Invertebrate», Const.«Animal»]))
axiom ax_2512 : Holds (ap (Const.«disjointDecomposition») ([Const.«Invertebrate», Const.«Worm», Const.«Mollusk», Const.«Arthropod»]))
axiom ax_2513 : Holds (ap (Const.«subclass») ([Const.«Worm», Const.«Invertebrate»]))
axiom ax_2514 : Holds (ap (Const.«subclass») ([Const.«Leech», Const.«Worm»]))
axiom ax_2515 : Holds (ap (Const.«subclass») ([Const.«Mollusk», Const.«Invertebrate»]))
axiom ax_2516 : Holds (ap (Const.«subclass») ([Const.«Arthropod», Const.«Invertebrate»]))
axiom ax_2517 : Holds (ap (Const.«disjointDecomposition») ([Const.«Arthropod», Const.«Arachnid», Const.«Myriapod», Const.«Insect», Const.«Crustacean»]))
axiom ax_2518 : Holds (ap (Const.«subclass») ([Const.«Arachnid», Const.«Arthropod»]))
axiom ax_2519 : Holds (ap (Const.«subclass») ([Const.«Myriapod», Const.«Arthropod»]))
axiom ax_2520 : Holds (ap (Const.«subclass») ([Const.«Insect», Const.«Arthropod»]))
axiom ax_2521 : Holds (ap (Const.«subclass») ([Const.«Crustacean», Const.«Arthropod»]))
axiom ax_2522 : Holds (ap (Const.«subclass») ([Const.«ColdBloodedVertebrate», Const.«Vertebrate»]))
axiom ax_2523 : Holds (ap (Const.«disjointDecomposition») ([Const.«ColdBloodedVertebrate», Const.«Amphibian», Const.«Fish», Const.«Reptile»]))
axiom ax_2524 : Holds (ap (Const.«subclass») ([Const.«WarmBloodedVertebrate», Const.«Vertebrate»]))
axiom ax_2525 : Holds (ap (Const.«disjoint») ([Const.«WarmBloodedVertebrate», Const.«ColdBloodedVertebrate»]))
axiom ax_2526 : Holds (ap (Const.«subclass») ([Const.«Amphibian», Const.«ColdBloodedVertebrate»]))
axiom ax_2527 : Holds (ap (Const.«subclass») ([Const.«Bird», Const.«WarmBloodedVertebrate»]))
axiom ax_2528 : Holds (ap (Const.«disjoint») ([Const.«Bird», Const.«Mammal»]))
axiom ax_2529 : Holds (ap (Const.«subclass») ([Const.«Fish», Const.«ColdBloodedVertebrate»]))
axiom ax_2530 : ∀ («?FISH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FISH», Const.«Fish»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«inhabits») ([«?FISH», «?WATER»]), ap (Const.«instance») ([«?WATER», Const.«Water»])])))
axiom ax_2531 : Holds (ap (Const.«subclass») ([Const.«Mammal», Const.«WarmBloodedVertebrate»]))
axiom ax_2532 : Holds (ap (Const.«disjointDecomposition») ([Const.«Mammal», Const.«AquaticMammal», Const.«HoofedMammal», Const.«Marsupial», Const.«Rodent», Const.«Primate»]))
axiom ax_2533 : Holds (ap (Const.«subclass») ([Const.«AquaticMammal», Const.«Mammal»]))
axiom ax_2534 : Holds (ap (Const.«subclass») ([Const.«HoofedMammal», Const.«Mammal»]))
axiom ax_2535 : Holds (ap (Const.«subclass») ([Const.«Marsupial», Const.«Mammal»]))
axiom ax_2536 : Holds (ap (Const.«subclass») ([Const.«Carnivore», Const.«Organism»]))
axiom ax_2537 : ∀ («?CARNIVORE» : Obj) («?EAT» : Obj) («?PREY» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?CARNIVORE», Const.«Carnivore»]), ap (Const.«instance») ([«?EAT», Const.«Eating»]), ap (Const.«agent») ([«?EAT», «?CARNIVORE»]), ap (Const.«patient») ([«?EAT», «?PREY»])]) (ap (Const.«instance») ([«?PREY», Const.«Animal»])))
axiom ax_2538 : Holds (ap (Const.«subclass») ([Const.«Canine», Const.«Carnivore»]))
axiom ax_2539 : Holds (ap (Const.«disjoint») ([Const.«Canine», Const.«Feline»]))
axiom ax_2540 : Holds (ap (Const.«subclass») ([Const.«Feline», Const.«Carnivore»]))
axiom ax_2541 : Holds (ap (Const.«subclass») ([Const.«Rodent», Const.«Mammal»]))
axiom ax_2542 : Holds (ap (Const.«subclass») ([Const.«Primate», Const.«Mammal»]))
axiom ax_2543 : Holds (ap (Const.«disjointDecomposition») ([Const.«Primate», Const.«Ape», Const.«Monkey», Const.«Hominid»]))
axiom ax_2544 : Holds (ap (Const.«subclass») ([Const.«Ape», Const.«Primate»]))
axiom ax_2545 : Holds (ap (Const.«subclass») ([Const.«Monkey», Const.«Primate»]))
axiom ax_2546 : Holds (ap (Const.«subclass») ([Const.«Hominid», Const.«Primate»]))
axiom ax_2547 : Holds (ap (Const.«subclass») ([Const.«Human», Const.«Hominid»]))
axiom ax_2548 : Holds (ap (Const.«subclass») ([Const.«Human», Const.«CognitiveAgent»]))
axiom ax_2549 : Holds (ap (Const.«partition») ([Const.«Human», Const.«Man», Const.«Woman»]))
axiom ax_2550 : Holds (ap (Const.«subclass») ([Const.«Man», Const.«Human»]))
axiom ax_2551 : ∀ («?MAN» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MAN», Const.«Man»])) (ap (Const.«attribute») ([«?MAN», Const.«Male»])))
axiom ax_2552 : Holds (ap (Const.«subclass») ([Const.«Woman», Const.«Human»]))
axiom ax_2553 : ∀ («?WOMAN» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WOMAN», Const.«Woman»])) (ap (Const.«attribute») ([«?WOMAN», Const.«Female»])))
axiom ax_2554 : Holds (ap (Const.«subclass») ([Const.«Reptile», Const.«ColdBloodedVertebrate»]))
axiom ax_2555 : Holds (ap (Const.«subclass») ([Const.«BiologicallyActiveSubstance», Const.«Substance»]))
axiom ax_2556 : Holds (ap (Const.«subclass») ([Const.«Nutrient», Const.«BiologicallyActiveSubstance»]))
axiom ax_2557 : Holds (ap (Const.«disjointDecomposition») ([Const.«Nutrient», Const.«Protein», Const.«Carbohydrate», Const.«Vitamin»]))
axiom ax_2558 : Holds (ap (Const.«relatedInternalConcept») ([Const.«Nutrient», Const.«Food»]))
axiom ax_2559 : Holds (ap (Const.«subclass») ([Const.«Protein», Const.«Nutrient»]))
axiom ax_2560 : Holds (ap (Const.«subclass») ([Const.«Enzyme», Const.«Protein»]))
axiom ax_2561 : Holds (ap (Const.«subclass») ([Const.«Carbohydrate», Const.«Nutrient»]))
axiom ax_2562 : Holds (ap (Const.«subclass») ([Const.«Carbohydrate», Const.«CompoundSubstance»]))
axiom ax_2563 : Holds (ap (Const.«subclass») ([Const.«Vitamin», Const.«Nutrient»]))
axiom ax_2564 : Holds (ap (Const.«subclass») ([Const.«LiquidMixture», Const.«Mixture»]))
axiom ax_2565 : Holds (ap (Const.«partition») ([Const.«LiquidMixture», Const.«Solution», Const.«Suspension»]))
axiom ax_2566 : ∀ («?MIX» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MIX», Const.«LiquidMixture»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?MIX»]), ap (Const.«attribute») ([«?PART», Const.«Liquid»])])))
axiom ax_2567 : Holds (ap (Const.«subclass») ([Const.«Solution», Const.«LiquidMixture»]))
axiom ax_2568 : Holds (ap (Const.«subclass») ([Const.«Suspension», Const.«LiquidMixture»]))
axiom ax_2569 : Holds (ap (Const.«subclass») ([Const.«Suspension», Const.«GasMixture»]))
axiom ax_2570 : Holds (ap (Const.«subclass») ([Const.«GasMixture», Const.«Mixture»]))
axiom ax_2571 : Holds (ap (Const.«disjoint») ([Const.«GasMixture», Const.«LiquidMixture»]))
axiom ax_2572 : ∀ («?MIX» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MIX», Const.«GasMixture»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?MIX»]), ap (Const.«attribute») ([«?PART», Const.«Gas»])])))
axiom ax_2573 : Holds (ap (Const.«subclass») ([Const.«Cloud», Const.«GasMixture»]))
axiom ax_2574 : ∀ («?CLOUD» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLOUD», Const.«Cloud»])) (ap (Const.«capability») ([Const.«Seeing», Const.«patient», «?CLOUD»])))
axiom ax_2575 : Holds (ap (Const.«subclass») ([Const.«Smoke», Const.«Cloud»]))
axiom ax_2576 : ∀ («?SMOKE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SMOKE», Const.«Smoke»])) (mkExists (fun («?BURNING» : Obj) => mkAnd [ap (Const.«instance») ([«?BURNING», Const.«Combustion»]), ap (Const.«result») ([«?BURNING», «?SMOKE»])])))
axiom ax_2577 : Holds (ap (Const.«subclass») ([Const.«WaterCloud», Const.«Cloud»]))
axiom ax_2578 : ∀ («?CLOUD» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLOUD», Const.«WaterCloud»])) (mkExists (fun («?WATER» : Obj) => mkAnd [ap (Const.«instance») ([«?WATER», Const.«Water»]), ap (Const.«part») ([«?WATER», «?CLOUD»])])))
axiom ax_2579 : ∀ («?CLOUD» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLOUD», Const.«WaterCloud»])) (mkForall (fun («?PART» : Obj) => mkImp (mkAnd [ap (Const.«part») ([«?PART», «?CLOUD»]), mkNot (ap (Const.«instance») ([«?PART», Const.«Water»]))]) (mkExists (fun («?WATER» : Obj) => mkExists (fun («?MEASURE1» : Obj) => mkExists (fun («?MEASURE2» : Obj) => mkExists (fun («?U» : Obj) => mkAnd [ap (Const.«instance») ([«?WATER», Const.«Water»]), ap (Const.«part») ([«?WATER», «?CLOUD»]), ap (Const.«measure») ([«?WATER», ap (Const.«MeasureFn») ([«?MEASURE1», «?U»])]), ap (Const.«measure») ([«?PART», ap (Const.«MeasureFn») ([«?MEASURE2», «?U»])]), ap (Const.«greaterThan») ([«?MEASURE1», «?MEASURE2»])]))))))))
axiom ax_2580 : Holds (ap (Const.«subclass») ([Const.«Air», Const.«GasMixture»]))
axiom ax_2581 : ∀ («?WIND» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WIND», Const.«Wind»])) (mkExists (fun («?AIR» : Obj) => mkAnd [ap (Const.«patient») ([«?WIND», «?AIR»]), ap (Const.«instance») ([«?AIR», Const.«Air»])])))
axiom ax_2582 : Holds (ap (Const.«subclass») ([Const.«BodySubstance», Const.«Substance»]))
axiom ax_2583 : Holds (ap (Const.«subclass») ([Const.«AnimalSubstance», Const.«BodySubstance»]))
axiom ax_2584 : ∀ («?ANIMAL» : Obj) («?SUBSTANCE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SUBSTANCE», Const.«AnimalSubstance»]), ap (Const.«instance») ([«?ANIMAL», Const.«Organism»]), ap (Const.«part») ([«?SUBSTANCE», «?ANIMAL»])]) (ap (Const.«instance») ([«?ANIMAL», Const.«Animal»])))
axiom ax_2585 : Holds (ap (Const.«subclass») ([Const.«PlantSubstance», Const.«BodySubstance»]))
axiom ax_2586 : ∀ («?PLANT» : Obj) («?SUBSTANCE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?SUBSTANCE», Const.«PlantSubstance»]), ap (Const.«instance») ([«?PLANT», Const.«Organism»]), ap (Const.«part») ([«?SUBSTANCE», «?PLANT»])]) (ap (Const.«instance») ([«?PLANT», Const.«Plant»])))
axiom ax_2587 : Holds (ap (Const.«subclass») ([Const.«Hormone», Const.«BodySubstance»]))
axiom ax_2588 : Holds (ap (Const.«subclass») ([Const.«Hormone», Const.«BiologicallyActiveSubstance»]))
axiom ax_2589 : ∀ («?HORMONE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?HORMONE», Const.«Hormone»])) (mkExists (fun («?PROCESS» : Obj) => mkExists (fun («?GLAND» : Obj) => mkAnd [ap (Const.«instance») ([«?GLAND», Const.«Gland»]), ap (Const.«instrument») ([«?PROCESS», «?GLAND»]), ap (Const.«result») ([«?PROCESS», «?HORMONE»])]))))
axiom ax_2590 : Holds (ap (Const.«subclass») ([Const.«Blood», Const.«BodySubstance»]))
axiom ax_2591 : Holds (ap (Const.«instance») ([Const.«FoodForFn», Const.«UnaryFunction»]))
axiom ax_2592 : ∀ («?A» : Obj) («?FOOD» : Obj), Holds (mkImp (ap (Const.«instance») ([«?FOOD», ap (Const.«FoodForFn») ([«?A»])])) (mkExists (fun («?NUTRIENT» : Obj) => mkAnd [ap (Const.«instance») ([«?NUTRIENT», Const.«Nutrient»]), ap (Const.«part») ([«?NUTRIENT», «?FOOD»])])))
axiom ax_2593 : Holds (ap (Const.«equal») ([Const.«Food», ap (Const.«FoodForFn») ([Const.«Human»])]))
axiom ax_2594 : Holds (ap (Const.«subclass») ([Const.«Food», Const.«SelfConnectedObject»]))
axiom ax_2595 : Holds (ap (Const.«subclass») ([Const.«Meat», Const.«AnimalSubstance»]))
axiom ax_2596 : ∀ («?MEAT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MEAT», Const.«Meat»])) (mkForall (fun («?PART» : Obj) => mkImp (ap (Const.«part») ([«?PART», «?MEAT»])) (mkExists (fun («?SUBPART» : Obj) => mkExists (fun («?TIME» : Obj) => mkExists (fun («?ANIMAL» : Obj) => mkAnd [ap (Const.«part») ([«?SUBPART», «?PART»]), ap (Const.«holdsDuring») ([«?TIME», mkAnd [ap (Const.«instance») ([«?ANIMAL», Const.«Animal»]), ap (Const.«part») ([«?SUBPART», «?ANIMAL»])]])])))))))
axiom ax_2597 : Holds (ap (Const.«subclass») ([Const.«AnatomicalStructure», Const.«OrganicObject»]))
axiom ax_2598 : Holds (ap (Const.«partition») ([Const.«AnatomicalStructure», Const.«BodyPart», Const.«AbnormalAnatomicalStructure»]))
axiom ax_2599 : Holds (ap (Const.«partition») ([Const.«AnatomicalStructure», Const.«AnimalAnatomicalStructure», Const.«PlantAnatomicalStructure»]))
axiom ax_2600 : ∀ («?ANAT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ANAT», Const.«AnatomicalStructure»])) (mkExists (fun («?ORGANISM» : Obj) => mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«temporalPart») ([«?TIME», ap (Const.«WhenFn») ([«?ORGANISM»])]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«part») ([«?ANAT», «?ORGANISM»])])]))))
axiom ax_2601 : ∀ («?PART» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PART», Const.«AnatomicalStructure»])) (mkExists (fun («?CELL» : Obj) => mkAnd [ap (Const.«instance») ([«?CELL», Const.«Cell»]), ap (Const.«part») ([«?CELL», «?PART»])])))
axiom ax_2602 : Holds (ap (Const.«subclass») ([Const.«AbnormalAnatomicalStructure», Const.«AnatomicalStructure»]))
axiom ax_2603 : ∀ («?STRUCTURE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STRUCTURE», Const.«AbnormalAnatomicalStructure»])) (mkExists (fun («?PROC» : Obj) => mkAnd [ap (Const.«instance») ([«?PROC», Const.«PathologicProcess»]), ap (Const.«result») ([«?PROC», «?STRUCTURE»])])))
axiom ax_2604 : Holds (ap (Const.«subclass») ([Const.«BodyPart», Const.«AnatomicalStructure»]))
axiom ax_2605 : ∀ («?PART» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PART», Const.«BodyPart»])) (mkExists (fun («?ORGANISM» : Obj) => mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«temporalPart») ([«?TIME», ap (Const.«WhenFn») ([«?ORGANISM»])]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«component») ([«?PART», «?ORGANISM»])])]))))
axiom ax_2606 : ∀ («?PART» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PART», Const.«BodyPart»])) (mkExists (fun («?PROC» : Obj) => mkAnd [ap (Const.«instance») ([«?PROC», Const.«PhysiologicProcess»]), ap (Const.«result») ([«?PROC», «?PART»])])))
axiom ax_2607 : Holds (ap (Const.«instance») ([Const.«BodySideFn», Const.«BinaryFunction»]))
axiom ax_2608 : ∀ («?A» : Obj) («?BPC» : Obj) («?P» : Obj) («?S» : Obj) («?SO» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?A», Const.«Animal»]), ap (Const.«instance») ([«?P», ap (Const.«BodySideFn») ([«?S», «?BPC»])]), ap (Const.«contraryAttribute») ([«?S», «?SO»]), ap (Const.«attribute») ([«?A», Const.«Healthy»])]) (mkExists (fun («?PO» : Obj) => mkAnd [ap (Const.«instance») ([«?PO», ap (Const.«BodySideFn») ([«?SO», «?BPC»])]), ap (Const.«orientation») ([«?P», «?PO», «?S»])])))
axiom ax_2609 : ∀ («?P» : Obj) («?S» : Obj) («?X» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», ap (Const.«BodySideFn») ([«?S», «?P»])])) (ap (Const.«instance») ([«?X», «?P»])))
axiom ax_2610 : Holds (ap (Const.«subclass») ([Const.«AnimalAnatomicalStructure», Const.«AnatomicalStructure»]))
axiom ax_2611 : ∀ («?ANIMAL» : Obj) («?STRUCTURE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?STRUCTURE», Const.«AnimalAnatomicalStructure»]), ap (Const.«instance») ([«?ANIMAL», Const.«Organism»]), ap (Const.«part») ([«?STRUCTURE», «?ANIMAL»])]) (ap (Const.«instance») ([«?ANIMAL», Const.«Animal»])))
axiom ax_2612 : Holds (ap (Const.«subclass») ([Const.«PlantAnatomicalStructure», Const.«AnatomicalStructure»]))
axiom ax_2613 : ∀ («?PLANT» : Obj) («?STRUCTURE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?STRUCTURE», Const.«PlantAnatomicalStructure»]), ap (Const.«instance») ([«?PLANT», Const.«Organism»]), ap (Const.«part») ([«?STRUCTURE», «?PLANT»])]) (ap (Const.«instance») ([«?PLANT», Const.«Plant»])))
axiom ax_2614 : Holds (ap (Const.«subclass») ([Const.«ReproductiveBody», Const.«BodyPart»]))
axiom ax_2615 : Holds (ap (Const.«subclass») ([Const.«Egg», Const.«ReproductiveBody»]))
axiom ax_2616 : Holds (ap (Const.«subclass») ([Const.«Egg», Const.«AnimalAnatomicalStructure»]))
axiom ax_2617 : Holds (ap (Const.«subclass») ([Const.«Egg», Const.«Meat»]))
axiom ax_2618 : Holds (ap (Const.«subclass») ([Const.«Seed», Const.«ReproductiveBody»]))
axiom ax_2619 : Holds (ap (Const.«subclass») ([Const.«Seed», Const.«PlantAnatomicalStructure»]))
axiom ax_2620 : ∀ («?SEED» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SEED», Const.«Seed»])) (mkExists (fun («?PLANT» : Obj) => mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?PLANT», Const.«FloweringPlant»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«part») ([«?SEED», «?PLANT»])])]))))
axiom ax_2621 : Holds (ap (Const.«subclass») ([Const.«Pollen», Const.«ReproductiveBody»]))
axiom ax_2622 : Holds (ap (Const.«subclass») ([Const.«Pollen», Const.«PlantAnatomicalStructure»]))
axiom ax_2623 : Holds (ap (Const.«subclass») ([Const.«FruitOrVegetable», Const.«PlantAnatomicalStructure»]))
axiom ax_2624 : Holds (ap (Const.«subclass») ([Const.«FruitOrVegetable», Const.«ReproductiveBody»]))
axiom ax_2625 : Holds (ap (Const.«subclass») ([Const.«Spore», Const.«ReproductiveBody»]))
axiom ax_2626 : Holds (ap (Const.«subclass») ([Const.«Spore», Const.«PlantAnatomicalStructure»]))
axiom ax_2627 : ∀ («?SPORE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SPORE», Const.«Spore»])) (mkExists (fun («?PLANT» : Obj) => mkExists (fun («?TIME» : Obj) => mkAnd [ap (Const.«instance») ([«?PLANT», Const.«NonFloweringPlant»]), ap (Const.«holdsDuring») ([«?TIME», ap (Const.«part») ([«?SPORE», «?PLANT»])])]))))
axiom ax_2628 : Holds (ap (Const.«subclass») ([Const.«BodyCovering», Const.«BodyPart»]))
axiom ax_2629 : ∀ («?COVER» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COVER», Const.«BodyCovering»])) (mkExists (fun («?BODY» : Obj) => mkAnd [ap (Const.«superficialPart») ([«?COVER», «?BODY»]), mkOr [ap (Const.«instance») ([«?BODY», Const.«Organism»]), ap (Const.«instance») ([«?BODY», Const.«BodyPart»])]])))
axiom ax_2630 : Holds (ap (Const.«subclass») ([Const.«BodyJunction», Const.«BodyPart»]))
axiom ax_2631 : ∀ («?JUNCT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?JUNCT», Const.«BodyJunction»])) (mkExists (fun («?OBJ1» : Obj) => mkExists (fun («?OBJ2» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJ1», Const.«BodyPart»]), ap (Const.«instance») ([«?OBJ2», Const.«BodyPart»]), ap (Const.«connects») ([«?JUNCT», «?OBJ1», «?OBJ2»])]))))
axiom ax_2632 : Holds (ap (Const.«subclass») ([Const.«BodyCavity», Const.«BodyPart»]))
axiom ax_2633 : Holds (ap (Const.«subclass») ([Const.«BodyVessel», Const.«BodyCavity»]))
axiom ax_2634 : Holds (ap (Const.«subclass») ([Const.«Cell», Const.«BodyPart»]))
axiom ax_2635 : Holds (ap (Const.«subclass») ([Const.«Organ», Const.«BodyPart»]))
axiom ax_2636 : ∀ («?ORGAN» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORGAN», Const.«Organ»])) (mkExists (fun («?PURP» : Obj) => ap (Const.«hasPurpose») ([«?ORGAN», «?PURP»]))))
axiom ax_2637 : Holds (ap (Const.«subclass») ([Const.«Gland», Const.«Organ»]))
axiom ax_2638 : Holds (ap (Const.«subclass») ([Const.«Tissue», Const.«BodySubstance»]))
axiom ax_2639 : Holds (ap (Const.«disjointDecomposition») ([Const.«Tissue», Const.«ConnectiveTissue», Const.«MuscleTissue», Const.«NervousTissue», Const.«EpithelialTissue»]))
axiom ax_2640 : ∀ («?STUFF» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STUFF», Const.«Tissue»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«instance») ([«?PART», Const.«Cell»]), ap (Const.«part») ([«?PART», «?STUFF»])])))
axiom ax_2641 : ∀ («?STUFF» : Obj), Holds (mkImp (ap (Const.«instance») ([«?STUFF», Const.«Tissue»])) (mkExists (fun («?ORGANISM» : Obj) => mkAnd [ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«part») ([«?STUFF», «?ORGANISM»])])))
axiom ax_2642 : Holds (ap (Const.«subclass») ([Const.«ConnectiveTissue», Const.«Tissue»]))
axiom ax_2643 : Holds (ap (Const.«externalImage») ([Const.«ConnectiveTissue», strLit "https://en.wikipedia.org/wiki/Connective_tissue#/media/File:Hist.Technik_(2).jpg"]))
axiom ax_2644 : ∀ («?H» : Obj) («?T1» : Obj) («?T1C» : Obj) («?T2» : Obj) («?T2C» : Obj), Holds (mkImp (mkAnd [ap (Const.«subclass») ([«?T1C», Const.«Tissue»]), ap (Const.«subclass») ([«?T2C», Const.«Tissue»]), ap (Const.«instance») ([«?T1», «?T1C»]), ap (Const.«instance») ([«?T2», «?T2C»]), ap (Const.«instance») ([«?H», Const.«Human»]), ap (Const.«part») ([«?T1», «?H»]), ap (Const.«part») ([«?T2», «?H»]), mkNot (ap (Const.«equal») ([«?T1C», «?T2C»])), mkNot (ap (Const.«subclass») ([«?T1C», «?T2C»])), mkNot (ap (Const.«subclass») ([«?T2C», «?T1C»])), ap (Const.«orientation») ([«?T1», «?T2», Const.«Adjacent»])]) (ap (Const.«modalAttribute») ([mkExists (fun («?CT» : Obj) => mkAnd [ap (Const.«instance») ([«?CT», Const.«ConnectiveTissue»]), ap (Const.«between») ([«?T1», «?CT», «?T2»])]), Const.«Likely»])))
axiom ax_2645 : Holds (ap (Const.«subclass») ([Const.«BoneTissue», Const.«ConnectiveTissue»]))
axiom ax_2646 : Holds (ap (Const.«subclass») ([Const.«BoneTissue», Const.«AnimalSubstance»]))
axiom ax_2647 : ∀ («?BONE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BONE», Const.«BoneTissue»])) (mkExists (fun («?VERT» : Obj) => mkAnd [ap (Const.«instance») ([«?VERT», Const.«Vertebrate»]), ap (Const.«part») ([«?BONE», «?VERT»])])))
axiom ax_2648 : Holds (ap (Const.«subclass») ([Const.«Bone», Const.«BodyPart»]))
axiom ax_2649 : ∀ («?B» : Obj), Holds (mkImp (ap (Const.«instance») ([«?B», Const.«Bone»])) (ap (Const.«material») ([Const.«BoneTissue», «?B»])))
axiom ax_2650 : Holds (ap (Const.«subclass») ([Const.«EpithelialTissue», Const.«Tissue»]))
axiom ax_2651 : ∀ («?G» : Obj), Holds (mkImp (ap (Const.«instance») ([«?G», Const.«Gland»])) (ap (Const.«material») ([Const.«EpithelialTissue», «?G»])))
axiom ax_2652 : Holds (ap (Const.«subclass») ([Const.«MuscleTissue», Const.«Tissue»]))
axiom ax_2653 : Holds (ap (Const.«subclass») ([Const.«MuscleTissue», Const.«AnimalSubstance»]))
axiom ax_2654 : Holds (ap (Const.«subclass») ([Const.«Muscle», Const.«BodyPart»]))
axiom ax_2655 : ∀ («?M» : Obj), Holds (mkImp (ap (Const.«instance») ([«?M», Const.«Muscle»])) (ap (Const.«material») ([Const.«MuscleTissue», Const.«Muscle»])))
axiom ax_2656 : Holds (ap (Const.«subclass») ([Const.«FatTissue», Const.«ConnectiveTissue»]))
axiom ax_2657 : Holds (ap (Const.«subclass») ([Const.«NervousTissue», Const.«Tissue»]))
axiom ax_2658 : ∀ («?NC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?NC», Const.«NerveCell»])) (ap (Const.«material») ([Const.«NervousTissue», «?NC»])))
axiom ax_2659 : Holds (ap (Const.«subclass») ([Const.«Noun», Const.«Word»]))
axiom ax_2660 : Holds (ap (Const.«partition») ([Const.«Word», Const.«Noun», Const.«Verb», Const.«Adjective», Const.«Adverb», Const.«ParticleWord»]))
axiom ax_2661 : Holds (ap (Const.«subclass») ([Const.«Verb», Const.«Word»]))
axiom ax_2662 : Holds (ap (Const.«subclass») ([Const.«Adjective», Const.«Word»]))
axiom ax_2663 : Holds (ap (Const.«subclass») ([Const.«Adverb», Const.«Word»]))
axiom ax_2664 : Holds (ap (Const.«subclass») ([Const.«ParticleWord», Const.«Word»]))
axiom ax_2665 : Holds (ap (Const.«subclass») ([Const.«Morpheme», Const.«LinguisticExpression»]))
axiom ax_2666 : ∀ («?MORPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MORPH», Const.«Morpheme»])) (mkNot (mkExists (fun («?OTHERMORPH» : Obj) => mkAnd [ap (Const.«instance») ([«?OTHERMORPH», Const.«Morpheme»]), ap (Const.«part») ([«?OTHERMORPH», «?MORPH»]), mkNot (ap (Const.«equal») ([«?OTHERMORPH», «?MORPH»]))]))))
axiom ax_2667 : ∀ («?MORPH» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MORPH», Const.«Morpheme»])) (mkExists (fun («?WORD» : Obj) => mkAnd [ap (Const.«instance») ([«?WORD», Const.«Word»]), ap (Const.«part») ([«?MORPH», «?WORD»])])))
axiom ax_2668 : ∀ («?WORD» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WORD», Const.«Word»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?WORD»]), ap (Const.«instance») ([«?PART», Const.«Morpheme»])])))
axiom ax_2669 : Holds (ap (Const.«subclass») ([Const.«Phrase», Const.«LinguisticExpression»]))
axiom ax_2670 : Holds (ap (Const.«disjointDecomposition») ([Const.«Phrase», Const.«VerbPhrase», Const.«NounPhrase», Const.«PrepositionalPhrase»]))
axiom ax_2671 : ∀ («?PHRASE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PHRASE», Const.«Phrase»])) (mkExists (fun («?PART1» : Obj) => mkExists (fun («?PART2» : Obj) => mkAnd [ap (Const.«part») ([«?PART1», «?PHRASE»]), ap (Const.«part») ([«?PART2», «?PHRASE»]), ap (Const.«instance») ([«?PART1», Const.«Word»]), ap (Const.«instance») ([«?PART2», Const.«Word»]), mkNot (ap (Const.«equal») ([«?PART1», «?PART2»]))]))))
axiom ax_2672 : Holds (ap (Const.«subclass») ([Const.«VerbPhrase», Const.«Phrase»]))
axiom ax_2673 : ∀ («?PHRASE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PHRASE», Const.«VerbPhrase»])) (mkExists (fun («?VERB» : Obj) => mkAnd [ap (Const.«instance») ([«?VERB», Const.«Verb»]), ap (Const.«part») ([«?VERB», «?PHRASE»])])))
axiom ax_2674 : Holds (ap (Const.«subclass») ([Const.«NounPhrase», Const.«Phrase»]))
axiom ax_2675 : Holds (ap (Const.«disjoint») ([Const.«NounPhrase», Const.«VerbPhrase»]))
axiom ax_2676 : ∀ («?SENTENCE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SENTENCE», Const.«Sentence»])) (mkExists (fun («?PHRASE1» : Obj) => mkExists (fun («?PHRASE2» : Obj) => mkAnd [ap (Const.«instance») ([«?PHRASE1», Const.«NounPhrase»]), ap (Const.«instance») ([«?PHRASE2», Const.«VerbPhrase»]), ap (Const.«part») ([«?PHRASE1», «?SENTENCE»]), ap (Const.«part») ([«?PHRASE2», «?SENTENCE»])]))))
axiom ax_2677 : ∀ («?PHRASE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PHRASE», Const.«NounPhrase»])) (mkExists (fun («?NOUN» : Obj) => mkAnd [ap (Const.«instance») ([«?NOUN», Const.«Noun»]), ap (Const.«part») ([«?NOUN», «?PHRASE»])])))
axiom ax_2678 : Holds (ap (Const.«subclass») ([Const.«PrepositionalPhrase», Const.«Phrase»]))
axiom ax_2679 : ∀ («?PHRASE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PHRASE», Const.«PrepositionalPhrase»])) (mkExists (fun («?PREP» : Obj) => mkAnd [ap (Const.«instance») ([«?PREP», Const.«ParticleWord»]), ap (Const.«part») ([«?PREP», «?PHRASE»])])))
axiom ax_2680 : Holds (ap (Const.«subclass») ([Const.«Text», Const.«LinguisticExpression»]))
axiom ax_2681 : Holds (ap (Const.«subclass») ([Const.«Text», Const.«ContentBearingObject»]))
axiom ax_2682 : Holds (ap (Const.«subclass») ([Const.«Text», Const.«Artifact»]))
axiom ax_2683 : ∀ («?TEXT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TEXT», Const.«Text»])) (mkExists (fun («?PART» : Obj) => mkAnd [ap (Const.«part») ([«?PART», «?TEXT»]), ap (Const.«instance») ([«?PART», Const.«LinguisticExpression»])])))
axiom ax_2684 : ∀ («?TEXT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TEXT», Const.«Text»])) (mkExists (fun («?WRITE» : Obj) => mkAnd [ap (Const.«instance») ([«?WRITE», Const.«Writing»]), ap (Const.«result») ([«?WRITE», «?TEXT»])])))
axiom ax_2685 : Holds (ap (Const.«subclass») ([Const.«FactualText», Const.«Text»]))
axiom ax_2686 : Holds (ap (Const.«disjoint») ([Const.«FactualText», Const.«FictionalText»]))
axiom ax_2687 : ∀ («?AGENT» : Obj) («?CLASS» : Obj) («?CONTENT» : Obj) («?TEXT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TEXT», «?CLASS»]), ap (Const.«subclass») ([«?CLASS», Const.«FactualText»]), ap (Const.«authors») ([«?AGENT», «?CLASS»]), ap (Const.«subsumesContentInstance») ([«?TEXT», «?CONTENT»]), ap (Const.«instance») ([«?CONTENT», Const.«Formula»])]) (ap (Const.«believes») ([«?AGENT», «?CONTENT»])))
axiom ax_2688 : Holds (ap (Const.«subclass») ([Const.«FictionalText», Const.«Text»]))
axiom ax_2689 : ∀ («?AGENT» : Obj) («?CLASS» : Obj) («?TEXT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TEXT», «?CLASS»]), ap (Const.«subclass») ([«?CLASS», Const.«FictionalText»]), ap (Const.«authors») ([«?AGENT», «?CLASS»])]) (mkExists (fun («?CONTENT» : Obj) => mkAnd [ap (Const.«subsumesContentInstance») ([«?TEXT», «?CONTENT»]), ap (Const.«instance») ([«?CONTENT», Const.«Formula»]), mkNot (ap (Const.«believes») ([«?AGENT», «?CONTENT»]))])))
axiom ax_2690 : Holds (ap (Const.«subclass») ([Const.«Sentence», Const.«LinguisticExpression»]))
axiom ax_2691 : ∀ («?SENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?SENT», Const.«Sentence»])) (mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«instance») ([«?PROP», Const.«Proposition»]), ap (Const.«containsInformation») ([«?SENT», «?PROP»])])))
axiom ax_2692 : Holds (ap (Const.«instance») ([Const.«authors», Const.«BinaryPredicate»]))
axiom ax_2693 : ∀ («?AGENT» : Obj) («?TEXTCLASS» : Obj), Holds (mkImp (ap (Const.«authors») ([«?AGENT», «?TEXTCLASS»])) (mkExists (fun («?PROCESS» : Obj) => mkExists (fun («?INSTANCE» : Obj) => mkAnd [ap (Const.«agent») ([«?PROCESS», «?AGENT»]), ap (Const.«instance») ([«?INSTANCE», «?TEXTCLASS»]), ap (Const.«result») ([«?PROCESS», «?INSTANCE»])]))))
axiom ax_2694 : Holds (ap (Const.«instance») ([Const.«editor», Const.«BinaryPredicate»]))
axiom ax_2695 : Holds (ap (Const.«instance») ([Const.«publishes», Const.«BinaryPredicate»]))
axiom ax_2696 : ∀ («?INST» : Obj) («?ORG» : Obj) («?TEXTCLASS» : Obj), Holds (mkImp (mkAnd [ap (Const.«publishes») ([«?ORG», «?TEXTCLASS»]), ap (Const.«instance») ([«?INST», «?TEXTCLASS»])]) (mkExists (fun («?PUB» : Obj) => mkAnd [ap (Const.«instance») ([«?PUB», Const.«Publication»]), ap (Const.«agent») ([«?PUB», «?ORG»]), ap (Const.«patient») ([«?PUB», «?INST»])])))
axiom ax_2697 : Holds (ap (Const.«instance») ([Const.«EditionFn», Const.«BinaryFunction»]))
axiom ax_2698 : Holds (ap (Const.«instance») ([Const.«EditionFn», Const.«PartialValuedRelation»]))
axiom ax_2699 : ∀ («?CBO1» : Obj) («?CBO2» : Obj) («?DATE1» : Obj) («?DATE2» : Obj) («?EDITION1» : Obj) («?EDITION2» : Obj) («?INT1» : Obj) («?INT2» : Obj) («?PUB1» : Obj) («?PUB2» : Obj) («?TEXT» : Obj), Holds (mkImp (mkAnd [ap (Const.«equal») ([ap (Const.«EditionFn») ([«?TEXT», «?INT1»]), «?EDITION1»]), ap (Const.«equal») ([ap (Const.«EditionFn») ([«?TEXT», «?INT2»]), «?EDITION2»]), ap (Const.«greaterThan») ([«?INT2», «?INT1»]), ap (Const.«instance») ([«?PUB1», Const.«Publication»]), ap (Const.«instance») ([«?PUB2», Const.«Publication»]), ap (Const.«instance») ([«?CBO1», «?EDITION1»]), ap (Const.«instance») ([«?CBO2», «?EDITION2»]), ap (Const.«patient») ([«?PUB1», «?CBO1»]), ap (Const.«patient») ([«?PUB2», «?CBO2»]), ap (Const.«date») ([«?PUB1», «?DATE1»]), ap (Const.«date») ([«?PUB2», «?DATE2»])]) (ap (Const.«before») ([ap (Const.«EndFn») ([«?DATE1»]), ap (Const.«EndFn») ([«?DATE2»])])))
axiom ax_2700 : ∀ («?NUMBER» : Obj) («?TEXT1» : Obj) («?TEXT2» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«EditionFn») ([«?TEXT1», «?NUMBER»]), «?TEXT2»])) (ap (Const.«subsumesContentClass») ([«?TEXT1», «?TEXT2»])))
axiom ax_2701 : Holds (ap (Const.«subclass») ([Const.«Summary», Const.«Text»]))
axiom ax_2702 : ∀ («?TEXT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?TEXT», Const.«Summary»])) (mkExists (fun («?TEXT2» : Obj) => mkAnd [ap (Const.«instance») ([«?TEXT2», Const.«Text»]), ap (Const.«subsumesContentInstance») ([«?TEXT2», «?TEXT»])])))
axiom ax_2703 : Holds (ap (Const.«subclass») ([Const.«Certificate», Const.«Text»]))
axiom ax_2704 : ∀ («?DOC» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DOC», Const.«Certificate»])) (mkExists (fun («?PROP» : Obj) => mkExists (fun («?NORM» : Obj) => mkOr [ap (Const.«confersNorm») ([«?DOC», «?PROP», «?NORM»]), ap (Const.«deprivesNorm») ([«?DOC», «?PROP», «?NORM»])]))))
axiom ax_2705 : Holds (ap (Const.«subclass») ([Const.«FinancialInstrument», Const.«Certificate»]))
axiom ax_2706 : Holds (ap (Const.«subclass») ([Const.«Currency», Const.«FinancialInstrument»]))
axiom ax_2707 : ∀ («?CURRENCY» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CURRENCY», Const.«Currency»])) (mkExists (fun («?MEASURE» : Obj) => ap (Const.«monetaryValue») ([«?CURRENCY», «?MEASURE»]))))
axiom ax_2708 : Holds (ap (Const.«subclass») ([Const.«Patent», Const.«Certificate»]))
axiom ax_2709 : Holds (ap (Const.«subclass») ([Const.«Molecule», Const.«CompoundSubstance»]))
axiom ax_2710 : ∀ («?MOLE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MOLE», Const.«Molecule»])) (mkExists (fun («?ATOM1» : Obj) => mkExists (fun («?ATOM2» : Obj) => mkAnd [ap (Const.«instance») ([«?ATOM1», Const.«Atom»]), ap (Const.«instance») ([«?ATOM2», Const.«Atom»]), ap (Const.«part») ([«?ATOM1», «?MOLE»]), ap (Const.«part») ([«?ATOM2», «?MOLE»]), mkNot (ap (Const.«equal») ([«?ATOM1», «?ATOM2»]))]))))
axiom ax_2711 : Holds (ap (Const.«subclass») ([Const.«Artifact», Const.«Object»]))
axiom ax_2712 : ∀ («?ARTIFACT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ARTIFACT», Const.«Artifact»])) (mkExists (fun («?MAKING» : Obj) => mkAnd [ap (Const.«instance») ([«?MAKING», Const.«Making»]), ap (Const.«result») ([«?MAKING», «?ARTIFACT»])])))
axiom ax_2713 : Holds (ap (Const.«subclass») ([Const.«Product», Const.«Artifact»]))
axiom ax_2714 : ∀ («?PRODUCT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?PRODUCT», Const.«Product»])) (mkExists (fun («?MANUFACTURE» : Obj) => mkAnd [ap (Const.«instance») ([«?MANUFACTURE», Const.«Manufacture»]), ap (Const.«result») ([«?MANUFACTURE», «?PRODUCT»])])))
axiom ax_2715 : Holds (ap (Const.«instance») ([Const.«version», Const.«BinaryPredicate»]))
axiom ax_2716 : Holds (ap (Const.«instance») ([Const.«version», Const.«AsymmetricRelation»]))
axiom ax_2717 : Holds (ap (Const.«instance») ([Const.«version», Const.«TransitiveRelation»]))
axiom ax_2718 : ∀ («?ARTIFACT1» : Obj) («?ARTIFACT2» : Obj), Holds (mkImp (ap (Const.«version») ([«?ARTIFACT1», «?ARTIFACT2»])) (ap (Const.«subclass») ([«?ARTIFACT1», «?ARTIFACT2»])))
axiom ax_2719 : Holds (ap (Const.«subclass») ([Const.«StationaryArtifact», Const.«Artifact»]))
axiom ax_2720 : ∀ («?ARTIFACT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ARTIFACT», Const.«StationaryArtifact»])) (mkExists (fun («?PLACE» : Obj) => mkAnd [ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?ARTIFACT»]), ap (Const.«located») ([«?ARTIFACT», «?PLACE»])]), mkNot (mkExists (fun («?P2» : Obj) => mkAnd [ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?ARTIFACT»]), ap (Const.«located») ([«?ARTIFACT», «?P2»])]), mkNot (ap (Const.«equal») ([«?PLACE», «?P2»]))]))])))
axiom ax_2721 : Holds (ap (Const.«subclass») ([Const.«Building», Const.«StationaryArtifact»]))
axiom ax_2722 : ∀ («?BUILDING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?BUILDING», Const.«Building»])) (mkExists (fun («?HUMAN» : Obj) => mkAnd [ap (Const.«instance») ([«?HUMAN», Const.«Human»]), mkOr [ap (Const.«inhabits») ([«?HUMAN», «?BUILDING»]), mkExists (fun («?ACT» : Obj) => mkAnd [ap (Const.«agent») ([«?ACT», «?HUMAN»]), ap (Const.«located») ([«?ACT», «?BUILDING»])])]])))
axiom ax_2723 : Holds (ap (Const.«subclass») ([Const.«Room», Const.«StationaryArtifact»]))
axiom ax_2724 : Holds (ap (Const.«disjoint») ([Const.«Room», Const.«Building»]))
axiom ax_2725 : ∀ («?ROOM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ROOM», Const.«Room»])) (mkExists (fun («?BUILD» : Obj) => mkAnd [ap (Const.«instance») ([«?BUILD», Const.«Building»]), ap (Const.«properPart») ([«?ROOM», «?BUILD»])])))
axiom ax_2726 : Holds (ap (Const.«subclass») ([Const.«House», Const.«ResidentialBuilding»]))
axiom ax_2727 : Holds (ap (Const.«subclass») ([Const.«House», Const.«SingleFamilyResidence»]))
axiom ax_2728 : Holds (ap (Const.«subclass») ([Const.«Residence», Const.«StationaryArtifact»]))
axiom ax_2729 : Holds (ap (Const.«disjointDecomposition») ([Const.«Residence», Const.«PermanentResidence», Const.«TemporaryResidence»]))
axiom ax_2730 : ∀ («?RESIDENCE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?RESIDENCE», Const.«Residence»])) (mkOr [ap (Const.«instance») ([«?RESIDENCE», Const.«House»]), mkExists (fun («?BUILDING» : Obj) => mkAnd [ap (Const.«instance») ([«?BUILDING», Const.«ResidentialBuilding»]), ap (Const.«part») ([«?RESIDENCE», «?BUILDING»])])]))
axiom ax_2731 : Holds (ap (Const.«subclass») ([Const.«PermanentResidence», Const.«Residence»]))
axiom ax_2732 : ∀ («?RESIDENCE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?RESIDENCE», Const.«PermanentResidence»])) (mkExists (fun («?PERSON» : Obj) => ap (Const.«home») ([«?PERSON», «?RESIDENCE»]))))
axiom ax_2733 : Holds (ap (Const.«subclass») ([Const.«TemporaryResidence», Const.«Residence»]))
axiom ax_2734 : Holds (ap (Const.«subclass») ([Const.«ResidentialBuilding», Const.«Building»]))
axiom ax_2735 : Holds (ap (Const.«subclass») ([Const.«ResidentialBuilding», Const.«Residence»]))
axiom ax_2736 : Holds (ap (Const.«subclass») ([Const.«SingleFamilyResidence», Const.«PermanentResidence»]))
axiom ax_2737 : ∀ («?RESIDENCE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?RESIDENCE», Const.«SingleFamilyResidence»])) (ap (Const.«hasPurpose») ([«?RESIDENCE», mkForall (fun («?AGENT1» : Obj) => mkForall (fun («?AGENT2» : Obj) => mkImp (mkAnd [ap (Const.«home») ([«?AGENT1», «?RESIDENCE»]), ap (Const.«home») ([«?AGENT2», «?RESIDENCE»])]) (mkExists (fun («?UNIT» : Obj) => mkAnd [ap (Const.«instance») ([«?UNIT», Const.«SocialUnit»]), ap (Const.«member») ([«?AGENT1», «?UNIT»]), ap (Const.«member») ([«?AGENT2», «?UNIT»])]))))])))
axiom ax_2738 : Holds (ap (Const.«subclass») ([Const.«ArtWork», Const.«Artifact»]))
axiom ax_2739 : ∀ («?AW» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AW», Const.«ArtWork»])) (ap (Const.«hasPurpose») ([«?AW», mkExists (fun («?H» : Obj) => mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?H», Const.«Human»]), ap (Const.«instance») ([«?P», Const.«Perception»]), ap (Const.«experiencer») ([«?P», «?H»]), ap (Const.«patient») ([«?P», «?AW»])]))])))
axiom ax_2740 : ∀ («?AW» : Obj), Holds (mkImp (ap (Const.«instance») ([«?AW», Const.«ArtWork»])) (ap (Const.«hasPurpose») ([«?AW», mkExists (fun («?H» : Obj) => mkAnd [ap (Const.«instance») ([«?H», Const.«Human»]), ap (Const.«desires») ([«?H», mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?P», Const.«Perception»]), ap (Const.«experiencer») ([«?P», «?H»]), ap (Const.«patient») ([«?P», «?AW»])])])])])))
axiom ax_2741 : Holds (ap (Const.«subclass») ([Const.«RepresentationalArtWork», Const.«ArtWork»]))
axiom ax_2742 : Holds (ap (Const.«subclass») ([Const.«RepresentationalArtWork», Const.«Icon»]))
axiom ax_2743 : ∀ («?RA» : Obj), Holds (mkImp (ap (Const.«instance») ([«?RA», Const.«RepresentationalArtWork»])) (mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?P», Const.«Physical»]), ap (Const.«represents») ([«?RA», «?P»])])))
axiom ax_2744 : Holds (ap (Const.«subclass») ([Const.«Fabric», Const.«Artifact»]))
axiom ax_2745 : Holds (ap (Const.«disjoint») ([Const.«Fabric», Const.«StationaryArtifact»]))
axiom ax_2746 : Holds (ap (Const.«subclass») ([Const.«WearableItem», Const.«Artifact»]))
axiom ax_2747 : ∀ («?WI» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WI», Const.«WearableItem»])) (ap (Const.«hasPurpose») ([«?WI», mkExists (fun («?H» : Obj) => mkAnd [ap (Const.«instance») ([«?H», Const.«Human»]), ap (Const.«wears») ([«?H», «?WI»])])])))
axiom ax_2748 : Holds (ap (Const.«instance») ([Const.«covers», Const.«BinaryPredicate»]))
axiom ax_2749 : Holds (ap (Const.«instance») ([Const.«covers», Const.«TransitiveRelation»]))
axiom ax_2750 : Holds (ap (Const.«instance») ([Const.«covers», Const.«SpatialRelation»]))
axiom ax_2751 : ∀ («?A» : Obj) («?B» : Obj) («?S» : Obj), Holds (mkImp (mkAnd [ap (Const.«covers») ([«?A», «?B»]), ap (Const.«superficialPart») ([«?S», «?B»])]) (ap (Const.«meetsSpatially») ([«?A», «?S»])))
axiom ax_2752 : ∀ («?C» : Obj) («?I» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?C», Const.«Covering»]), ap (Const.«patient») ([«?C», «?P»]), ap (Const.«instrument») ([«?C», «?I»])]) (ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([ap (Const.«WhenFn») ([«?C»])]), ap (Const.«covers») ([«?I», «?P»])])))
axiom ax_2753 : Holds (ap (Const.«subclass») ([Const.«Clothing», Const.«WearableItem»]))
axiom ax_2754 : Holds (ap (Const.«disjoint») ([Const.«Clothing», Const.«StationaryArtifact»]))
axiom ax_2755 : ∀ («?CLOTHING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLOTHING», Const.«Clothing»])) (ap (Const.«modalAttribute») ([mkExists (fun («?FABRIC» : Obj) => mkAnd [ap (Const.«instance») ([«?FABRIC», Const.«Fabric»]), ap (Const.«part») ([«?FABRIC», «?CLOTHING»])]), Const.«Likely»])))
axiom ax_2756 : ∀ («?CLOTHING» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CLOTHING», Const.«Clothing»])) (ap (Const.«hasPurpose») ([«?CLOTHING», mkExists (fun («?H» : Obj) => mkExists (fun («?P» : Obj) => mkAnd [ap (Const.«instance») ([«?H», Const.«Animal»]), ap (Const.«part») ([«?P», «?H»]), ap (Const.«covers») ([«?CLOTHING», «?P»])]))])))
axiom ax_2757 : Holds (ap (Const.«instance») ([Const.«wears», Const.«BinaryPredicate»]))
axiom ax_2758 : ∀ («?AGENT» : Obj) («?WI» : Obj), Holds (mkImp (ap (Const.«wears») ([«?AGENT», «?WI»])) (ap (Const.«located») ([«?WI», «?AGENT»])))
axiom ax_2759 : ∀ («?A» : Obj) («?C» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«wears») ([«?A», «?C»]), ap (Const.«part») ([«?P», «?C»])]) (ap (Const.«wears») ([«?A», «?P»])))
axiom ax_2760 : Holds (ap (Const.«subclass») ([Const.«Device», Const.«Artifact»]))
axiom ax_2761 : ∀ («?DEVICE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVICE», Const.«Device»])) (mkExists (fun («?PROC» : Obj) => ap (Const.«capability») ([«?PROC», Const.«instrument», «?DEVICE»]))))
axiom ax_2762 : ∀ («?DEVICE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVICE», Const.«Device»])) (mkExists (fun («?PROC» : Obj) => ap (Const.«hasPurpose») ([«?DEVICE», mkExists (fun («?INST» : Obj) => mkAnd [ap (Const.«instance») ([«?INST», «?PROC»]), ap (Const.«instrument») ([«?INST», «?DEVICE»])])]))))
axiom ax_2763 : Holds (ap (Const.«subclass») ([Const.«MusicalInstrument», Const.«Device»]))
axiom ax_2764 : ∀ («?INSTRUMENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?INSTRUMENT», Const.«MusicalInstrument»])) (ap (Const.«capability») ([Const.«MakingMusic», Const.«instrument», «?INSTRUMENT»])))
axiom ax_2765 : Holds (ap (Const.«subclass») ([Const.«TransportationDevice», Const.«Device»]))
axiom ax_2766 : ∀ («?DEVICE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVICE», Const.«TransportationDevice»])) (ap (Const.«capability») ([Const.«Transportation», Const.«instrument», «?DEVICE»])))
axiom ax_2767 : Holds (ap (Const.«subclass») ([Const.«Vehicle», Const.«TransportationDevice»]))
axiom ax_2768 : ∀ («?FROM» : Obj) («?MOVE» : Obj) («?TRANSPORT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TRANSPORT», Const.«Vehicle»]), ap (Const.«instance») ([«?MOVE», Const.«Translocation»]), ap (Const.«instrument») ([«?MOVE», «?TRANSPORT»]), ap (Const.«origin») ([«?MOVE», «?FROM»])]) (ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?MOVE»])]), ap (Const.«located») ([«?TRANSPORT», «?FROM»])])))
axiom ax_2769 : ∀ («?MOVE» : Obj) («?TO» : Obj) («?TRANSPORT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?TRANSPORT», Const.«Vehicle»]), ap (Const.«instance») ([«?MOVE», Const.«Translocation»]), ap (Const.«instrument») ([«?MOVE», «?TRANSPORT»]), ap (Const.«destination») ([«?MOVE», «?TO»])]) (ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?MOVE»])]), ap (Const.«located») ([«?TRANSPORT», «?TO»])])))
axiom ax_2770 : Holds (ap (Const.«subclass») ([Const.«MeasuringDevice», Const.«Device»]))
axiom ax_2771 : ∀ («?DEVICE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVICE», Const.«MeasuringDevice»])) (ap (Const.«hasPurpose») ([«?DEVICE», mkExists (fun («?MEASURE» : Obj) => mkAnd [ap (Const.«instance») ([«?MEASURE», Const.«Measuring»]), ap (Const.«instrument») ([«?MEASURE», «?DEVICE»])])])))
axiom ax_2772 : Holds (ap (Const.«subclass») ([Const.«AttachingDevice», Const.«Device»]))
axiom ax_2773 : ∀ («?DEVICE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?DEVICE», Const.«AttachingDevice»])) (mkExists (fun («?ATTACH» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTACH», Const.«Attaching»]), ap (Const.«instrument») ([«?ATTACH», «?DEVICE»])])))
axiom ax_2774 : Holds (ap (Const.«subclass») ([Const.«Weapon», Const.«Device»]))
axiom ax_2775 : ∀ («?WEAPON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WEAPON», Const.«Weapon»])) (ap (Const.«capability») ([Const.«Damaging», Const.«instrument», «?WEAPON»])))
axiom ax_2776 : ∀ («?WEAPON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?WEAPON», Const.«Weapon»])) (ap (Const.«hasPurpose») ([«?WEAPON», mkExists (fun («?D» : Obj) => mkExists (fun («?PATIENT» : Obj) => mkAnd [ap (Const.«instance») ([«?D», Const.«Damaging»]), ap (Const.«instrument») ([«?D», «?WEAPON»]), ap (Const.«patient») ([«?D», «?PATIENT»])]))])))
axiom ax_2777 : Holds (ap (Const.«subclass») ([Const.«Machine», Const.«Device»]))
axiom ax_2778 : ∀ («?MACHINE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MACHINE», Const.«Machine»])) (mkForall (fun («?PROC» : Obj) => mkImp (ap (Const.«instrument») ([«?PROC», «?MACHINE»])) (mkExists (fun («?RESOURCE» : Obj) => mkExists (fun («?RESULT» : Obj) => mkAnd [ap (Const.«resource») ([«?PROC», «?RESOURCE»]), ap (Const.«result») ([«?PROC», «?RESULT»])]))))))
axiom ax_2779 : Holds (ap (Const.«subclass») ([Const.«EngineeringComponent», Const.«Device»]))
axiom ax_2780 : ∀ («?COMP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?COMP», Const.«EngineeringComponent»])) (mkExists (fun («?DEVICE» : Obj) => mkAnd [ap (Const.«instance») ([«?DEVICE», Const.«Device»]), ap (Const.«component») ([«?COMP», «?DEVICE»])])))
axiom ax_2781 : ∀ («?MACHINE» : Obj), Holds (mkImp (ap (Const.«instance») ([«?MACHINE», Const.«Machine»])) (mkExists (fun («?COMP1» : Obj) => mkExists (fun («?COMP2» : Obj) => mkAnd [ap (Const.«instance») ([«?COMP1», Const.«EngineeringComponent»]), ap (Const.«instance») ([«?COMP2», Const.«EngineeringComponent»]), mkNot (ap (Const.«equal») ([«?COMP1», «?COMP2»])), ap (Const.«part») ([«?COMP1», «?MACHINE»]), ap (Const.«part») ([«?COMP2», «?MACHINE»])]))))
axiom ax_2782 : Holds (ap (Const.«subrelation») ([Const.«engineeringSubcomponent», Const.«properPart»]))
axiom ax_2783 : Holds (ap (Const.«instance») ([Const.«engineeringSubcomponent», Const.«BinaryPredicate»]))
axiom ax_2784 : Holds (ap (Const.«instance») ([Const.«connectedEngineeringComponents», Const.«SymmetricRelation»]))
axiom ax_2785 : Holds (ap (Const.«instance») ([Const.«connectedEngineeringComponents», Const.«IrreflexiveRelation»]))
axiom ax_2786 : Holds (ap (Const.«instance») ([Const.«connectedEngineeringComponents», Const.«PartialValuedRelation»]))
axiom ax_2787 : Holds (ap (Const.«subrelation») ([Const.«connectedEngineeringComponents», Const.«connected»]))
axiom ax_2788 : ∀ («?COMP1» : Obj) («?COMP2» : Obj), Holds (mkImp (ap (Const.«connectedEngineeringComponents») ([«?COMP1», «?COMP2»])) (mkAnd [mkNot (ap (Const.«engineeringSubcomponent») ([«?COMP1», «?COMP2»])), mkNot (ap (Const.«engineeringSubcomponent») ([«?COMP2», «?COMP1»]))]))
axiom ax_2789 : Holds (ap (Const.«subclass») ([Const.«EngineeringConnection», Const.«EngineeringComponent»]))
axiom ax_2790 : ∀ («?CONNECTION» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CONNECTION», Const.«EngineeringConnection»])) (mkExists (fun («?COMP1» : Obj) => mkExists (fun («?COMP2» : Obj) => ap (Const.«connectsEngineeringComponents») ([«?CONNECTION», «?COMP1», «?COMP2»])))))
axiom ax_2791 : ∀ («?COMP1» : Obj) («?COMP2» : Obj), Holds (mkImp (ap (Const.«connectedEngineeringComponents») ([«?COMP1», «?COMP2»])) (mkNot (mkOr [ap (Const.«instance») ([«?COMP1», Const.«EngineeringConnection»]), ap (Const.«instance») ([«?COMP2», Const.«EngineeringConnection»])])))
axiom ax_2792 : ∀ («?COMP1» : Obj) («?COMP2» : Obj), Holds (mkImp (ap (Const.«connectedEngineeringComponents») ([«?COMP1», «?COMP2»])) (mkExists (fun («?CONNECTION» : Obj) => ap (Const.«connectsEngineeringComponents») ([«?CONNECTION», «?COMP1», «?COMP2»]))))
axiom ax_2793 : ∀ («?COMP1» : Obj) («?COMP2» : Obj) («?CONNECTION» : Obj), Holds (mkImp (ap (Const.«connectsEngineeringComponents») ([«?CONNECTION», «?COMP1», «?COMP2»])) (ap (Const.«connectedEngineeringComponents») ([«?COMP1», «?COMP2»])))
axiom ax_2794 : Holds (ap (Const.«subrelation») ([Const.«connectsEngineeringComponents», Const.«connects»]))
axiom ax_2795 : Holds (ap (Const.«instance») ([Const.«connectsEngineeringComponents», Const.«TernaryPredicate»]))
axiom ax_2796 : Holds (ap (Const.«subclass») ([Const.«CommercialAgent», Const.«AutonomousAgent»]))
axiom ax_2797 : Holds (ap (Const.«subclass») ([Const.«Business», Const.«CommercialAgent»]))
axiom ax_2798 : Holds (ap (Const.«subclass») ([Const.«Business», Const.«Organization»]))
axiom ax_2799 : Holds (ap (Const.«subclass») ([Const.«Corporation», Const.«Business»]))
axiom ax_2800 : Holds (ap (Const.«subclass») ([Const.«Corporation», Const.«LegalAgent»]))
axiom ax_2801 : Holds (ap (Const.«subclass») ([Const.«Manufacturer», Const.«Corporation»]))
axiom ax_2802 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«Manufacturer»])) (ap (Const.«hasPurpose») ([«?ORG», mkExists (fun («?MANUFACTURE» : Obj) => mkAnd [ap (Const.«instance») ([«?MANUFACTURE», Const.«Manufacture»]), ap (Const.«instance») ([«?MANUFACTURE», Const.«CommercialService»]), ap (Const.«agent») ([«?MANUFACTURE», «?ORG»])])])))
axiom ax_2803 : Holds (ap (Const.«subclass») ([Const.«MercantileOrganization», Const.«Corporation»]))
axiom ax_2804 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«MercantileOrganization»])) (ap (Const.«hasPurpose») ([«?ORG», mkExists (fun («?SELL» : Obj) => mkAnd [ap (Const.«instance») ([«?SELL», Const.«Selling»]), ap (Const.«instance») ([«?SELL», Const.«CommercialService»]), ap (Const.«agent») ([«?SELL», «?ORG»])])])))
axiom ax_2805 : Holds (ap (Const.«subclass») ([Const.«Group», Const.«Collection»]))
axiom ax_2806 : Holds (ap (Const.«subclass») ([Const.«Group», Const.«AutonomousAgent»]))
axiom ax_2807 : ∀ («?GROUP» : Obj) («?MEMB» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GROUP», Const.«Group»]), ap (Const.«member») ([«?MEMB», «?GROUP»])]) (ap (Const.«instance») ([«?MEMB», Const.«AutonomousAgent»])))
axiom ax_2808 : Holds (ap (Const.«subclass») ([Const.«GroupOfPeople», Const.«Group»]))
axiom ax_2809 : ∀ («?GROUP» : Obj) («?MEMBER» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GROUP», Const.«GroupOfPeople»]), ap (Const.«member») ([«?MEMBER», «?GROUP»])]) (ap (Const.«instance») ([«?MEMBER», Const.«Human»])))
axiom ax_2810 : Holds (ap (Const.«subclass») ([Const.«AgeGroup», Const.«GroupOfPeople»]))
axiom ax_2811 : ∀ («?GROUP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GROUP», Const.«AgeGroup»])) (mkForall (fun («?MEMB1» : Obj) => mkForall (fun («?MEMB2» : Obj) => mkForall (fun («?AGE1» : Obj) => mkForall (fun («?AGE2» : Obj) => mkImp (mkAnd [ap (Const.«member») ([«?MEMB1», «?GROUP»]), ap (Const.«member») ([«?MEMB2», «?GROUP»]), ap (Const.«age») ([«?MEMB1», «?AGE1»]), ap (Const.«age») ([«?MEMB2», «?AGE2»])]) (ap (Const.«equal») ([«?AGE1», «?AGE2»]))))))))
axiom ax_2812 : Holds (ap (Const.«subclass») ([Const.«FamilyGroup», Const.«GroupOfPeople»]))
axiom ax_2813 : ∀ («?GROUP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GROUP», Const.«FamilyGroup»])) (mkForall (fun («?MEMB1» : Obj) => mkForall (fun («?MEMB2» : Obj) => mkImp (mkAnd [ap (Const.«member») ([«?MEMB1», «?GROUP»]), ap (Const.«member») ([«?MEMB2», «?GROUP»])]) (ap (Const.«familyRelation») ([«?MEMB1», «?MEMB2»]))))))
axiom ax_2814 : Holds (ap (Const.«subclass») ([Const.«SocialUnit», Const.«GroupOfPeople»]))
axiom ax_2815 : ∀ («?UNIT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?UNIT», Const.«SocialUnit»])) (mkExists (fun («?HOME» : Obj) => mkExists (fun («?MEMBER» : Obj) => mkImp (ap (Const.«member») ([«?MEMBER», «?UNIT»])) (ap (Const.«home») ([«?MEMBER», «?HOME»]))))))
axiom ax_2816 : Holds (ap (Const.«instance») ([Const.«ImmediateFamilyFn», Const.«UnaryFunction»]))
axiom ax_2817 : Holds (ap (Const.«instance») ([Const.«ImmediateFamilyFn», Const.«TotalValuedRelation»]))
axiom ax_2818 : ∀ («?FAMILY» : Obj) («?P» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«ImmediateFamilyFn») ([«?P»]), «?FAMILY»])) (mkForall (fun («?MEMBER» : Obj) => mkImp (ap (Const.«member») ([«?MEMBER», «?FAMILY»])) (mkExists (fun («?OTHER» : Obj) => mkOr [ap (Const.«parent») ([«?MEMBER», «?OTHER»]), ap (Const.«parent») ([«?OTHER», «?MEMBER»])])))))
axiom ax_2819 : ∀ («?FAMILY» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«equal») ([ap (Const.«ImmediateFamilyFn») ([«?PERSON»]), «?FAMILY»])) (mkExists (fun («?MEMBER» : Obj) => mkAnd [ap (Const.«member») ([«?MEMBER», «?FAMILY»]), mkOr [ap (Const.«parent») ([«?MEMBER», «?PERSON»]), ap (Const.«parent») ([«?PERSON», «?MEMBER»])]])))
axiom ax_2820 : Holds (ap (Const.«instance») ([Const.«relative», Const.«BinaryPredicate»]))
axiom ax_2821 : Holds (ap (Const.«subrelation») ([Const.«familyRelation», Const.«relative»]))
axiom ax_2822 : Holds (ap (Const.«subrelation») ([Const.«spouse», Const.«relative»]))
axiom ax_2823 : ∀ («?A1» : Obj) («?A2» : Obj) («?T1» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?T1», ap (Const.«legalRelation») ([«?A1», «?A2»])]), ap (Const.«instance») ([«?A1», Const.«Organism»]), ap (Const.«instance») ([«?A2», Const.«Organism»])]) (ap (Const.«holdsDuring») ([«?T1», ap (Const.«relative») ([«?A1», «?A2»])])))
axiom ax_2824 : Holds (ap (Const.«instance») ([Const.«familyRelation», Const.«BinaryPredicate»]))
axiom ax_2825 : ∀ («?ORGANISM1» : Obj) («?ORGANISM2» : Obj), Holds (mkImp (ap (Const.«familyRelation») ([«?ORGANISM1», «?ORGANISM2»])) (mkExists (fun («?ORGANISM3» : Obj) => mkAnd [ap (Const.«ancestor») ([«?ORGANISM3», «?ORGANISM1»]), ap (Const.«ancestor») ([«?ORGANISM3», «?ORGANISM2»])])))
axiom ax_2826 : Holds (ap (Const.«instance») ([Const.«ancestor», Const.«TransitiveRelation»]))
axiom ax_2827 : Holds (ap (Const.«instance») ([Const.«ancestor», Const.«IrreflexiveRelation»]))
axiom ax_2828 : Holds (ap (Const.«instance») ([Const.«ancestor», Const.«TotalValuedRelation»]))
axiom ax_2829 : Holds (ap (Const.«instance») ([Const.«ancestor», Const.«BinaryPredicate»]))
axiom ax_2830 : Holds (ap (Const.«instance») ([Const.«parent», Const.«BinaryPredicate»]))
axiom ax_2831 : Holds (ap (Const.«instance») ([Const.«parent», Const.«AsymmetricRelation»]))
axiom ax_2832 : Holds (ap (Const.«instance») ([Const.«parent», Const.«IntransitiveRelation»]))
axiom ax_2833 : Holds (ap (Const.«instance») ([Const.«parent», Const.«TotalValuedRelation»]))
axiom ax_2834 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (ap (Const.«parent») ([«?CHILD», «?PARENT»])) (ap (Const.«ancestor») ([«?CHILD», «?PARENT»])))
axiom ax_2835 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (ap (Const.«parent») ([«?CHILD», «?PARENT»])) (ap (Const.«before») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?PARENT»])]), ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?CHILD»])])])))
axiom ax_2836 : ∀ («?CHILD» : Obj) («?CLASS» : Obj) («?PARENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«parent») ([«?CHILD», «?PARENT»]), ap (Const.«subclass») ([«?CLASS», Const.«Organism»]), ap (Const.«instance») ([«?PARENT», «?CLASS»])]) (ap (Const.«instance») ([«?CHILD», «?CLASS»])))
axiom ax_2837 : ∀ («?CHILD» : Obj) («?PARENT» : Obj) («?REP» : Obj), Holds (mkImp (mkAnd [ap (Const.«parent») ([«?CHILD», «?PARENT»]), ap (Const.«instance») ([«?REP», Const.«SexualReproduction»]), ap (Const.«agent») ([«?REP», «?PARENT»]), ap (Const.«result») ([«?REP», «?CHILD»])]) (mkOr [ap (Const.«mother») ([«?CHILD», «?PARENT»]), ap (Const.«father») ([«?CHILD», «?PARENT»])]))
axiom ax_2838 : ∀ («?ORGANISM» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORGANISM», Const.«Organism»])) (mkExists (fun («?PARENT» : Obj) => ap (Const.«parent») ([«?ORGANISM», «?PARENT»]))))
axiom ax_2839 : Holds (ap (Const.«instance») ([Const.«mother», Const.«SingleValuedRelation»]))
axiom ax_2840 : Holds (ap (Const.«instance») ([Const.«mother», Const.«PartialValuedRelation»]))
axiom ax_2841 : Holds (ap (Const.«instance») ([Const.«mother», Const.«BinaryPredicate»]))
axiom ax_2842 : ∀ («?A» : Obj) («?B» : Obj), Holds (mkImp (ap (Const.«mother») ([«?A», «?B»])) (ap (Const.«parent») ([«?A», «?B»])))
axiom ax_2843 : ∀ («?CHILD» : Obj) («?MOTHER» : Obj), Holds (mkImp (ap (Const.«mother») ([«?CHILD», «?MOTHER»])) (ap (Const.«attribute») ([«?MOTHER», Const.«Female»])))
axiom ax_2844 : Holds (ap (Const.«instance») ([Const.«father», Const.«SingleValuedRelation»]))
axiom ax_2845 : Holds (ap (Const.«instance») ([Const.«father», Const.«PartialValuedRelation»]))
axiom ax_2846 : Holds (ap (Const.«instance») ([Const.«father», Const.«BinaryPredicate»]))
axiom ax_2847 : ∀ («?A» : Obj) («?B» : Obj), Holds (mkImp (ap (Const.«father») ([«?A», «?B»])) (ap (Const.«parent») ([«?A», «?B»])))
axiom ax_2848 : ∀ («?CHILD» : Obj) («?FATHER» : Obj), Holds (mkImp (ap (Const.«father») ([«?CHILD», «?FATHER»])) (ap (Const.«attribute») ([«?FATHER», Const.«Male»])))
axiom ax_2849 : Holds (ap (Const.«instance») ([Const.«daughter», Const.«BinaryPredicate»]))
axiom ax_2850 : Holds (ap (Const.«subrelation») ([Const.«daughter», Const.«parent»]))
axiom ax_2851 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (ap (Const.«daughter») ([«?CHILD», «?PARENT»])) (ap (Const.«attribute») ([«?CHILD», Const.«Female»])))
axiom ax_2852 : Holds (ap (Const.«subrelation») ([Const.«son», Const.«parent»]))
axiom ax_2853 : Holds (ap (Const.«instance») ([Const.«son», Const.«BinaryPredicate»]))
axiom ax_2854 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (ap (Const.«son») ([«?CHILD», «?PARENT»])) (ap (Const.«attribute») ([«?CHILD», Const.«Male»])))
axiom ax_2855 : Holds (ap (Const.«instance») ([Const.«sibling», Const.«BinaryPredicate»]))
axiom ax_2856 : Holds (ap (Const.«instance») ([Const.«sibling», Const.«PartialValuedRelation»]))
axiom ax_2857 : Holds (ap (Const.«subrelation») ([Const.«sibling», Const.«familyRelation»]))
axiom ax_2858 : Holds (ap (Const.«instance») ([Const.«sibling», Const.«SymmetricRelation»]))
axiom ax_2859 : Holds (ap (Const.«instance») ([Const.«sibling», Const.«IrreflexiveRelation»]))
axiom ax_2860 : ∀ («?ORGANISM1» : Obj) («?ORGANISM2» : Obj) («?PARENT1» : Obj) («?PARENT2» : Obj), Holds (mkImp (mkAnd [ap (Const.«parent») ([«?ORGANISM1», «?PARENT1»]), ap (Const.«parent») ([«?ORGANISM2», «?PARENT1»]), ap (Const.«parent») ([«?ORGANISM1», «?PARENT2»]), ap (Const.«parent») ([«?ORGANISM2», «?PARENT2»]), mkNot (ap (Const.«equal») ([«?ORGANISM1», «?ORGANISM2»])), mkNot (ap (Const.«equal») ([«?PARENT1», «?PARENT2»]))]) (ap (Const.«sibling») ([«?ORGANISM1», «?ORGANISM2»])))
axiom ax_2861 : ∀ («?ORG1» : Obj) («?ORG2» : Obj) («?PARENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«sibling») ([«?ORG1», «?ORG2»]), ap (Const.«parent») ([«?ORG1», «?PARENT»])]) (ap (Const.«parent») ([«?ORG2», «?PARENT»])))
axiom ax_2862 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«parent») ([«?CHILD», «?PARENT»]), ap (Const.«attribute») ([«?PARENT», Const.«Male»])]) (ap (Const.«father») ([«?CHILD», «?PARENT»])))
axiom ax_2863 : ∀ («?CHILD» : Obj) («?PARENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«parent») ([«?CHILD», «?PARENT»]), ap (Const.«attribute») ([«?PARENT», Const.«Female»])]) (ap (Const.«mother») ([«?CHILD», «?PARENT»])))
axiom ax_2864 : Holds (ap (Const.«subrelation») ([Const.«brother», Const.«sibling»]))
axiom ax_2865 : Holds (ap (Const.«instance») ([Const.«brother», Const.«IrreflexiveRelation»]))
axiom ax_2866 : Holds (ap (Const.«instance») ([Const.«brother», Const.«TransitiveRelation»]))
axiom ax_2867 : Holds (ap (Const.«instance») ([Const.«brother», Const.«PartialValuedRelation»]))
axiom ax_2868 : Holds (ap (Const.«subrelation») ([Const.«sister», Const.«sibling»]))
axiom ax_2869 : Holds (ap (Const.«instance») ([Const.«sister», Const.«IrreflexiveRelation»]))
axiom ax_2870 : Holds (ap (Const.«instance») ([Const.«sister», Const.«TransitiveRelation»]))
axiom ax_2871 : Holds (ap (Const.«instance») ([Const.«sister», Const.«PartialValuedRelation»]))
axiom ax_2872 : Holds (ap (Const.«instance») ([Const.«legalRelation», Const.«BinaryPredicate»]))
axiom ax_2873 : Holds (ap (Const.«instance») ([Const.«legalRelation», Const.«SymmetricRelation»]))
axiom ax_2874 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj), Holds (mkImp (ap (Const.«legalRelation») ([«?AGENT1», «?AGENT2»])) (mkExists (fun («?DECLARE» : Obj) => mkExists (fun («?OBLIGATION» : Obj) => mkAnd [ap (Const.«instance») ([«?DECLARE», Const.«Declaring»]), ap (Const.«confersObligation») ([«?OBLIGATION», «?DECLARE», «?AGENT1»]), ap (Const.«confersObligation») ([«?OBLIGATION», «?DECLARE», «?AGENT2»])]))))
axiom ax_2875 : Holds (ap (Const.«instance») ([Const.«acquaintance», Const.«BinaryPredicate»]))
axiom ax_2876 : Holds (ap (Const.«instance») ([Const.«mutualAcquaintance», Const.«BinaryPredicate»]))
axiom ax_2877 : Holds (ap (Const.«instance») ([Const.«mutualAcquaintance», Const.«SymmetricRelation»]))
axiom ax_2878 : Holds (ap (Const.«subrelation») ([Const.«mutualAcquaintance», Const.«acquaintance»]))
axiom ax_2879 : Holds (ap (Const.«subrelation») ([Const.«spouse», Const.«mutualAcquaintance»]))
axiom ax_2880 : Holds (ap (Const.«subrelation») ([Const.«spouse», Const.«legalRelation»]))
axiom ax_2881 : Holds (ap (Const.«instance») ([Const.«spouse», Const.«IrreflexiveRelation»]))
axiom ax_2882 : Holds (ap (Const.«instance») ([Const.«spouse», Const.«SymmetricRelation»]))
axiom ax_2883 : Holds (ap (Const.«instance») ([Const.«spouse», Const.«PartialValuedRelation»]))
axiom ax_2884 : Holds (ap (Const.«instance») ([Const.«husband», Const.«AsymmetricRelation»]))
axiom ax_2885 : Holds (ap (Const.«instance») ([Const.«husband», Const.«BinaryPredicate»]))
axiom ax_2886 : Holds (ap (Const.«instance») ([Const.«husband», Const.«IrreflexiveRelation»]))
axiom ax_2887 : Holds (ap (Const.«instance») ([Const.«husband», Const.«PartialValuedRelation»]))
axiom ax_2888 : Holds (ap (Const.«inverse») ([Const.«husband», Const.«wife»]))
axiom ax_2889 : Holds (ap (Const.«instance») ([Const.«wife», Const.«AsymmetricRelation»]))
axiom ax_2890 : Holds (ap (Const.«instance») ([Const.«wife», Const.«IrreflexiveRelation»]))
axiom ax_2891 : Holds (ap (Const.«instance») ([Const.«wife», Const.«BinaryPredicate»]))
axiom ax_2892 : Holds (ap (Const.«subclass») ([Const.«EthnicGroup», Const.«GroupOfPeople»]))
axiom ax_2893 : Holds (ap (Const.«subclass») ([Const.«BeliefGroup», Const.«GroupOfPeople»]))
axiom ax_2894 : ∀ («?GROUP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?GROUP», Const.«BeliefGroup»])) (mkExists (fun («?BELIEF» : Obj) => mkForall (fun («?MEMB» : Obj) => mkImp (ap (Const.«member») ([«?MEMB», «?GROUP»])) (ap (Const.«believes») ([«?MEMB», «?BELIEF»]))))))
axiom ax_2895 : Holds (ap (Const.«subclass») ([Const.«Organization», Const.«Group»]))
axiom ax_2896 : Holds (ap (Const.«subclass») ([Const.«Organization», Const.«AutonomousAgent»]))
axiom ax_2897 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«Organization»])) (mkExists (fun («?PURP» : Obj) => mkForall (fun («?MEMBER» : Obj) => mkImp (ap (Const.«member») ([«?MEMBER», «?ORG»])) (ap (Const.«hasPurpose») ([«?MEMBER», «?PURP»]))))))
axiom ax_2898 : ∀ («?AGENT» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ORG», Const.«Organization»]), ap (Const.«member») ([«?AGENT», «?ORG»])]) (ap (Const.«instance») ([«?AGENT», Const.«AutonomousAgent»])))
axiom ax_2899 : Holds (ap (Const.«instance») ([Const.«employs», Const.«BinaryPredicate»]))
axiom ax_2900 : Holds (ap (Const.«subclass») ([Const.«PoliticalOrganization», Const.«Organization»]))
axiom ax_2901 : ∀ («?POL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?POL», Const.«PoliticalOrganization»])) (mkExists (fun («?PROC» : Obj) => mkAnd [ap (Const.«instance») ([«?PROC», Const.«PoliticalProcess»]), ap (Const.«agent») ([«?PROC», «?POL»])])))
axiom ax_2902 : Holds (ap (Const.«subclass») ([Const.«MilitaryForce», Const.«PoliticalOrganization»]))
axiom ax_2903 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«MilitaryForce»])) (ap (Const.«capability») ([Const.«ViolentContest», Const.«agent», «?ORG»])))
axiom ax_2904 : Holds (ap (Const.«subclass») ([Const.«MilitaryOrganization», Const.«MilitaryForce»]))
axiom ax_2905 : Holds (ap (Const.«subclass») ([Const.«MilitaryOrganization», Const.«GovernmentOrganization»]))
axiom ax_2906 : Holds (ap (Const.«subclass») ([Const.«ParamilitaryOrganization», Const.«MilitaryForce»]))
axiom ax_2907 : Holds (ap (Const.«disjoint») ([Const.«ParamilitaryOrganization», Const.«GovernmentOrganization»]))
axiom ax_2908 : Holds (ap (Const.«subclass») ([Const.«GovernmentOrganization», Const.«Organization»]))
axiom ax_2909 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«GovernmentOrganization»])) (mkExists (fun («?GOV» : Obj) => mkAnd [ap (Const.«instance») ([«?GOV», Const.«Government»]), ap (Const.«subOrganization») ([«?ORG», «?GOV»])])))
axiom ax_2910 : ∀ («?GOV» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?GOV», Const.«Government»]), ap (Const.«subOrganization») ([«?ORG», «?GOV»])]) (ap (Const.«instance») ([«?ORG», Const.«GovernmentOrganization»])))
axiom ax_2911 : ∀ («?GOV» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«subOrganization») ([«?ORG», «?GOV»]), ap (Const.«instance») ([«?GOV», Const.«GovernmentOrganization»])]) (ap (Const.«instance») ([«?ORG», Const.«GovernmentOrganization»])))
axiom ax_2912 : Holds (ap (Const.«subclass») ([Const.«Government», Const.«GovernmentOrganization»]))
axiom ax_2913 : Holds (ap (Const.«subclass») ([Const.«Government», Const.«LegalAgent»]))
axiom ax_2914 : Holds (ap (Const.«instance») ([Const.«GovernmentFn», Const.«UnaryFunction»]))
axiom ax_2915 : Holds (ap (Const.«instance») ([Const.«GovernmentFn», Const.«PartialValuedRelation»]))
axiom ax_2916 : Holds (ap (Const.«subclass») ([Const.«PoliceOrganization», Const.«GovernmentOrganization»]))
axiom ax_2917 : Holds (ap (Const.«subclass») ([Const.«JudicialOrganization», Const.«GovernmentOrganization»]))
axiom ax_2918 : Holds (ap (Const.«subclass») ([Const.«EducationalOrganization», Const.«Organization»]))
axiom ax_2919 : Holds (ap (Const.«subclass») ([Const.«ReligiousOrganization», Const.«Organization»]))
axiom ax_2920 : Holds (ap (Const.«subclass») ([Const.«ReligiousOrganization», Const.«BeliefGroup»]))
axiom ax_2921 : Holds (ap (Const.«subrelation») ([Const.«subOrganization», Const.«subCollection»]))
axiom ax_2922 : Holds (ap (Const.«instance») ([Const.«subOrganization», Const.«PartialOrderingRelation»]))
axiom ax_2923 : Holds (ap (Const.«instance») ([Const.«citizen», Const.«BinaryPredicate»]))
axiom ax_2924 : Holds (ap (Const.«instance») ([Const.«citizen», Const.«AsymmetricRelation»]))
axiom ax_2925 : Holds (ap (Const.«subclass») ([Const.«FieldOfStudy», Const.«Proposition»]))
axiom ax_2926 : Holds (ap (Const.«subclass») ([Const.«Procedure», Const.«Proposition»]))
axiom ax_2927 : Holds (ap (Const.«subclass») ([Const.«ComputerProgram», Const.«Procedure»]))
axiom ax_2928 : Holds (ap (Const.«subclass») ([Const.«ComputerProgramming», Const.«ContentDevelopment»]))
axiom ax_2929 : ∀ («?CP» : Obj), Holds (mkImp (ap (Const.«instance») ([«?CP», Const.«ComputerProgramming»])) (mkExists (fun («?C» : Obj) => mkAnd [ap (Const.«instance») ([«?C», Const.«ComputerProgram»]), ap (Const.«result») ([«?CP», «?C»])])))
axiom ax_2930 : Holds (ap (Const.«subclass») ([Const.«Plan», Const.«Procedure»]))
axiom ax_2931 : ∀ («?OBJ» : Obj) («?PLAN» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PLAN», Const.«Plan»]), ap (Const.«instance») ([«?OBJ», Const.«ContentBearingObject»]), ap (Const.«containsInformation») ([«?OBJ», «?PLAN»])]) (mkExists (fun («?PLANNING» : Obj) => mkAnd [ap (Const.«instance») ([«?PLANNING», Const.«Planning»]), ap (Const.«result») ([«?PLANNING», «?OBJ»])])))
axiom ax_2932 : Holds (ap (Const.«subclass») ([Const.«Argument», Const.«Proposition»]))
axiom ax_2933 : Holds (ap (Const.«partition») ([Const.«Argument», Const.«DeductiveArgument», Const.«InductiveArgument»]))
axiom ax_2934 : ∀ («?REASON» : Obj), Holds (mkImp (ap (Const.«instance») ([«?REASON», Const.«Reasoning»])) (mkExists (fun («?ARGUMENT» : Obj) => mkAnd [ap (Const.«instance») ([«?ARGUMENT», Const.«Argument»]), ap (Const.«realization») ([«?REASON», «?ARGUMENT»])])))
axiom ax_2935 : ∀ («?ARGUMENT» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ARGUMENT», Const.«Argument»])) (mkExists (fun («?PREMISES» : Obj) => mkExists (fun («?CONCLUSION» : Obj) => mkAnd [ap (Const.«equal») ([ap (Const.«PremisesFn») ([«?ARGUMENT»]), «?PREMISES»]), ap (Const.«conclusion») ([«?CONCLUSION», «?ARGUMENT»])]))))
axiom ax_2936 : Holds (ap (Const.«subclass») ([Const.«DeductiveArgument», Const.«Argument»]))
axiom ax_2937 : Holds (ap (Const.«partition») ([Const.«DeductiveArgument», Const.«ValidDeductiveArgument», Const.«InvalidDeductiveArgument»]))
axiom ax_2938 : Holds (ap (Const.«subclass») ([Const.«ValidDeductiveArgument», Const.«DeductiveArgument»]))
axiom ax_2939 : ∀ («?ARGUMENT» : Obj) («?CONCLUSION» : Obj) («?PREMISES» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ARGUMENT», Const.«ValidDeductiveArgument»]), ap (Const.«equal») ([«?PREMISES», ap (Const.«PremisesFn») ([«?ARGUMENT»])]), ap (Const.«conclusion») ([«?CONCLUSION», «?ARGUMENT»])]) (mkExists (fun («?FORMULA1» : Obj) => mkExists (fun («?FORMULA2» : Obj) => mkAnd [ap (Const.«containsInformation») ([«?FORMULA1», «?PREMISES»]), ap (Const.«containsInformation») ([«?FORMULA2», «?CONCLUSION»]), ap (Const.«entails») ([«?PREMISES», «?CONCLUSION»])]))))
axiom ax_2940 : Holds (ap (Const.«subclass») ([Const.«InvalidDeductiveArgument», Const.«DeductiveArgument»]))
axiom ax_2941 : Holds (ap (Const.«subclass») ([Const.«Explanation», Const.«DeductiveArgument»]))
axiom ax_2942 : Holds (ap (Const.«subclass») ([Const.«InductiveArgument», Const.«Argument»]))
axiom ax_2943 : Holds (ap (Const.«instance») ([Const.«premise», Const.«BinaryPredicate»]))
axiom ax_2944 : Holds (ap (Const.«instance») ([Const.«premise», Const.«TotalValuedRelation»]))
axiom ax_2945 : Holds (ap (Const.«instance») ([Const.«PremisesFn», Const.«UnaryFunction»]))
axiom ax_2946 : Holds (ap (Const.«instance») ([Const.«PremisesFn», Const.«TotalValuedRelation»]))
axiom ax_2947 : ∀ («?ARGUMENT» : Obj) («?PREMISES» : Obj) («?PROPOSITION» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ARGUMENT», Const.«Argument»]), ap (Const.«equal») ([«?PREMISES», ap (Const.«PremisesFn») ([«?ARGUMENT»])])]) (mkIff (ap (Const.«subProposition») ([«?PROPOSITION», «?PREMISES»])) (ap (Const.«premise») ([«?ARGUMENT», «?PROPOSITION»]))))
axiom ax_2948 : Holds (ap (Const.«instance») ([Const.«conclusion», Const.«BinaryPredicate»]))
axiom ax_2949 : Holds (ap (Const.«instance») ([Const.«conclusion», Const.«SingleValuedRelation»]))
axiom ax_2950 : Holds (ap (Const.«instance») ([Const.«conclusion», Const.«TotalValuedRelation»]))
axiom ax_2951 : Holds (ap (Const.«instance») ([Const.«consistent», Const.«BinaryPredicate»]))
axiom ax_2952 : Holds (ap (Const.«instance») ([Const.«consistent», Const.«SymmetricRelation»]))
axiom ax_2953 : Holds (ap (Const.«instance») ([Const.«orientation», Const.«SpatialRelation»]))
axiom ax_2954 : Holds (ap (Const.«instance») ([Const.«orientation», Const.«TernaryPredicate»]))
axiom ax_2955 : ∀ («?ATTR1» : Obj) («?ATTR2» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj) («@ROW» : List Obj), Holds (mkImp (mkAnd [ap (Const.«orientation») ([«?OBJ1», «?OBJ2», «?ATTR1»]), ap (Const.«contraryAttribute») («@ROW»), ap (Const.«inList») ([«?ATTR1», ap (Const.«ListFn») («@ROW»)]), ap (Const.«inList») ([«?ATTR2», ap (Const.«ListFn») («@ROW»)]), mkNot (ap (Const.«equal») ([«?ATTR1», «?ATTR2»]))]) (mkNot (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», «?ATTR2»]))))
axiom ax_2956 : ∀ («?X» : Obj) («?Y» : Obj) («?Z» : Obj), Holds (mkImp (mkAnd [ap (Const.«orientation») ([«?X», «?Y», Const.«Right»]), ap (Const.«orientation») ([«?Z», «?Y», Const.«Left»])]) (ap (Const.«orientation») ([«?X», «?Z», Const.«Right»])))
axiom ax_2957 : Holds (ap (Const.«instance») ([Const.«direction», Const.«PartialValuedRelation»]))
axiom ax_2958 : Holds (ap (Const.«subrelation») ([Const.«direction», Const.«involvedInEvent»]))
axiom ax_2959 : ∀ («?ATTR1» : Obj) («?PROC» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«direction») ([«?PROC», «?ATTR1»])])) (mkForall (fun («?ATTR2» : Obj) => mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«direction») ([«?PROC», «?ATTR2»])])) (ap (Const.«equal») ([«?ATTR2», «?ATTR1»])))))
axiom ax_2960 : Holds (ap (Const.«instance») ([Const.«faces», Const.«BinaryPredicate»]))
axiom ax_2961 : ∀ («?ATTR1» : Obj) («?PROC» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«faces») ([«?PROC», «?ATTR1»])])) (mkForall (fun («?ATTR2» : Obj) => mkImp (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«faces») ([«?PROC», «?ATTR2»])])) (ap (Const.«equal») ([«?ATTR2», «?ATTR1»])))))
axiom ax_2962 : Holds (ap (Const.«subclass») ([Const.«TruthValue», Const.«RelationalAttribute»]))
axiom ax_2963 : ∀ («?ITEM» : Obj) («?VALUE» : Obj), Holds (mkImp (mkAnd [ap (Const.«property») ([«?ITEM», «?VALUE»]), ap (Const.«instance») ([«?VALUE», Const.«TruthValue»])]) (mkOr [ap (Const.«instance») ([«?ITEM», Const.«Sentence»]), ap (Const.«instance») ([«?ITEM», Const.«Proposition»])]))
axiom ax_2964 : Holds (ap (Const.«instance») ([Const.«True», Const.«TruthValue»]))
axiom ax_2965 : Holds (ap (Const.«instance») ([Const.«False», Const.«TruthValue»]))
axiom ax_2966 : Holds (ap (Const.«contraryAttribute») ([Const.«False», Const.«True»]))
axiom ax_2967 : Holds (ap (Const.«subrelation») ([Const.«truth», Const.«property»]))
axiom ax_2968 : Holds (ap (Const.«instance») ([Const.«truth», Const.«BinaryPredicate»]))
axiom ax_2969 : Holds (ap (Const.«subclass») ([Const.«PositionalAttribute», Const.«RelationalAttribute»]))
axiom ax_2970 : Holds (ap (Const.«subclass») ([Const.«DirectionalAttribute», Const.«PositionalAttribute»]))
axiom ax_2971 : ∀ («?DIRECT» : Obj) («?OBJ1» : Obj) («?OBJ2» : Obj) («?OBJ3» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?DIRECT», Const.«DirectionalAttribute»]), ap (Const.«orientation») ([«?OBJ1», «?OBJ2», «?DIRECT»]), ap (Const.«orientation») ([«?OBJ2», «?OBJ3», «?DIRECT»])]) (ap (Const.«between») ([«?OBJ1», «?OBJ2», «?OBJ3»])))
axiom ax_2972 : Holds (ap (Const.«instance») ([Const.«North», Const.«DirectionalAttribute»]))
axiom ax_2973 : Holds (ap (Const.«contraryAttribute») ([Const.«North», Const.«South», Const.«East», Const.«West»]))
axiom ax_2974 : Holds (ap (Const.«instance») ([Const.«South», Const.«DirectionalAttribute»]))
axiom ax_2975 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«North»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«South»])))
axiom ax_2976 : Holds (ap (Const.«instance») ([Const.«East», Const.«DirectionalAttribute»]))
axiom ax_2977 : Holds (ap (Const.«instance») ([Const.«West», Const.«DirectionalAttribute»]))
axiom ax_2978 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«East»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«West»])))
axiom ax_2979 : Holds (ap (Const.«instance») ([Const.«Vertical», Const.«PositionalAttribute»]))
axiom ax_2980 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Vertical»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«Vertical»])))
axiom ax_2981 : Holds (ap (Const.«instance») ([Const.«Horizontal», Const.«PositionalAttribute»]))
axiom ax_2982 : Holds (ap (Const.«contraryAttribute») ([Const.«Horizontal», Const.«Vertical»]))
axiom ax_2983 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Horizontal»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«Horizontal»])))
axiom ax_2984 : Holds (ap (Const.«subclass») ([Const.«SymmetricPositionalAttribute», Const.«PositionalAttribute»]))
axiom ax_2985 : ∀ («?O1» : Obj) («?O2» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?P», Const.«SymmetricPositionalAttribute»]), ap (Const.«orientation») ([«?O1», «?O2», «?P»])]) (ap (Const.«orientation») ([«?O2», «?O1», «?P»])))
axiom ax_2986 : Holds (ap (Const.«subclass») ([Const.«AntiSymmetricPositionalAttribute», Const.«PositionalAttribute»]))
axiom ax_2987 : ∀ («?O1» : Obj) («?O2» : Obj) («?P» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?P», Const.«AntiSymmetricPositionalAttribute»]), ap (Const.«orientation») ([«?O1», «?O2», «?P»])]) (mkNot (ap (Const.«orientation») ([«?O2», «?O1», «?P»]))))
axiom ax_2988 : Holds (ap (Const.«instance») ([Const.«Above», Const.«PositionalAttribute»]))
axiom ax_2989 : Holds (ap (Const.«instance») ([Const.«Above», Const.«AntiSymmetricPositionalAttribute»]))
axiom ax_2990 : Holds (ap (Const.«contraryAttribute») ([Const.«Above», Const.«Below»]))
axiom ax_2991 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Above»])) (mkNot (ap (Const.«connected») ([«?OBJ1», «?OBJ2»]))))
axiom ax_2992 : Holds (ap (Const.«instance») ([Const.«Below», Const.«PositionalAttribute»]))
axiom ax_2993 : Holds (ap (Const.«instance») ([Const.«Below», Const.«AntiSymmetricPositionalAttribute»]))
axiom ax_2994 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Below»])) (mkOr [ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«On»]), ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«Above»])]))
axiom ax_2995 : Holds (ap (Const.«instance») ([Const.«Adjacent», Const.«SymmetricPositionalAttribute»]))
axiom ax_2996 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Adjacent»])) (mkOr [ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Near»]), ap (Const.«connected») ([«?OBJ1», «?OBJ2»])]))
axiom ax_2997 : Holds (ap (Const.«instance») ([Const.«Left», Const.«PositionalAttribute»]))
axiom ax_2998 : Holds (ap (Const.«instance») ([Const.«Left», Const.«AntiSymmetricPositionalAttribute»]))
axiom ax_2999 : Holds (ap (Const.«instance») ([Const.«Right», Const.«PositionalAttribute»]))
axiom ax_3000 : Holds (ap (Const.«instance») ([Const.«Right», Const.«AntiSymmetricPositionalAttribute»]))
axiom ax_3001 : Holds (ap (Const.«contraryAttribute») ([Const.«Right», Const.«Left»]))
axiom ax_3002 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkIff (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Right»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«Left»])))
axiom ax_3003 : Holds (ap (Const.«instance») ([Const.«Near», Const.«SymmetricPositionalAttribute»]))
axiom ax_3004 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Near»])) (mkNot (ap (Const.«connected») ([«?OBJ1», «?OBJ2»]))))
axiom ax_3005 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Near»])) (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«Near»])))
axiom ax_3006 : Holds (ap (Const.«instance») ([Const.«On», Const.«AntiSymmetricPositionalAttribute»]))
axiom ax_3007 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«On»])) (ap (Const.«connected») ([«?OBJ1», «?OBJ2»])))
axiom ax_3008 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«On»])) (ap (Const.«located») ([«?OBJ1», «?OBJ2»])))
axiom ax_3009 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«Inside»])) (ap (Const.«located») ([«?OBJ1», «?OBJ2»])))
axiom ax_3010 : ∀ («?OBJ1» : Obj) («?OBJ2» : Obj), Holds (mkImp (ap (Const.«orientation») ([«?OBJ1», «?OBJ2», Const.«On»])) (mkNot (ap (Const.«orientation») ([«?OBJ2», «?OBJ1», Const.«On»]))))
axiom ax_3011 : Holds (ap (Const.«subclass») ([Const.«TimeZone», Const.«RelationalAttribute»]))
axiom ax_3012 : Holds (ap (Const.«instance») ([Const.«CoordinatedUniversalTimeZone», Const.«TimeZone»]))
axiom ax_3013 : Holds (ap (Const.«instance») ([Const.«PacificTimeZone», Const.«TimeZone»]))
axiom ax_3014 : ∀ («?D» : Obj) («?H1» : Obj) («?H2» : Obj) («?M» : Obj) («?PST» : Obj) («?UTC» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UTC», ap (Const.«HourFn») ([«?H1», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«instance») ([«?PST», ap (Const.«HourFn») ([«?H2», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«equal») ([ap (Const.«RelativeTimeFn») ([«?UTC», Const.«PacificTimeZone»]), «?PST»])]) (ap (Const.«equal») ([«?H2», ap (Const.«AdditionFn») ([«?H1», numLit "8"])])))
axiom ax_3015 : Holds (ap (Const.«instance») ([Const.«MountainTimeZone», Const.«TimeZone»]))
axiom ax_3016 : ∀ («?D» : Obj) («?H1» : Obj) («?H2» : Obj) («?M» : Obj) («?MST» : Obj) («?UTC» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UTC», ap (Const.«HourFn») ([«?H1», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«instance») ([«?MST», ap (Const.«HourFn») ([«?H2», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«equal») ([ap (Const.«RelativeTimeFn») ([«?UTC», Const.«MountainTimeZone»]), «?MST»])]) (ap (Const.«equal») ([«?H2», ap (Const.«AdditionFn») ([«?H1», numLit "7"])])))
axiom ax_3017 : Holds (ap (Const.«instance») ([Const.«CentralTimeZone», Const.«TimeZone»]))
axiom ax_3018 : ∀ («?CST» : Obj) («?D» : Obj) («?H1» : Obj) («?H2» : Obj) («?M» : Obj) («?UTC» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UTC», ap (Const.«HourFn») ([«?H1», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«instance») ([«?CST», ap (Const.«HourFn») ([«?H2», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«equal») ([ap (Const.«RelativeTimeFn») ([«?UTC», Const.«CentralTimeZone»]), «?CST»])]) (ap (Const.«equal») ([«?H2», ap (Const.«AdditionFn») ([«?H1», numLit "6"])])))
axiom ax_3019 : Holds (ap (Const.«instance») ([Const.«EasternTimeZone», Const.«TimeZone»]))
axiom ax_3020 : ∀ («?D» : Obj) («?EST» : Obj) («?H1» : Obj) («?H2» : Obj) («?M» : Obj) («?UTC» : Obj) («?Y» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?UTC», ap (Const.«HourFn») ([«?H1», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«instance») ([«?EST», ap (Const.«HourFn») ([«?H2», ap (Const.«DayFn») ([«?D», ap (Const.«MonthFn») ([«?M», ap (Const.«YearFn») ([«?Y»])])])])]), ap (Const.«equal») ([ap (Const.«RelativeTimeFn») ([«?UTC», Const.«EasternTimeZone»]), «?EST»])]) (ap (Const.«equal») ([«?H2», ap (Const.«AdditionFn») ([«?H1», numLit "5"])])))
axiom ax_3021 : Holds (ap (Const.«instance») ([Const.«RelativeTimeFn», Const.«BinaryFunction»]))
axiom ax_3022 : Holds (ap (Const.«instance») ([Const.«RelativeTimeFn», Const.«TemporalRelation»]))
axiom ax_3023 : Holds (ap (Const.«instance») ([Const.«RelativeTimeFn», Const.«TotalValuedRelation»]))
axiom ax_3024 : Holds (ap (Const.«subclass») ([Const.«SocialRole», Const.«RelationalAttribute»]))
axiom ax_3025 : ∀ («?ATTRIBUTE» : Obj) («?PERSON» : Obj), Holds (mkImp (mkAnd [ap (Const.«attribute») ([«?PERSON», «?ATTRIBUTE»]), ap (Const.«instance») ([«?ATTRIBUTE», Const.«SocialRole»])]) (ap (Const.«instance») ([«?PERSON», Const.«Human»])))
axiom ax_3026 : Holds (ap (Const.«instance») ([Const.«Unemployed», Const.«SocialRole»]))
axiom ax_3027 : ∀ («?PERSON» : Obj) («?T» : Obj), Holds (mkIff (ap (Const.«holdsDuring») ([«?T», mkAnd [ap (Const.«instance») ([«?PERSON», Const.«Human»]), mkForall (fun («?ORG» : Obj) => mkNot (ap (Const.«employs») ([«?ORG», «?PERSON»])))]])) (ap (Const.«holdsDuring») ([«?T», ap (Const.«attribute») ([«?PERSON», Const.«Unemployed»])])))
axiom ax_3028 : Holds (ap (Const.«subclass») ([Const.«Position», Const.«SocialRole»]))
axiom ax_3029 : Holds (ap (Const.«instance») ([Const.«occupiesPosition», Const.«TernaryPredicate»]))
axiom ax_3030 : ∀ («?AGENT» : Obj) («?ORG» : Obj) («?POSITION» : Obj), Holds (mkImp (ap (Const.«occupiesPosition») ([«?AGENT», «?POSITION», «?ORG»])) (ap (Const.«attribute») ([«?AGENT», «?POSITION»])))
axiom ax_3031 : ∀ («?ORG» : Obj) («?PERSON» : Obj), Holds (mkImp (ap (Const.«employs») ([«?ORG», «?PERSON»])) (mkExists (fun («?POSITION» : Obj) => ap (Const.«occupiesPosition») ([«?PERSON», «?POSITION», «?ORG»]))))
axiom ax_3032 : ∀ («?ORGANIZATION» : Obj) («?PERSON» : Obj) («?POSITION» : Obj), Holds (mkImp (ap (Const.«occupiesPosition») ([«?PERSON», «?POSITION», «?ORGANIZATION»])) (ap (Const.«member») ([«?PERSON», «?ORGANIZATION»])))
axiom ax_3033 : Holds (ap (Const.«subclass») ([Const.«NormativeAttribute», Const.«RelationalAttribute»]))
axiom ax_3034 : Holds (ap (Const.«instance») ([Const.«modalAttribute», Const.«BinaryPredicate»]))
axiom ax_3035 : Holds (ap (Const.«instance») ([Const.«modalAttribute», Const.«AsymmetricRelation»]))
axiom ax_3036 : Holds (ap (Const.«instance») ([Const.«modalAttribute», Const.«IrreflexiveRelation»]))
axiom ax_3037 : Holds (ap (Const.«instance») ([Const.«modalAttribute», Const.«PartialValuedRelation»]))
axiom ax_3038 : Holds (ap (Const.«subrelation») ([Const.«modalAttribute», Const.«property»]))
axiom ax_3039 : ∀ («?FORMULA1» : Obj) («?FORMULA2» : Obj) («?PROP» : Obj), Holds (mkImp (mkAnd [ap (Const.«modalAttribute») ([«?FORMULA1», «?PROP»]), ap (Const.«entails») ([«?FORMULA1», «?FORMULA2»])]) (ap (Const.«modalAttribute») ([«?FORMULA2», «?PROP»])))
axiom ax_3040 : ∀ («?FORMULA» : Obj), Holds (mkImp (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Permission»])) (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Possibility»])))
axiom ax_3041 : Holds (ap (Const.«subclass») ([Const.«SubjectiveAssessmentAttribute», Const.«NormativeAttribute»]))
axiom ax_3042 : Holds (ap (Const.«disjoint») ([Const.«SubjectiveAssessmentAttribute», Const.«ObjectiveNorm»]))
axiom ax_3043 : ∀ («?AGENT» : Obj) («?JUDGE» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?JUDGE», Const.«Judging»]), ap (Const.«agent») ([«?JUDGE», «?AGENT»]), ap (Const.«patient») ([«?JUDGE», «?OBJ»])]) (mkExists (fun («?ATR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATR», Const.«SubjectiveAssessmentAttribute»]), ap (Const.«holdsDuring») ([ap (Const.«ImmediateFutureFn») ([«?JUDGE»]), ap (Const.«believes») ([«?AGENT», ap (Const.«property») ([«?OBJ», «?ATR»])])])])))
axiom ax_3044 : Holds (ap (Const.«subclass») ([Const.«SubjectiveStrongPositiveAttribute», Const.«SubjectiveAssessmentAttribute»]))
axiom ax_3045 : Holds (ap (Const.«subclass») ([Const.«SubjectiveWeakPositiveAttribute», Const.«SubjectiveAssessmentAttribute»]))
axiom ax_3046 : Holds (ap (Const.«subclass») ([Const.«SubjectiveStrongNegativeAttribute», Const.«SubjectiveAssessmentAttribute»]))
axiom ax_3047 : Holds (ap (Const.«subclass») ([Const.«SubjectiveWeakNegativeAttribute», Const.«SubjectiveAssessmentAttribute»]))
axiom ax_3048 : Holds (ap (Const.«subclass») ([Const.«ObjectiveNorm», Const.«NormativeAttribute»]))
axiom ax_3049 : Holds (ap (Const.«subclass») ([Const.«ContestAttribute», Const.«ObjectiveNorm»]))
axiom ax_3050 : ∀ («?ATTR» : Obj) («?THING» : Obj), Holds (mkImp (mkAnd [ap (Const.«property») ([«?THING», «?ATTR»]), ap (Const.«instance») ([«?ATTR», Const.«ContestAttribute»])]) (mkExists (fun («?CONTEST» : Obj) => mkAnd [ap (Const.«instance») ([«?CONTEST», Const.«Contest»]), mkOr [ap (Const.«agent») ([«?CONTEST», «?THING»]), ap (Const.«patient») ([«?CONTEST», «?THING»]), ap (Const.«subProcess») ([«?THING», «?CONTEST»])]])))
axiom ax_3051 : Holds (ap (Const.«subclass») ([Const.«AlethicAttribute», Const.«ObjectiveNorm»]))
axiom ax_3052 : Holds (ap (Const.«instance») ([Const.«Possibility», Const.«AlethicAttribute»]))
axiom ax_3053 : Holds (ap (Const.«instance») ([Const.«Necessity», Const.«AlethicAttribute»]))
axiom ax_3054 : ∀ («?FORMULA» : Obj), Holds (mkIff (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Necessity»])) (mkNot (ap (Const.«modalAttribute») ([mkNot («?FORMULA»), Const.«Possibility»]))))
axiom ax_3055 : ∀ («?FORMULA» : Obj), Holds (mkImp (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Necessity»])) (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Possibility»])))
axiom ax_3056 : Holds (ap (Const.«instance») ([Const.«holdsRight», Const.«BinaryPredicate»]))
axiom ax_3057 : Holds (ap (Const.«instance») ([Const.«holdsRight», Const.«AsymmetricRelation»]))
axiom ax_3058 : Holds (ap (Const.«instance») ([Const.«confersRight», Const.«TernaryPredicate»]))
axiom ax_3059 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?FORMULA» : Obj), Holds (mkImp (ap (Const.«confersRight») ([«?FORMULA», «?AGENT1», «?AGENT2»])) (ap (Const.«holdsRight») ([«?FORMULA», «?AGENT2»])))
axiom ax_3060 : Holds (ap (Const.«instance») ([Const.«holdsObligation», Const.«BinaryPredicate»]))
axiom ax_3061 : Holds (ap (Const.«instance») ([Const.«holdsObligation», Const.«AsymmetricRelation»]))
axiom ax_3062 : Holds (ap (Const.«relatedInternalConcept») ([Const.«holdsObligation», Const.«holdsRight»]))
axiom ax_3063 : Holds (ap (Const.«instance») ([Const.«confersObligation», Const.«TernaryPredicate»]))
axiom ax_3064 : Holds (ap (Const.«relatedInternalConcept») ([Const.«confersObligation», Const.«confersRight»]))
axiom ax_3065 : ∀ («?AGENT1» : Obj) («?AGENT2» : Obj) («?FORMULA» : Obj), Holds (mkImp (ap (Const.«confersObligation») ([«?FORMULA», «?AGENT1», «?AGENT2»])) (ap (Const.«holdsObligation») ([«?FORMULA», «?AGENT2»])))
axiom ax_3066 : Holds (ap (Const.«subclass») ([Const.«DeonticAttribute», Const.«ObjectiveNorm»]))
axiom ax_3067 : Holds (ap (Const.«instance») ([Const.«Permission», Const.«DeonticAttribute»]))
axiom ax_3068 : Holds (ap (Const.«instance») ([Const.«Obligation», Const.«DeonticAttribute»]))
axiom ax_3069 : ∀ («?FORMULA» : Obj), Holds (mkIff (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Obligation»])) (mkNot (ap (Const.«modalAttribute») ([mkNot («?FORMULA»), Const.«Permission»]))))
axiom ax_3070 : ∀ («?FORMULA» : Obj), Holds (mkImp (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Obligation»])) (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Permission»])))
axiom ax_3071 : Holds (ap (Const.«subAttribute») ([Const.«Law», Const.«Obligation»]))
axiom ax_3072 : Holds (ap (Const.«instance») ([Const.«Law», Const.«DeonticAttribute»]))
axiom ax_3073 : Holds (ap (Const.«subAttribute») ([Const.«Promise», Const.«Obligation»]))
axiom ax_3074 : Holds (ap (Const.«instance») ([Const.«Prohibition», Const.«DeonticAttribute»]))
axiom ax_3075 : ∀ («?FORMULA» : Obj), Holds (mkIff (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Prohibition»])) (mkNot (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Permission»]))))
axiom ax_3076 : Holds (ap (Const.«subclass») ([Const.«ProbabilityAttribute», Const.«ObjectiveNorm»]))
axiom ax_3077 : Holds (ap (Const.«instance») ([Const.«Likely», Const.«ProbabilityAttribute»]))
axiom ax_3078 : Holds (ap (Const.«contraryAttribute») ([Const.«Likely», Const.«Unlikely»]))
axiom ax_3079 : ∀ («?FORMULA» : Obj), Holds (mkImp (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Likely»])) (ap (Const.«greaterThan») ([ap (Const.«ProbabilityFn») ([ap (Const.«truth») ([«?FORMULA», Const.«True»])]), ap (Const.«ProbabilityFn») ([ap (Const.«truth») ([«?FORMULA», Const.«False»])])])))
axiom ax_3080 : Holds (ap (Const.«instance») ([Const.«Unlikely», Const.«ProbabilityAttribute»]))
axiom ax_3081 : ∀ («?FORMULA» : Obj), Holds (mkImp (ap (Const.«modalAttribute») ([«?FORMULA», Const.«Unlikely»])) (ap (Const.«greaterThan») ([ap (Const.«ProbabilityFn») ([ap (Const.«truth») ([«?FORMULA», Const.«False»])]), ap (Const.«ProbabilityFn») ([ap (Const.«truth») ([«?FORMULA», Const.«True»])])])))
axiom ax_3082 : Holds (ap (Const.«subclass») ([Const.«PhysicalState», Const.«InternalAttribute»]))
axiom ax_3083 : Holds (ap (Const.«contraryAttribute») ([Const.«Solid», Const.«Liquid», Const.«Gas», Const.«Plasma»]))
axiom ax_3084 : Holds (ap (Const.«exhaustiveAttribute») ([Const.«PhysicalState», Const.«Solid», Const.«Liquid», Const.«Gas», Const.«Plasma»]))
axiom ax_3085 : Holds (ap (Const.«instance») ([Const.«Solid», Const.«PhysicalState»]))
axiom ax_3086 : Holds (ap (Const.«instance») ([Const.«Liquid», Const.«PhysicalState»]))
axiom ax_3087 : Holds (ap (Const.«subAttribute») ([Const.«Liquid», Const.«Fluid»]))
axiom ax_3088 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«Solution»])) (ap (Const.«attribute») ([«?OBJ», Const.«Liquid»])))
axiom ax_3089 : Holds (ap (Const.«instance») ([Const.«Gas», Const.«PhysicalState»]))
axiom ax_3090 : Holds (ap (Const.«subAttribute») ([Const.«Gas», Const.«Fluid»]))
axiom ax_3091 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«Substance»])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«PhysicalState»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])))
axiom ax_3092 : ∀ («?ATTR» : Obj) («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTR», Const.«PhysicalState»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])]) (ap (Const.«instance») ([«?OBJ», Const.«Substance»])))
axiom ax_3093 : Holds (ap (Const.«instance») ([Const.«Plasma», Const.«PhysicalState»]))
axiom ax_3094 : Holds (ap (Const.«subAttribute») ([Const.«Plasma», Const.«Fluid»]))
axiom ax_3095 : Holds (ap (Const.«instance») ([Const.«Fluid», Const.«InternalAttribute»]))
axiom ax_3096 : ∀ («?X» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?X», Const.«Substance»]), mkOr [ap (Const.«attribute») ([«?X», Const.«Gas»]), ap (Const.«attribute») ([«?X», Const.«Liquid»]), ap (Const.«attribute») ([«?X», Const.«Plasma»])]]) (ap (Const.«attribute») ([«?X», Const.«Fluid»])))
axiom ax_3097 : Holds (ap (Const.«subclass») ([Const.«PerceptualAttribute», Const.«RelationalAttribute»]))
axiom ax_3098 : ∀ («?OBJ» : Obj) («?PERCEPTION» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?PERCEPTION», Const.«Perception»]), ap (Const.«patient») ([«?PERCEPTION», «?OBJ»])]) (mkExists (fun («?PROP» : Obj) => mkAnd [ap (Const.«instance») ([«?PROP», Const.«PerceptualAttribute»]), ap (Const.«attribute») ([«?OBJ», «?PROP»])])))
axiom ax_3099 : Holds (ap (Const.«subclass») ([Const.«TasteAttribute», Const.«PerceptualAttribute»]))
axiom ax_3100 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», ap (Const.«FoodForFn») ([Const.«Animal»])])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«TasteAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTR»])])))
axiom ax_3101 : Holds (ap (Const.«subclass») ([Const.«OlfactoryAttribute», Const.«PerceptualAttribute»]))
axiom ax_3102 : Holds (ap (Const.«subclass») ([Const.«VisualAttribute», Const.«PerceptualAttribute»]))
axiom ax_3103 : Holds (ap (Const.«instance») ([Const.«Illuminated», Const.«VisualAttribute»]))
axiom ax_3104 : Holds (ap (Const.«instance») ([Const.«Unilluminated», Const.«VisualAttribute»]))
axiom ax_3105 : Holds (ap (Const.«contraryAttribute») ([Const.«Unilluminated», Const.«Illuminated»]))
axiom ax_3106 : Holds (ap (Const.«subclass») ([Const.«ColorAttribute», Const.«VisualAttribute»]))
axiom ax_3107 : Holds (ap (Const.«subclass») ([Const.«PrimaryColor», Const.«ColorAttribute»]))
axiom ax_3108 : Holds (ap (Const.«instance») ([Const.«Red», Const.«PrimaryColor»]))
axiom ax_3109 : Holds (ap (Const.«instance») ([Const.«Blue», Const.«PrimaryColor»]))
axiom ax_3110 : Holds (ap (Const.«instance») ([Const.«Yellow», Const.«PrimaryColor»]))
axiom ax_3111 : Holds (ap (Const.«instance») ([Const.«White», Const.«PrimaryColor»]))
axiom ax_3112 : Holds (ap (Const.«instance») ([Const.«Black», Const.«PrimaryColor»]))
axiom ax_3113 : Holds (ap (Const.«instance») ([Const.«Monochromatic», Const.«ColorAttribute»]))
axiom ax_3114 : ∀ («?COLOR» : Obj) («?OBJ» : Obj) («?PART» : Obj), Holds (mkImp (mkAnd [ap (Const.«attribute») ([«?OBJ», Const.«Monochromatic»]), ap (Const.«superficialPart») ([«?PART», «?OBJ»]), ap (Const.«attribute») ([«?PART», «?COLOR»]), ap (Const.«instance») ([«?COLOR», Const.«PrimaryColor»])]) (mkForall (fun («?ELEMENT» : Obj) => mkImp (ap (Const.«superficialPart») ([«?ELEMENT», «?OBJ»])) (ap (Const.«attribute») ([«?ELEMENT», «?COLOR»])))))
axiom ax_3115 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«instance») ([«?OBJ», Const.«Object»])) (mkOr [ap (Const.«attribute») ([«?OBJ», Const.«Monochromatic»]), ap (Const.«attribute») ([«?OBJ», Const.«Polychromatic»])]))
axiom ax_3116 : Holds (ap (Const.«instance») ([Const.«Polychromatic», Const.«ColorAttribute»]))
axiom ax_3117 : Holds (ap (Const.«contraryAttribute») ([Const.«Polychromatic», Const.«Monochromatic»]))
axiom ax_3118 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?OBJ», Const.«Polychromatic»])) (mkExists (fun («?PART1» : Obj) => mkExists (fun («?PART2» : Obj) => mkExists (fun («?COLOR1» : Obj) => mkExists (fun («?COLOR2» : Obj) => mkAnd [ap (Const.«superficialPart») ([«?PART1», «?OBJ»]), ap (Const.«superficialPart») ([«?PART2», «?OBJ»]), ap (Const.«attribute») ([«?PART1», «?COLOR1»]), ap (Const.«attribute») ([«?PART2», «?COLOR2»]), ap (Const.«instance») ([«?COLOR1», Const.«ColorAttribute»]), ap (Const.«instance») ([«?COLOR2», Const.«ColorAttribute»]), mkNot (ap (Const.«equal») ([«?COLOR1», «?COLOR2»]))]))))))
axiom ax_3119 : Holds (ap (Const.«subclass») ([Const.«StructureAttribute», Const.«InternalAttribute»]))
axiom ax_3120 : Holds (ap (Const.«subclass») ([Const.«ShapeAttribute», Const.«StructureAttribute»]))
axiom ax_3121 : ∀ («?ATTRIBUTE» : Obj) («?OBJ» : Obj) («?SURFACE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTRIBUTE», Const.«ShapeAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTRIBUTE»]), ap (Const.«surface») ([«?SURFACE», «?OBJ»])]) (ap (Const.«attribute») ([«?SURFACE», «?ATTRIBUTE»])))
axiom ax_3122 : Holds (ap (Const.«instance») ([Const.«Pliable», Const.«InternalAttribute»]))
axiom ax_3123 : ∀ («?OBJ» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?OBJ», Const.«Object»]), ap (Const.«attribute») ([«?OBJ», Const.«Pliable»])]) (mkExists (fun («?CHANGE» : Obj) => mkAnd [ap (Const.«instance») ([«?CHANGE», Const.«ShapeChange»]), ap (Const.«patient») ([«?CHANGE», «?OBJ»])])))
axiom ax_3124 : Holds (ap (Const.«instance») ([Const.«Rigid», Const.«InternalAttribute»]))
axiom ax_3125 : Holds (ap (Const.«contraryAttribute») ([Const.«Rigid», Const.«Pliable»]))
axiom ax_3126 : Holds (ap (Const.«subclass») ([Const.«TextureAttribute», Const.«PerceptualAttribute»]))
axiom ax_3127 : ∀ («?ATTRIBUTE» : Obj) («?OBJ» : Obj) («?SURFACE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTRIBUTE», Const.«TextureAttribute»]), ap (Const.«attribute») ([«?OBJ», «?ATTRIBUTE»]), ap (Const.«surface») ([«?SURFACE», «?OBJ»])]) (ap (Const.«attribute») ([«?SURFACE», «?ATTRIBUTE»])))
axiom ax_3128 : Holds (ap (Const.«instance») ([Const.«Smooth», Const.«TextureAttribute»]))
axiom ax_3129 : Holds (ap (Const.«instance») ([Const.«Rough», Const.«TextureAttribute»]))
axiom ax_3130 : Holds (ap (Const.«contraryAttribute») ([Const.«Smooth», Const.«Rough»]))
axiom ax_3131 : Holds (ap (Const.«subclass») ([Const.«GeometricFigure», Const.«ShapeAttribute»]))
axiom ax_3132 : Holds (ap (Const.«partition») ([Const.«GeometricFigure», Const.«GeometricPoint», Const.«OneDimensionalFigure», Const.«TwoDimensionalFigure», Const.«ThreeDimensionalFigure»]))
axiom ax_3133 : Holds (ap (Const.«subclass») ([Const.«GeometricPoint», Const.«GeometricFigure»]))
axiom ax_3134 : Holds (ap (Const.«subclass») ([Const.«OneDimensionalFigure», Const.«GeometricFigure»]))
axiom ax_3135 : Holds (ap (Const.«subclass») ([Const.«TwoDimensionalFigure», Const.«GeometricFigure»]))
axiom ax_3136 : Holds (ap (Const.«partition») ([Const.«TwoDimensionalFigure», Const.«OpenTwoDimensionalFigure», Const.«ClosedTwoDimensionalFigure»]))
axiom ax_3137 : Holds (ap (Const.«subclass») ([Const.«OpenTwoDimensionalFigure», Const.«TwoDimensionalFigure»]))
axiom ax_3138 : Holds (ap (Const.«subclass») ([Const.«TwoDimensionalAngle», Const.«OpenTwoDimensionalFigure»]))
axiom ax_3139 : Holds (ap (Const.«subclass») ([Const.«ClosedTwoDimensionalFigure», Const.«TwoDimensionalFigure»]))
axiom ax_3140 : Holds (ap (Const.«subclass») ([Const.«ThreeDimensionalFigure», Const.«GeometricFigure»]))
axiom ax_3141 : Holds (ap (Const.«instance») ([Const.«geometricPart», Const.«BinaryPredicate»]))
axiom ax_3142 : Holds (ap (Const.«instance») ([Const.«geometricPart», Const.«PartialOrderingRelation»]))
axiom ax_3143 : Holds (ap (Const.«subrelation») ([Const.«pointOfFigure», Const.«geometricPart»]))
axiom ax_3144 : Holds (ap (Const.«instance») ([Const.«pointOfFigure», Const.«BinaryPredicate»]))
axiom ax_3145 : Holds (ap (Const.«subrelation») ([Const.«angleOfFigure», Const.«geometricPart»]))
axiom ax_3146 : Holds (ap (Const.«instance») ([Const.«angleOfFigure», Const.«BinaryPredicate»]))
axiom ax_3147 : Holds (ap (Const.«instance») ([Const.«pointOfIntersection», Const.«TernaryPredicate»]))
axiom ax_3148 : ∀ («?FIGURE1» : Obj) («?FIGURE2» : Obj) («?POINT» : Obj), Holds (mkImp (ap (Const.«pointOfIntersection») ([«?FIGURE1», «?FIGURE2», «?POINT»])) (mkAnd [ap (Const.«pointOfFigure») ([«?POINT», «?FIGURE1»]), ap (Const.«pointOfFigure») ([«?POINT», «?FIGURE2»])]))
axiom ax_3149 : Holds (ap (Const.«instance») ([Const.«parallel», Const.«BinaryPredicate»]))
axiom ax_3150 : ∀ («?LINE1» : Obj) («?LINE2» : Obj), Holds (mkImp (ap (Const.«parallel») ([«?LINE1», «?LINE2»])) (mkNot (mkExists (fun («?POINT» : Obj) => ap (Const.«pointOfIntersection») ([«?LINE1», «?LINE2», «?POINT»])))))
axiom ax_3151 : Holds (ap (Const.«instance») ([Const.«angularMeasure», Const.«BinaryPredicate»]))
axiom ax_3152 : Holds (ap (Const.«instance») ([Const.«angularMeasure», Const.«TotalValuedRelation»]))
axiom ax_3153 : Holds (ap (Const.«instance») ([Const.«relativeAngle», Const.«TernaryPredicate»]))
axiom ax_3154 : Holds (ap (Const.«instance») ([Const.«relativeAngle», Const.«TotalValuedRelation»]))
axiom ax_3155 : ∀ («?L1» : Obj) («?L2» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?L1», Const.«Object»]), ap (Const.«attribute») ([«?L1», Const.«LongAndThin»]), ap (Const.«instance») ([«?L2», Const.«Object»]), ap (Const.«attribute») ([«?L2», Const.«LongAndThin»]), ap (Const.«connected») ([«?L1», «?L2»]), mkNot (ap (Const.«equal») ([«?L1», «?L2»]))]) (mkExists (fun («?M» : Obj) => ap (Const.«relativeAngle») ([«?L1», «?L2», «?M»]))))
axiom ax_3156 : ∀ («?L1» : Obj) («?L2» : Obj) («?M» : Obj), Holds (mkImp (ap (Const.«relativeAngle») ([«?L1», «?L2», «?M»])) (mkAnd [ap (Const.«instance») ([«?L1», Const.«Object»]), ap (Const.«attribute») ([«?L1», Const.«LongAndThin»]), ap (Const.«instance») ([«?L2», Const.«Object»]), ap (Const.«attribute») ([«?L2», Const.«LongAndThin»]), ap (Const.«connected») ([«?L1», «?L2»]), mkNot (ap (Const.«equal») ([«?L1», «?L2»]))]))
axiom ax_3157 : ∀ («?E1» : Obj) («?E2» : Obj) («?E3» : Obj) («?E4» : Obj) («?N» : Obj) («?N1» : Obj) («?N2» : Obj) («?N3» : Obj) («?O1» : Obj) («?O2» : Obj) («?U» : Obj), Holds (mkImp (mkAnd [ap (Const.«relativeAngle») ([«?O1», «?O2», «?N»]), ap (Const.«physicalEnd») ([«?E1», «?O1»]), ap (Const.«physicalEnd») ([«?E2», «?O1»]), mkNot (ap (Const.«equal») ([«?E1», «?E2»])), ap (Const.«length») ([«?O1», ap (Const.«MeasureFn») ([«?N1», «?U»])]), ap (Const.«length») ([«?O2», ap (Const.«MeasureFn») ([«?N2», «?U»])]), ap (Const.«distance») ([«?E1», «?E3», ap (Const.«MeasureFn») ([«?N3», «?U»])]), ap (Const.«physicalEnd») ([«?E3», «?O2»]), ap (Const.«physicalEnd») ([«?E4», «?O2»]), mkNot (ap (Const.«equal») ([«?E3», «?E4»])), mkNot (ap (Const.«meetsSpatially») ([«?E1», «?E3»]))]) (ap (Const.«equal») ([«?N», ap (Const.«ArcCosineFn») ([ap (Const.«DivisionFn») ([ap (Const.«SubtractionFn») ([ap (Const.«SubtractionFn») ([ap (Const.«MultiplicationFn») ([«?N3», «?N3»]), ap (Const.«MultiplicationFn») ([«?N1», «?N1»])]), ap (Const.«MultiplicationFn») ([«?N2», «?N2»])]), ap (Const.«MultiplicationFn») ([numLit "2.0", ap (Const.«MultiplicationFn») ([«?N1», «?N2»])])])])])))
axiom ax_3158 : Holds (ap (Const.«instance») ([Const.«physicalEnd», Const.«BinaryPredicate»]))
axiom ax_3159 : Holds (ap (Const.«subrelation») ([Const.«physicalEnd», Const.«properPart»]))
axiom ax_3160 : Holds (ap (Const.«subrelation») ([Const.«physicalEnd», Const.«part»]))
axiom ax_3161 : ∀ («?O» : Obj) («?P1» : Obj), Holds (mkImp (ap (Const.«physicalEnd») ([«?P1», «?O»])) (ap (Const.«attribute») ([«?O», Const.«LongAndThin»])))
axiom ax_3162 : ∀ («?D» : Obj) («?O» : Obj) («?P1» : Obj) («?P2» : Obj) («?U» : Obj), Holds (mkImp (mkAnd [ap (Const.«physicalEnd») ([«?P1», «?O»]), ap (Const.«physicalEnd») ([«?P2», «?O»]), mkNot (ap (Const.«equal») ([«?P1», «?P2»])), ap (Const.«distance») ([«?P1», «?P2», ap (Const.«MeasureFn») ([«?D», «?U»])])]) (mkNot (mkExists (fun («?OP1» : Obj) => mkExists (fun («?OP2» : Obj) => mkExists (fun («?N2» : Obj) => mkAnd [ap (Const.«physicalEnd») ([«?OP1», «?O»]), ap (Const.«physicalEnd») ([«?OP2», «?O»]), mkNot (ap (Const.«equal») ([«?OP1», «?OP2»])), ap (Const.«distance») ([«?OP1», «?OP2», ap (Const.«MeasureFn») ([«?N2», «?U»])]), ap (Const.«greaterThan») ([«?N2», «?D»])]))))))
axiom ax_3163 : Holds (ap (Const.«instance») ([Const.«lineMeasure», Const.«BinaryPredicate»]))
axiom ax_3164 : Holds (ap (Const.«instance») ([Const.«lineMeasure», Const.«TotalValuedRelation»]))
axiom ax_3165 : Holds (ap (Const.«instance») ([Const.«geometricDistance», Const.«TernaryPredicate»]))
axiom ax_3166 : Holds (ap (Const.«instance») ([Const.«geometricDistance», Const.«SingleValuedRelation»]))
axiom ax_3167 : Holds (ap (Const.«instance») ([Const.«geometricDistance», Const.«TotalValuedRelation»]))
axiom ax_3168 : ∀ («?LENGTH» : Obj) («?POINT1» : Obj) («?POINT2» : Obj), Holds (mkImp (ap (Const.«geometricDistance») ([«?POINT1», «?POINT2», «?LENGTH»])) (ap (Const.«geometricDistance») ([«?POINT2», «?POINT1», «?LENGTH»])))
axiom ax_3169 : Holds (ap (Const.«subclass») ([Const.«SaturationAttribute», Const.«InternalAttribute»]))
axiom ax_3170 : Holds (ap (Const.«instance») ([Const.«Dry», Const.«SaturationAttribute»]))
axiom ax_3171 : Holds (ap (Const.«contraryAttribute») ([Const.«Dry», Const.«Damp»]))
axiom ax_3172 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?OBJ», Const.«Dry»])) (mkNot (mkExists (fun («?SUBOBJ» : Obj) => mkAnd [ap (Const.«part») ([«?SUBOBJ», «?OBJ»]), ap (Const.«attribute») ([«?SUBOBJ», Const.«Liquid»])]))))
axiom ax_3173 : Holds (ap (Const.«instance») ([Const.«Damp», Const.«SaturationAttribute»]))
axiom ax_3174 : Holds (ap (Const.«instance») ([Const.«Wet», Const.«SaturationAttribute»]))
axiom ax_3175 : Holds (ap (Const.«subAttribute») ([Const.«Wet», Const.«Damp»]))
axiom ax_3176 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?OBJ», Const.«Wet»])) (mkForall (fun («?PART» : Obj) => mkImp (ap (Const.«part») ([«?PART», «?OBJ»])) (mkExists (fun («?SUBPART» : Obj) => mkAnd [ap (Const.«part») ([«?SUBPART», «?PART»]), ap (Const.«attribute») ([«?SUBPART», Const.«Liquid»])])))))
axiom ax_3177 : Holds (ap (Const.«subclass») ([Const.«BiologicalAttribute», Const.«InternalAttribute»]))
axiom ax_3178 : ∀ («?ATT» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«attribute») ([«?ORG», «?ATT»]), ap (Const.«instance») ([«?ATT», Const.«BiologicalAttribute»])]) (ap (Const.«instance») ([«?ORG», Const.«OrganicObject»])))
axiom ax_3179 : Holds (ap (Const.«subclass») ([Const.«BodyPosition», Const.«BiologicalAttribute»]))
axiom ax_3180 : ∀ («?ANIMAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ANIMAL», Const.«Animal»])) (mkOr [mkExists (fun («?MOTION» : Obj) => mkAnd [ap (Const.«instance») ([«?MOTION», Const.«BodyMotion»]), ap (Const.«agent») ([«?MOTION», «?ANIMAL»])]), mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«BodyPosition»]), ap (Const.«attribute») ([«?ANIMAL», «?ATTR»])])]))
axiom ax_3181 : Holds (ap (Const.«instance») ([Const.«Standing», Const.«BodyPosition»]))
axiom ax_3182 : ∀ («?AGENT» : Obj) («?AMBULATE» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?AMBULATE», Const.«Ambulating»]), ap (Const.«agent») ([«?AMBULATE», «?AGENT»])]) (ap (Const.«attribute») ([«?AGENT», Const.«Standing»])))
axiom ax_3183 : Holds (ap (Const.«instance») ([Const.«Sitting», Const.«BodyPosition»]))
axiom ax_3184 : Holds (ap (Const.«instance») ([Const.«Prostrate», Const.«BodyPosition»]))
axiom ax_3185 : Holds (ap (Const.«subclass») ([Const.«AnimacyAttribute», Const.«BiologicalAttribute»]))
axiom ax_3186 : Holds (ap (Const.«exhaustiveAttribute») ([Const.«AnimacyAttribute», Const.«Living», Const.«Dead»]))
axiom ax_3187 : Holds (ap (Const.«instance») ([Const.«Living», Const.«AnimacyAttribute»]))
axiom ax_3188 : ∀ («?ORGANISM» : Obj) («?PROCESS» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ORGANISM», Const.«Organism»]), ap (Const.«agent») ([«?PROCESS», «?ORGANISM»])]) (ap (Const.«holdsDuring») ([ap (Const.«WhenFn») ([«?PROCESS»]), ap (Const.«attribute») ([«?ORGANISM», Const.«Living»])])))
axiom ax_3189 : Holds (ap (Const.«instance») ([Const.«Dead», Const.«AnimacyAttribute»]))
axiom ax_3190 : Holds (ap (Const.«subAttribute») ([Const.«Dead», Const.«Unconscious»]))
axiom ax_3191 : Holds (ap (Const.«contraryAttribute») ([Const.«Dead», Const.«Living»]))
axiom ax_3192 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«Organism»])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«AnimacyAttribute»]), ap (Const.«attribute») ([«?ORG», «?ATTR»])])))
axiom ax_3193 : Holds (ap (Const.«subclass») ([Const.«SexAttribute», Const.«BiologicalAttribute»]))
axiom ax_3194 : Holds (ap (Const.«exhaustiveAttribute») ([Const.«SexAttribute», Const.«Female», Const.«Male», Const.«NonBinaryGender»]))
axiom ax_3195 : Holds (ap (Const.«instance») ([Const.«NonBinaryGender», Const.«SexAttribute»]))
axiom ax_3196 : Holds (ap (Const.«instance») ([Const.«Female», Const.«SexAttribute»]))
axiom ax_3197 : ∀ («?BODY» : Obj) («?ORG» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?BODY», Const.«ReproductiveBody»]), ap (Const.«part») ([«?BODY», «?ORG»]), ap (Const.«instance») ([«?ORG», Const.«Organism»])]) (ap (Const.«attribute») ([«?ORG», Const.«Female»])))
axiom ax_3198 : Holds (ap (Const.«instance») ([Const.«Male», Const.«SexAttribute»]))
axiom ax_3199 : Holds (ap (Const.«contraryAttribute») ([Const.«Male», Const.«Female»]))
axiom ax_3200 : ∀ («?ANIMAL» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ANIMAL», Const.«Animal»])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«SexAttribute»]), ap (Const.«attribute») ([«?ANIMAL», «?ATTR»])])))
axiom ax_3201 : Holds (ap (Const.«subclass») ([Const.«DevelopmentalAttribute», Const.«BiologicalAttribute»]))
axiom ax_3202 : Holds (ap (Const.«exhaustiveAttribute») ([Const.«DevelopmentalAttribute», Const.«FullyFormed», Const.«NonFullyFormed»]))
axiom ax_3203 : Holds (ap (Const.«instance») ([Const.«FullyFormed», Const.«DevelopmentalAttribute»]))
axiom ax_3204 : ∀ («?OBJ» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?OBJ», Const.«FullyFormed»])) (mkExists (fun («?GROWTH» : Obj) => mkAnd [ap (Const.«instance») ([«?GROWTH», Const.«Growth»]), ap (Const.«experiencer») ([«?GROWTH», «?OBJ»]), ap (Const.«holdsDuring») ([ap (Const.«BeginFn») ([ap (Const.«WhenFn») ([«?OBJ»])]), ap (Const.«attribute») ([«?OBJ», Const.«NonFullyFormed»])])])))
axiom ax_3205 : Holds (ap (Const.«instance») ([Const.«NonFullyFormed», Const.«DevelopmentalAttribute»]))
axiom ax_3206 : Holds (ap (Const.«contraryAttribute») ([Const.«NonFullyFormed», Const.«FullyFormed»]))
axiom ax_3207 : Holds (ap (Const.«successorAttribute») ([Const.«NonFullyFormed», Const.«FullyFormed»]))
axiom ax_3208 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ORG», Const.«Organism»])) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«DevelopmentalAttribute»]), ap (Const.«attribute») ([«?ORG», «?ATTR»])])))
axiom ax_3209 : Holds (ap (Const.«subAttribute») ([Const.«Larval», Const.«NonFullyFormed»]))
axiom ax_3210 : ∀ («?BIRTH» : Obj) («?BW» : Obj) («?ORG» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?ORG», Const.«Larval»])]), ap (Const.«instance») ([«?BIRTH», Const.«Birth»]), ap (Const.«equal») ([«?BW», ap (Const.«WhenFn») ([«?BIRTH»])]), ap (Const.«experiencer») ([«?BIRTH», «?ORG»])]) (ap (Const.«meetsTemporally») ([«?BW», «?TIME»])))
axiom ax_3211 : Holds (ap (Const.«subAttribute») ([Const.«Embryonic», Const.«NonFullyFormed»]))
axiom ax_3212 : Holds (ap (Const.«contraryAttribute») ([Const.«Embryonic», Const.«Larval»]))
axiom ax_3213 : ∀ («?ORG» : Obj), Holds (mkImp (ap (Const.«attribute») ([«?ORG», Const.«Embryonic»])) (mkExists (fun («?BODY» : Obj) => mkAnd [ap (Const.«instance») ([«?BODY», Const.«ReproductiveBody»]), ap (Const.«located») ([«?ORG», «?BODY»])])))
axiom ax_3214 : ∀ («?BIRTH» : Obj) («?BW» : Obj) («?ORG» : Obj) («?TIME» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?ORG», Const.«Embryonic»])]), ap (Const.«instance») ([«?BIRTH», Const.«Birth»]), ap (Const.«equal») ([«?BW», ap (Const.«WhenFn») ([«?BIRTH»])]), ap (Const.«experiencer») ([«?BIRTH», «?ORG»])]) (mkNot (ap (Const.«overlapsTemporally») ([«?TIME», «?BW»]))))
axiom ax_3215 : Holds (ap (Const.«subclass») ([Const.«DiseaseOrSyndrome», Const.«BiologicalAttribute»]))
axiom ax_3216 : Holds (ap (Const.«instance») ([Const.«ImpairedBodyPartFn», Const.«UnaryFunction»]))
axiom ax_3217 : ∀ («?F» : Obj) («?H» : Obj) («?P» : Obj) («?PI» : Obj) («?T» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?T», ap (Const.«attribute») ([«?H», ap (Const.«ImpairedBodyPartFn») ([«?P»])])]), ap (Const.«instance») ([«?PI», «?P»]), ap (Const.«part») ([«?PI», «?H»]), ap (Const.«hasPurpose») ([«?PI», «?F»])]) (ap (Const.«modalAttribute») ([mkNot («?F»), Const.«Likely»])))
axiom ax_3218 : Holds (ap (Const.«instance») ([Const.«DeadOrMissingBodyPartFn», Const.«UnaryFunction»]))
axiom ax_3219 : Holds (ap (Const.«relatedInternalConcept») ([Const.«DeadOrMissingBodyPartFn», Const.«DeadFn»]))
axiom ax_3220 : ∀ («?F» : Obj) («?H» : Obj) («?P» : Obj) («?PI» : Obj) («?T» : Obj), Holds (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?T», ap (Const.«attribute») ([«?H», ap (Const.«DeadOrMissingBodyPartFn») ([«?P»])])]), ap (Const.«instance») ([«?PI», «?P»]), ap (Const.«part») ([«?PI», «?H»]), ap (Const.«hasPurpose») ([«?PI», «?F»])]) (mkNot («?F»)))
axiom ax_3221 : Holds (ap (Const.«subclass») ([Const.«PsychologicalAttribute», Const.«BiologicalAttribute»]))
axiom ax_3222 : Holds (ap (Const.«partition») ([Const.«PsychologicalAttribute», Const.«StateOfMind», Const.«TraitAttribute»]))
axiom ax_3223 : ∀ («?ATTR» : Obj) («?ORGANISM» : Obj) («?TIME» : Obj), Holds (mkImp (ap (Const.«instance») ([«?ATTR», Const.«PsychologicalAttribute»])) (mkImp (mkAnd [ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?ORGANISM», «?ATTR»])]), ap (Const.«instance») ([«?ORGANISM», Const.«Organism»])]) (ap (Const.«holdsDuring») ([«?TIME», ap (Const.«attribute») ([«?ORGANISM», Const.«Living»])]))))
axiom ax_3224 : ∀ («?AGENT» : Obj) («?ATTR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTR», Const.«PsychologicalAttribute»]), ap (Const.«attribute») ([«?AGENT», «?ATTR»])]) (ap (Const.«instance») ([«?AGENT», Const.«SentientAgent»])))
axiom ax_3225 : Holds (ap (Const.«subclass») ([Const.«StateOfMind», Const.«PsychologicalAttribute»]))
axiom ax_3226 : Holds (ap (Const.«subclass») ([Const.«EmotionalState», Const.«StateOfMind»]))
axiom ax_3227 : ∀ («?A» : Obj), Holds (mkImp (ap (Const.«instance») ([«?A», Const.«CognitiveAgent»])) (mkExists (fun («?E» : Obj) => mkAnd [ap (Const.«instance») ([«?E», Const.«EmotionalState»]), ap (Const.«attribute») ([«?A», «?E»])])))
axiom ax_3228 : Holds (ap (Const.«subclass») ([Const.«ConsciousnessAttribute», Const.«StateOfMind»]))
axiom ax_3229 : ∀ («?AGENT» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?AGENT», Const.«SentientAgent»]), ap (Const.«attribute») ([«?AGENT», Const.«Living»])]) (mkExists (fun («?ATTR» : Obj) => mkAnd [ap (Const.«instance») ([«?ATTR», Const.«ConsciousnessAttribute»]), ap (Const.«attribute») ([«?AGENT», «?ATTR»])])))
axiom ax_3230 : ∀ («?AGENT» : Obj) («?ATTR» : Obj), Holds (mkImp (mkAnd [ap (Const.«instance») ([«?ATTR», Const.«ConsciousnessAttribute»]), ap (Const.«attribute») ([«?AGENT», «?ATTR»])]) (mkAnd [ap (Const.«instance») ([«?AGENT», Const.«SentientAgent»]), ap (Const.«attribute») ([«?AGENT», Const.«Living»])]))
axiom ax_3231 : Holds (ap (Const.«instance») ([Const.«Asleep», Const.«ConsciousnessAttribute»]))
axiom ax_3232 : Holds (ap (Const.«subclass») ([Const.«Sleeping», Const.«PsychologicalProcess»]))
axiom ax_3233 : ∀ («?H» : Obj) («?T» : Obj), Holds (mkImp (ap (Const.«holdsDuring») ([«?T», ap (Const.«attribute») ([«?H», Const.«Asleep»])])) (mkExists (fun («?S» : Obj) => mkAnd [ap (Const.«equal») ([«?T», ap (Const.«WhenFn») ([«?S»])]), ap (Const.«instance») ([«?S», Const.«Sleeping»]), ap (Const.«experiencer») ([«?S», «?H»])])))
axiom ax_3234 : Holds (ap (Const.«instance») ([Const.«Unconscious», Const.«ConsciousnessAttribute»]))
axiom ax_3235 : Holds (ap (Const.«contraryAttribute») ([Const.«Unconscious», Const.«Awake»]))
axiom ax_3236 : Holds (ap (Const.«instance») ([Const.«Awake», Const.«ConsciousnessAttribute»]))
axiom ax_3237 : ∀ («?AGENT» : Obj), Holds (mkImp (mkOr [ap (Const.«attribute») ([«?AGENT», Const.«Asleep»]), ap (Const.«attribute») ([«?AGENT», Const.«Awake»])]) (ap (Const.«attribute») ([«?AGENT», Const.«Living»])))
axiom ax_3238 : Holds (ap (Const.«subclass») ([Const.«TraitAttribute», Const.«PsychologicalAttribute»]))
axiom ax_3239 : Holds (ap (Const.«subclass») ([Const.«PsychologicalDysfunction», Const.«PsychologicalAttribute»]))
axiom ax_3240 : Holds (ap (Const.«subclass») ([Const.«PsychologicalDysfunction», Const.«DiseaseOrSyndrome»]))
axiom ax_3241 : Holds (ap (Const.«instance») ([Const.«comment», Const.«TernaryPredicate»]))
axiom ax_3242 : Holds (ap (Const.«instance») ([Const.«MakingFn», Const.«UnaryFunction»]))
axiom ax_3243 : ∀ («?X» : Obj) («?Y» : Obj), Holds (mkImp (ap (Const.«instance») ([«?X», ap (Const.«MakingFn») ([«?Y»])])) (mkExists (fun («?OBJECT» : Obj) => mkAnd [ap (Const.«instance») ([«?OBJECT», «?Y»]), ap (Const.«result») ([«?X», «?OBJECT»])])))
axiom ax_3244 : Holds (ap (Const.«instance») ([Const.«minValue», Const.«TernaryPredicate»]))
axiom ax_3245 : Holds (ap (Const.«instance») ([Const.«maxValue», Const.«TernaryPredicate»]))
axiom ax_3246 : Holds (ap (Const.«instance») ([Const.«defaultMinValue», Const.«TernaryPredicate»]))
axiom ax_3247 : ∀ («?ARG» : Obj) («?N» : Obj) («?REL» : Obj) («?VAL» : Obj) («@ARGS» : List Obj), Holds (mkImp (mkAnd [ap (Const.«defaultMinValue») ([«?REL», «?ARG», «?N»]), ap («?REL») («@ARGS»), ap (Const.«equal») ([«?VAL», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ARGS»), «?ARG»])])]) (ap (Const.«modalAttribute») ([ap (Const.«greaterThan») ([«?VAL», «?N»]), Const.«Likely»])))
axiom ax_3248 : Holds (ap (Const.«instance») ([Const.«defaultMaxValue», Const.«TernaryPredicate»]))
axiom ax_3249 : ∀ («?ARG» : Obj) («?N» : Obj) («?REL» : Obj) («?VAL» : Obj) («@ARGS» : List Obj), Holds (mkImp (mkAnd [ap (Const.«defaultMaxValue») ([«?REL», «?ARG», «?N»]), ap («?REL») («@ARGS»), ap (Const.«equal») ([«?VAL», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ARGS»), «?ARG»])])]) (ap (Const.«modalAttribute») ([ap (Const.«greaterThan») ([«?N», «?VAL»]), Const.«Likely»])))
axiom ax_3250 : Holds (ap (Const.«instance») ([Const.«defaultValue», Const.«TernaryPredicate»]))
axiom ax_3251 : ∀ («?ARG» : Obj) («?N» : Obj) («?REL» : Obj) («?VAL» : Obj) («@ARGS» : List Obj), Holds (mkImp (mkAnd [ap (Const.«defaultValue») ([«?REL», «?ARG», «?N»]), ap («?REL») («@ARGS»), ap (Const.«equal») ([«?VAL», ap (Const.«ListOrderFn») ([ap (Const.«ListFn») («@ARGS»), «?ARG»])])]) (ap (Const.«modalAttribute») ([ap (Const.«equal») ([«?N», «?VAL»]), Const.«Likely»])))
axiom ax_3252 : Holds (ap (Const.«subclass») ([Const.«ClosedWorldPredicate», Const.«Predicate»]))
axiom ax_3253 : Holds (ap (Const.«instance») ([Const.«subclass», Const.«ClosedWorldPredicate»]))
axiom ax_3254 : Holds (ap (Const.«instance») ([Const.«DeadFn», Const.«UnaryFunction»]))

end MergeAxioms

end Sumo