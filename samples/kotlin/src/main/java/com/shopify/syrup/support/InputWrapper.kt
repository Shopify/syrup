/*
 * Syrup auto-generated support file.
 * Do not Modify this file manually.
 */
package com.shopify.syrup.support
import javax.annotation.Generated

@Generated("com.shopify.syrup")
class InputWrapper<T>() {
    private var value: T? = null
    private var defined = false

    constructor(t: T?) : this() {
        this.value = t
        this.defined = true
    }

    fun defineValue(value: T?) {
        this.value = value
        this.defined = true
    }

    fun value() = this.value

    fun isDefined() = this.defined
    override fun equals(other: Any?): Boolean {
        return (other as? InputWrapper<*>)?.let {
            it.value == value
        } ?: false
    }

    override fun hashCode(): Int {
        return this.value?.hashCode() ?: 0
    }
    override fun toString(): String {
        return value.toString()
    }
}
