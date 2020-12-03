<template>
    <div class="task-item">
        <div>
            <label class="checkbox-label">
                <input
                    type="checkbox"
                    @change="$emit('update-item', task)"
                    name=""
                    :id="task.id"
                    v-model="task.done"
                />
                <span class="font-bold">
            <inertia-link :href="`/boards/${task.board_id}`">
                [{{ task.stage }}]
            </inertia-link>
        </span>
                <span>
            {{ task.title }}
        </span>
            </label>
        </div>
        <div class="actions-container flex items-center">
            <el-tooltip class="item" effect="dark" :content="task.priority" placement="left">
                <div class="inline-block mr-5">
                    {{ priorityText }}
                </div>
            </el-tooltip>
            <span class="mr-2">
            {{ durationFromMs }}
        </span>
            <button @click="$emit('item-clicked', task)" class="play-button" v-if="!task.commit_date">
                <i class="fa" :class="[isTracker ? 'fa-pause' : 'fa fa-play']"/>
            </button>
        </div>
    </div>
</template>

<script>
import Tracker from "./../timeTracker/tracker";

export default {
    props: {
        task: {
            type: Object,
            required: true
        },
        tracker: {
            type: Object
        }
    },

    computed: {
        isTracker() {
            return this.tracker && this.tracker.timeEntry.item_id == this.task.id;
        },
        durationFromMs() {
            const currentDuration = this.isTracker ? this.tracker.duration || 0 : 0;
            return Tracker.durationFromMs(this.task.duration + currentDuration);
        },
        priorityText() {
            const emojis = {
                "high": "🌟🌟🌟️",
                "medium": "🌟🌟️",
                "low": "🌟"
            }
            return this.task && emojis[this.task.priority] || "";
        }
    },
}
</script>
