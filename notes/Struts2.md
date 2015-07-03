# Strut2 Debug <s:if>

                        <select id="groupSelect" onChange="selectGroup()" style="max-width: 70px">
                            <option value=''>All groups</option>
                            <s:iterator value="groupCombos" var="groupCombo">
                              <option <s:if test="currentUser.groupCombo == #groupCombo">selected</s:if> >
                                <s:property/>
                              </option>
                            </s:iterator>
                        </select>


/home/lplin/.m2/repository/ognl/ognl/3.0.6/ognl-3.0.6.jar!/ognl/ASTEq.class

    protected Object getValueBody(OgnlContext context, Object source) throws OgnlException {
        Object v1 = this._children[0].getValue(context, source);
        Object v2 = this._children[1].getValue(context, source);
        return OgnlOps.equal(v1, v2)?Boolean.TRUE:Boolean.FALSE;
    }
