import KnowledgeCollapse

/-!
# Public endpoints and axiom audit

Importing this module exposes every proved result. The commands below make the
trusted assumptions of the principal endpoints visible during validation.
-/

#print axioms KnowledgeCollapse.hasDerivAt_precisionSuccess
#print axioms KnowledgeCollapse.hasDerivAt_precisionMarginal
#print axioms KnowledgeCollapse.precisionMarginal_tendsto_atTop
#print axioms KnowledgeCollapse.hasDerivAt_baselineUtility_effort
#print axioms KnowledgeCollapse.publicEffortCrossPartial_pos
#print axioms KnowledgeCollapse.aiEffortCrossPartial_neg
#print axioms KnowledgeCollapse.baselineMarginal_public_monotone
#print axioms KnowledgeCollapse.baselineMarginal_ai_antitone
#print axioms KnowledgeCollapse.baseline_boundary_unique_best_response
#print axioms KnowledgeCollapse.extensionAiEffortCrossPartial_neg
#print axioms KnowledgeCollapse.extension_boundary_foc_exists_unique
#print axioms KnowledgeCollapse.extension_transition_from_zero_pos
#print axioms KnowledgeCollapse.zero_not_fixed_point_under_extension
