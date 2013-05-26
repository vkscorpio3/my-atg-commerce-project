<dsp:form>
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.firstName"
										beanvalue="Profile.shippingAddress.firstName" size="30"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.middleName"
										beanvalue="Profile.shippingAddress.middleName" size="15"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.lastName"
										beanvalue="Profile.shippingAddress.lastName" size="30"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.address1"
										beanvalue="Profile.shippingAddress.address1" size="40"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.address2"
										size="40" type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.address2"
										beanvalue="Profile.shippingAddress.address2" size="40"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.city"
										beanvalue="Profile.shippingAddress.city" size="20"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.state"
										beanvalue="Profile.shippingAddress.state" size="10"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.postalCode"
										beanvalue="Profile.shippingAddress.postalCode" size="10"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.country"
										beanvalue="Profile.shippingAddress.country" size="20"
										type="hidden" />
									<dsp:input
										bean="ShoppingCartModifier.shippingGroup.shippingAddress.ownerId"
										beanvalue="Profile.shippingAddress.ownerId" size="20"
										type="hidden" />
									<%-- 	
										<dsp:select
											bean="ShoppingCartModifier.shippingGroup.shippingMethod">
											<dsp:droplet name="ForEach">
												<dsp:param param="availableShippingMethods" name="array" />
												<dsp:param value="method" name="elementName" />
												<dsp:oparam name="output">
													<dsp:getvalueof id="option"
														bean="ShoppingCartModifier.shippingGroup.shippingMethod"
														idtype="java.lang.String">
														<dsp:option value="<%=option%>" />
													</dsp:getvalueof>
													<dsp:valueof
														bean="ShoppingCartModifier.shippingGroup.shippingMethod" />
												</dsp:oparam>
											</dsp:droplet>
										</dsp:select>
									--%>
								</dsp:form>